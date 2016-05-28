//*****************************************************************************
//
// usb_host_mouse.c - main application code for the host mouse example.
//
// Copyright (c) 2008-2010 Texas Instruments Incorporated.  All rights reserved.
// Software License Agreement
// 
// Texas Instruments (TI) is supplying this software for use solely and
// exclusively on TI's microcontroller products. The software is owned by
// TI and/or its suppliers, and is protected under applicable copyright
// laws. You may not combine this software with "viral" open-source
// software in order to form a larger program.
// 
// THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
// NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
// NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
// CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
// DAMAGES, FOR ANY REASON WHATSOEVER.
// 
// This is part of AM 1808 SitaraWare   Firmware Package. modified and resued from 
// revision 6288 of the EK-LM3S3748 Firmware Package.
//
//*****************************************************************************
#include "hw_types.h"
#include "gpio.h"
#include "psc.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "raster.h"
#include "grlib.h"
#include "usblib.h"
#include "usbhid.h"
#include "usbhost.h"
#include "usbhhid.h"
#include "usbhhidmouse.h"
#include "delay.h"
#include "uartStdio.h"

//*****************************************************************************
//
//! \addtogroup example_list
//! <h1>USB HID Mouse Host (usb_host_mouse)</h1>
//!
//! This example application demonstrates how to support a USB mouse
//! attached to the evaluation kit board.  The display will show if a mouse
//! is currently connected and the current state of the buttons on the
//! on the bottom status area of the screen.  The main drawing area will show
//! a mouse cursor that can be moved around in the main area of the screen.
//! If the left mouse button is held while moving the mouse, the cursor will
//! draw on the screen.  A side effect of the application not being able to
//! read the current state of the screen is that the cursor will erase
//! anything it moves over while the left mouse button is not pressed.
//
//*****************************************************************************

//*****************************************************************************
//
// The size of the host controller's memory pool in bytes.
//
//*****************************************************************************
#define HCD_MEMORY_SIZE         128

//*****************************************************************************
//
// The memory pool to provide to the Host controller driver.
//
//*****************************************************************************
unsigned char g_pHCDPool[HCD_MEMORY_SIZE];

//*****************************************************************************
//
// The size of the mouse device interface's memory pool in bytes.
//
//*****************************************************************************
#define MOUSE_MEMORY_SIZE       128

//*****************************************************************************
//
// The memory pool to provide to the mouse device.
//
//*****************************************************************************
unsigned char g_pucMouseBuffer[MOUSE_MEMORY_SIZE];

//*****************************************************************************
//
// Declare the USB Events driver interface.
//
//*****************************************************************************
DECLARE_EVENT_DRIVER(g_sUSBEventDriver, 0, 0, USBHCDEvents);

//*****************************************************************************
//
// The global that holds all of the host drivers in use in the application.
// In this case, only the Mouse class is loaded.
//
//*****************************************************************************
static tUSBHostClassDriver const * const g_ppHostClassDrivers[] =
{
    &g_USBHIDClassDriver
    ,&g_sUSBEventDriver
};

//*****************************************************************************
//
// This global holds the number of class drivers in the g_ppHostClassDrivers
// list.
//
//*****************************************************************************
static const unsigned int g_ulNumHostClassDrivers =
    sizeof(g_ppHostClassDrivers) / sizeof(tUSBHostClassDriver *);

//*****************************************************************************
//
// Graphics context used to show text on the CSTN display.
//
//*****************************************************************************
tContext g_sContext;

#define LCD_SIZE 261156
#define LCD_CLK  150000000
#define PALETTE_SIZE 32
#define LCD_WIDTH 480
#define LCD_HEIGHT 272
#define PALETTE_OFFSET	4

// Memory that is used as the local frame buffer.
#if defined(__IAR_SYSTEMS_ICC__)
#pragma data_alignment=4
unsigned char g_pucBuffer[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];
#elif defined __TMS470__ || defined _TMS320C6X
#pragma DATA_ALIGN(g_pucBuffer, 4);
unsigned char g_pucBuffer[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];
#else
unsigned char g_pucBuffer[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)]__attribute__ ((aligned (4)));
#endif

// The graphics library display structure.
tDisplay g_sSHARP480x272x16Display;

// 32 byte Palette.
unsigned short palette_32b[PALETTE_SIZE/2] = 
			{0x4000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u,
			 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u};


//*****************************************************************************
//
// The global value used to store the mouse instance value.
//
//*****************************************************************************
static unsigned int g_ulMouseInstance;

//*****************************************************************************
//
// The global values used to store the mouse state.
//
//*****************************************************************************
static unsigned int g_ulButtons;
static tRectangle g_sCursor;

//*****************************************************************************
//
// This enumerated type is used to hold the states of the mouse.
//
//*****************************************************************************
enum
{
    //
    // No device is present.
    //
    STATE_NO_DEVICE,

    //
    // Mouse has been detected and needs to be initialized in the main
    // loop.
    //
    STATE_MOUSE_INIT,

    //
    // Mouse is connected and waiting for events.
    //
    STATE_MOUSE_CONNECTED,

    //
    // An unsupported device has been attached.
    //
    STATE_UNKNOWN_DEVICE,

    //
    // A power fault has occured.
    //
    STATE_POWER_FAULT
}
eUSBState;

//*****************************************************************************
//
// These defines are used to define the screen constraints to the application.
//
//*****************************************************************************
#define DISPLAY_BANNER_HEIGHT   23
#define DISPLAY_BANNER_BG       ClrDarkBlue
#define DISPLAY_BANNER_FG       ClrWhite
#define DISPLAY_MOUSE_BG        ClrBlack
#define DISPLAY_MOUSE_FG        ClrWhite
#define DISPLAY_MOUSE_SIZE      2

//*****************************************************************************
//
// The error routine that is called if the driver library encounters an error.
//
//*****************************************************************************
#ifdef DEBUG
void
__error__(char *pcFilename, unsigned int ulLine)
{
}
#endif

//*****************************************************************************
//
// This function updates the cursor position based on deltas received from
// the mouse device.
//
// \param iXDelta is the signed movement in the X direction.
// \param iYDelta is the signed movement in the Y direction.
//
// This function is called by the mouse handler code when it detects a change
// in the position of the mouse.  It will take the inputs and force them
// to be constrained to the display area of the screen.  If the left mouse
// button is pressed then the mouse will draw on the screen and if it is not
// it will move around normally.  A side effect of not being able to read the
// current state of the screen is that the cursor will erase anything it moves
// over while the left mouse button is not pressed.
//
// \return None.
//
//*****************************************************************************
void
UpdateCursor(int iXDelta, int iYDelta)
{
    int iTemp;

    //
    // If the left button is not pressed then erase the previous cursor
    // position.
    //
    if((g_ulButtons & 1) == 0)
    {
        //
        // Erase the previous cursor.
        //
        GrContextForegroundSet(&g_sContext, DISPLAY_MOUSE_BG);
        GrRectFill(&g_sContext, &g_sCursor);
    }

    //
    // Need to do signed math so use the temporary signed value.
    //
    iTemp = g_sCursor.sXMin;

    //
    // Update the X position without going off the screen.
    //
    if(((int)g_sCursor.sXMin + iXDelta + DISPLAY_MOUSE_SIZE) <
       GrContextDpyWidthGet(&g_sContext))
    {
        //
        // Update the X cursor position.
        //
        iTemp += iXDelta;

        //
        // Don't let the cursor go off the left of the screen either.
        //
        if(iTemp < 0)
        {
            iTemp = 0;
        }
    }

    //
    // Update the X position.
    //
    g_sCursor.sXMin = iTemp;
    g_sCursor.sXMax = iTemp + DISPLAY_MOUSE_SIZE;

    //
    // Need to do signed math so use the temporary signed value.
    //
    iTemp = g_sCursor.sYMin;

    //
    // Update the Y position without going off the screen.
    //
    if(((int)g_sCursor.sYMin + iYDelta) < (GrContextDpyHeightGet(&g_sContext) -
       DISPLAY_BANNER_HEIGHT - (DISPLAY_MOUSE_SIZE+1)))
    {
        //
        // Update the Y cursor position.
        //
        iTemp += iYDelta;

        //
        // Don't let the cursor overwrite the status area of the screen.
        //
        if(iTemp < DISPLAY_BANNER_HEIGHT + 1)
        {
            iTemp = DISPLAY_BANNER_HEIGHT + 1;
        }
    }

    //
    // Update the Y position.
    //
    g_sCursor.sYMin = iTemp;
    g_sCursor.sYMax = iTemp + DISPLAY_MOUSE_SIZE; 	

    //
    // Draw the new cursor.
    //
    GrContextForegroundSet(&g_sContext, DISPLAY_MOUSE_FG);
    GrRectFill(&g_sContext, &g_sCursor);
}

//*****************************************************************************
//
// This function will update the small mouse button indicators in the status
// bar area of the screen.  This can be called on its own or it will be called
// whenever UpdateStatus() is called as well.
//
//*****************************************************************************
void
UpdateButtons(void)
{
    tRectangle sRect;
    int iButton;

    //
    // Initialize the button indicator.
    //
    sRect.sXMin = GrContextDpyWidthGet(&g_sContext) - 35;
    sRect.sYMin = GrContextDpyHeightGet(&g_sContext) - 18;
    sRect.sXMax = sRect.sXMin + 8;
    sRect.sYMax = sRect.sYMin + 14;

    //
    // Check all three buttons.
    //
    for(iButton = 0; iButton < 3; iButton++)
    {
        //
        // Draw the button indicator red if pressed and black if not pressed.
        //
        if(g_ulButtons & (1 << iButton))
        {
            GrContextForegroundSet(&g_sContext, ClrRed);
        }
        else
        {
            GrContextForegroundSet(&g_sContext, ClrBlack);
        }

        //
        // Draw the back of the  button indicator.
        //
        GrRectFill(&g_sContext, &sRect);

        //
        // Draw the border on the button indicator.
        //
        GrContextForegroundSet(&g_sContext, ClrWhite);
        GrRectDraw(&g_sContext, &sRect);

        //
        // Move to the next button indicator position.
        //
        sRect.sXMin += 10;
        sRect.sXMax += 10;
    }
}

//*****************************************************************************
//
// This function updates the status area of the screen.  It uses the current
// state of the application to print the status bar.
//
//*****************************************************************************
void
UpdateStatus(void)
{
    tRectangle sRect;
	static int USBState = -1;

	if(USBState != eUSBState)
	{
		//
	    // Fill the bottom rows of the screen with blue to create the status area.
	    //
	    sRect.sXMin = 0;
	    sRect.sYMin = GrContextDpyHeightGet(&g_sContext) -
	                  DISPLAY_BANNER_HEIGHT - 1;
	    sRect.sXMax = GrContextDpyWidthGet(&g_sContext) - 1;
	    sRect.sYMax = sRect.sYMin + DISPLAY_BANNER_HEIGHT;

	    //
	    // Draw the background of the banner.
	    //
	    GrContextForegroundSet(&g_sContext, DISPLAY_BANNER_BG);
	    GrRectFill(&g_sContext, &sRect);

	    //
	    // Put a white box around the banner.
	    //
	    GrContextForegroundSet(&g_sContext, DISPLAY_BANNER_FG);
	    GrRectDraw(&g_sContext, &sRect);

	    //
	    // Put the application name in the middle of the banner.
	    //
	    GrContextFontSet(&g_sContext, &g_sFontCm20);

	    //
	    // Update the status on the screen.
	    //
	    if(eUSBState == STATE_NO_DEVICE)
	    {
	        //
	        // mouse is currently disconnected.
	        //
	        GrStringDraw(&g_sContext, "No Device", -1, 4, sRect.sYMin + 4, 0);
	    }
	    else if(eUSBState == STATE_MOUSE_CONNECTED)
	    {
	        //
	        // mouse is connected.
	        //
	        GrStringDraw(&g_sContext, "Connected", -1, 4, sRect.sYMin + 4, 0);
	    }
	    else if(eUSBState == STATE_UNKNOWN_DEVICE)
	    {
	        //
	        // mouse is connected.
	        //
	        GrStringDraw(&g_sContext, "Unknown Device", -1, 4, sRect.sYMin + 4, 0);
	    }
	    else if(eUSBState == STATE_POWER_FAULT)
	    {
	        //
	        // mouse is connected.
	        //
	        GrStringDraw(&g_sContext, "Power Fault", -1, 4, sRect.sYMin + 4, 0);
	    }

		USBState = eUSBState;
	}
	
    UpdateButtons();
}



/*
** For each end of frame interrupt base and ceiling is reconfigured 
*/
static void LCDIsr(void)
{
    unsigned int  status;

    IntSystemStatusClear(SYS_INT_LCDINT);

    status = RasterIntStatus(SOC_LCDC_0_REGS,RASTER_END_OF_FRAME0_INT_STAT |
                                             RASTER_END_OF_FRAME1_INT_STAT );

    status = RasterClearGetIntStatus(SOC_LCDC_0_REGS, status);    
}

static void SetupAINTCInt(void)
{
    /* Initialize the ARM Interrupt Controller(AINTC). */
    IntAINTCInit();

    /* Enable IRQ in CPSR.*/     
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();

}


/*
** Configures raster to display image 
*/
static void SetUpLCD(void)
{
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_LCDC, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    LCDPinMuxSetup();

    /* disable raster */
    RasterDisable(SOC_LCDC_0_REGS);
    
    /* configure the pclk */
    RasterClkConfig(SOC_LCDC_0_REGS, 7833600, LCD_CLK);

    /* configuring DMA of LCD controller */ 
    RasterDMAConfig(SOC_LCDC_0_REGS, RASTER_DOUBLE_FRAME_BUFFER,
                    RASTER_BURST_SIZE_16, RASTER_FIFO_THRESHOLD_8,
                    RASTER_BIG_ENDIAN_DISABLE);

    /* configuring modes(ex:tft or stn,color or monochrome etc) for raster controller */
    RasterModeConfig(SOC_LCDC_0_REGS, RASTER_DISPLAY_MODE_TFT,
                     RASTER_PALETTE_DATA, RASTER_COLOR, RASTER_RIGHT_ALIGNED);

    /* frame buffer data is ordered from least to Most significant bye */
    RasterLSBDataOrderSelect(SOC_LCDC_0_REGS);
    
    /* disable nibble mode */
    RasterNibbleModeDisable(SOC_LCDC_0_REGS);
   
     /* configuring the polarity of timing parameters of raster controller */
    RasterTiming2Configure(SOC_LCDC_0_REGS, RASTER_FRAME_CLOCK_LOW |
                                            RASTER_LINE_CLOCK_LOW  |
                                            RASTER_PIXEL_CLOCK_LOW |
                                            RASTER_SYNC_EDGE_RISING|
                                            RASTER_SYNC_CTRL_ACTIVE|
                                            RASTER_AC_BIAS_HIGH     , 0, 255);

    /* configuring horizontal timing parameter */
   RasterHparamConfig(SOC_LCDC_0_REGS, 480, 41, 2, 2);

    /* configuring vertical timing parameters */
   RasterVparamConfig(SOC_LCDC_0_REGS, 272, 10, 3, 3);

   /* configuring fifo delay to */
   RasterFIFODMADelayConfig(SOC_LCDC_0_REGS, 2);
}

/*
** configures arm interrupt controller to generate raster interrupt 
*/
static void SetupIntc(void)
{
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_LCDINT, LCDIsr);

    /* Set the channnel number 2 of AINTC for LCD system interrupt.
     */
    IntChannelSet(SYS_INT_LCDINT, 4);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_LCDINT);

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}


//
// \brief  This function confiugres the AINTC to receive UART interrupts.
// 
static void ConfigureAINTCIntUSB(void)
{
	//
	// Registers the UARTIsr in the Interrupt Vector Table of AINTC.
	// The event number of UART2 interrupt is 61.
	//
	IntRegister(SYS_INT_USB0, USB0HostIntHandler);

	//
	// Map the channel number 2 of AINTC to system interrupt 61.
	// Channel number 2 of AINTC is mapped to IRQ interrupt of ARM9 processor.
	//
	IntChannelSet(SYS_INT_USB0, 2);

	//
	//Enable the system interrupt number 61 in AINTC.
	//
	IntSystemEnable(SYS_INT_USB0);

	
}


//*****************************************************************************
//
// This is the generic callback from host stack.
//
// \param pvData is actually a pointer to a tEventInfo structure.
//
// This function will be called to inform the application when a USB event has
// occured that is outside those releated to the mouse device.  At this
// point this is used to detect unsupported devices being inserted and removed.
// It is also used to inform the application when a power fault has occured.
// This function is required when the g_USBGenericEventDriver is included in
// the host controller driver array that is passed in to the
// USBHCDRegisterDrivers() function.
//
// \return None.
//
//*****************************************************************************
void
USBHCDEvents(void *pvData)
{
    tEventInfo *pEventInfo;

    //
    // Cast this pointer to its actual type.
    //
    pEventInfo = (tEventInfo *)pvData;

    switch(pEventInfo->ulEvent)
    {
        //
        // New mouse detected.
        //
        case USB_EVENT_CONNECTED:
        {
            //
            // An unknown device was detected.
            //
            eUSBState = STATE_UNKNOWN_DEVICE;

           	UpdateStatus();
            break;
        }

        //
        // Keyboard has been unplugged.
        //
        case USB_EVENT_DISCONNECTED:
        {
            //
            // Unknown device has been removed.
            //
            eUSBState = STATE_NO_DEVICE;

            UpdateStatus();
            break;
        }
		
        default:
        {
            break;
        }
    }
}

//*****************************************************************************
//
// This is the callback from the USB HID mouse handler.
//
// \param pvCBData is ignored by this function.
// \param ulEvent is one of the valid events for a mouse device.
// \param ulMsgParam is defined by the event that occurs.
// \param pvMsgData is a pointer to data that is defined by the event that
// occurs.
//
// This function will be called to inform the application when a mouse has
// been plugged in or removed and anytime mouse movement or button pressed
// is detected.
//
// \return This function will return 0.
//
//*****************************************************************************
unsigned int
MouseCallback(void *pvCBData, unsigned int ulEvent, unsigned int ulMsgParam,
              void *pvMsgData)
{
    switch(ulEvent)
    {
        //
        // New mouse detected.
        //
        case USB_EVENT_CONNECTED:
        {      

            //
            // Proceed to the STATE_MOUSE_INIT state so that the main loop can
            // finish initialized the mouse since USBHMouseInit() cannot be
            // called from within a callback.
            //
            eUSBState = STATE_MOUSE_INIT;

            break;
        }

        //
        // Mouse has been unplugged.
        //
        case USB_EVENT_DISCONNECTED:
        {
			//
            // Change the state so that the main loop knows that the mouse is
            // no longer present.
            //
            eUSBState = STATE_NO_DEVICE;

            //
            // Reset the button state.
            //
            g_ulButtons = 0;

            break;
        }

        //
        // Mouse button press detected.
        //
        case USBH_EVENT_HID_MS_PRESS:
        {            
            //
            // Save the new button that was pressed.
            //
            g_ulButtons |= ulMsgParam;

            break;
        }

        //
        // Mouse button release detected.
        //
        case USBH_EVENT_HID_MS_REL:
        {           
            //
            // Remove the button from the pressed state.
            //
            g_ulButtons &= ~ulMsgParam;

            break;
        }

        //
        // Mouse X movement detected.
        //
        case USBH_EVENT_HID_MS_X:
        {
            //
            // Update the cursor on the screen.
            //
           	UpdateCursor((signed char)ulMsgParam, 0);

            break;
        }

        //
        // Mouse Y movement detected.
        //
        case USBH_EVENT_HID_MS_Y:
        {
            //
            // Update the cursor on the screen.
            //
           	UpdateCursor(0, (signed char)ulMsgParam);

            break;
        }
    }

    //
    // Update the status area of the screen.
    //
   	UpdateStatus();

    return(0);
}

//*****************************************************************************
//
// This is the main loop that runs the application.
//
//*****************************************************************************
int
main(void)
{
   	tRectangle sRect;
    unsigned int i;
	unsigned char *src, *dest;

	//
	//configures arm interrupt controller to generate raster interrupt 
	//
	SetupIntc();

	//
	//Configures raster to display image 
	//
	SetUpLCD();

	/* configuring the base ceiling */
	RasterDMAFBConfig(SOC_LCDC_0_REGS, 
					  (unsigned int)(g_pucBuffer+PALETTE_OFFSET),
					  (unsigned int)(g_pucBuffer+PALETTE_OFFSET) + sizeof(g_pucBuffer) - 2 - PALETTE_OFFSET,
					  0);

	RasterDMAFBConfig(SOC_LCDC_0_REGS, 
					  (unsigned int)(g_pucBuffer+PALETTE_OFFSET),
					  (unsigned int)(g_pucBuffer+PALETTE_OFFSET) + sizeof(g_pucBuffer) - 2 - PALETTE_OFFSET,
					  1);

	// Copy palette info into buffer
	src = (unsigned char *) palette_32b;
	dest = (unsigned char *) (g_pucBuffer+PALETTE_OFFSET);
	
	for( i = 4; i < (PALETTE_SIZE+4); i++)
	{
		*dest++ = *src++;
	}

	GrOffScreen16BPPInit(&g_sSHARP480x272x16Display, g_pucBuffer, LCD_WIDTH, LCD_HEIGHT);
  	GrContextInit(&g_sContext, &g_sSHARP480x272x16Display);

	/* enable End of frame interrupt */
	RasterEndOfFrameIntEnable(SOC_LCDC_0_REGS);

	/* enable raster */
	RasterEnable(SOC_LCDC_0_REGS);
	ConfigRasterDisplayEnable();

    //
    // Fill the top 15 rows of the screen with blue to create the banner.
    //
    sRect.sXMin = 0;
  	sRect.sYMin = 0;
    sRect.sXMax = GrContextDpyWidthGet(&g_sContext) - 1;
    sRect.sYMax = DISPLAY_BANNER_HEIGHT;

    //
    // Set the banner background.
    //
    GrContextForegroundSet(&g_sContext, DISPLAY_BANNER_BG);
    GrRectFill(&g_sContext, &sRect);

    //
    // Put a white box around the banner.
    //
    GrContextForegroundSet(&g_sContext, DISPLAY_BANNER_FG);
    GrRectDraw(&g_sContext, &sRect);

    //
    // Put the application name in the middle of the banner.
    //
    GrContextFontSet(&g_sContext, &g_sFontCm20);
    GrStringDrawCentered(&g_sContext, "usb_host_mouse", -1,
                         GrContextDpyWidthGet(&g_sContext) / 2, 10, 0);

	//
	//Setup the AINT Controller
	//
	SetupAINTCInt(); 

	ConfigureAINTCIntUSB();
	
	DelayTimerSetup();

	//
    // Register the host class drivers.
    //
    USBHCDRegisterDrivers(0, g_ppHostClassDrivers, g_ulNumHostClassDrivers);

    //
    // Initialized the cursor.
    //
	g_ulButtons = 0;
	g_sCursor.sXMin = GrContextDpyWidthGet(&g_sContext) / 2;
	g_sCursor.sXMax = g_sCursor.sXMin + DISPLAY_MOUSE_SIZE;
	g_sCursor.sYMin = GrContextDpyHeightGet(&g_sContext) / 2;
	g_sCursor.sYMax = g_sCursor.sYMin + DISPLAY_MOUSE_SIZE;

    //
    // Update the status on the screen.
    //
    UpdateStatus();

	//
	//  Update the cursor once to display it.
	//
	UpdateCursor(0, 0);	 

    //
    // Open an instance of the mouse driver.  The mouse does not need
    // to be present at this time, this just saves a place for it and allows
    // the applications to be notified when a mouse is present.
    //
    g_ulMouseInstance =
        USBHMouseOpen(MouseCallback, g_pucMouseBuffer, MOUSE_MEMORY_SIZE);

    //
    // Initialize the power configuration. This sets the power enable signal
    // to be active high and does not enable the power fault.
    //
    USBHCDPowerConfigInit(0, USBHCD_VBUS_AUTO_HIGH);

    //
    // Initialize the host controller stack.
    //
    USBHCDInit(0, g_pHCDPool, HCD_MEMORY_SIZE);

    //
    // Call the main loop for the Host controller driver.
    //
    USBHCDMain();

    //
    // The main loop for the application.
    //
    while(1)
    {
        switch(eUSBState)
        {
            //
            // This state is entered when the mouse is first detected.
            //
            case STATE_MOUSE_INIT:
            {
                //
                // Initialize the newly connected mouse.
                //
                USBHMouseInit(g_ulMouseInstance);

                //
                // Proceed to the mouse connected state.
                //
                eUSBState = STATE_MOUSE_CONNECTED;

                //
                // Update the status on the screen.
                //
                UpdateStatus();

                break;
            }
            case STATE_MOUSE_CONNECTED:
            {
                //
                // Nothing is currently done in the main loop when the mouse
                // is connected.
                //
                break;
            }
            case STATE_NO_DEVICE:
            {
                //
                // The mouse is not connected so nothing needs to be done here.
                //
                break;
            }
            default:
            {
                break;
            }
        }

        //
        // Periodically call the main loop for the Host controller driver.
        //
        USBHCDMain();
    }
}
