//*****************************************************************************
//
// usb_dev_mouse.c - Main routines for the enumeration example.
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
// This is part of AM1808 Sitaraware firmware package, modified and reused from revision 6288 
// of the DK-LM3S9B96 Firmware Package.
//
//*****************************************************************************

#include "raster.h"
#include "psc.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "touch.h"
#include "i2c.h"
#include "grlib.h"
#include "widget.h"
#include "canvas.h"
#include "pushbutton.h"
#include "checkbox.h"
#include "radiobutton.h"
#include "container.h"
#include "slider.h"
#include "debug.h"
#include "usblib.h"
#include "usbhid.h"
#include "usb-ids.h"
#include "usbdevice.h"
#include "usbdhid.h"
#include "usbdhidmouse.h"
#include "usb_mouse_structs.h"
#include "delay.h"

/******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/

//Input clock to LCD module
#define LCD_CLK  150000000

#define PALETTE_SIZE 32
#define LCD_WIDTH 480
#define LCD_HEIGHT 272
#define PALETTE_OFFSET	4


//Used to set the mode of PMIC asread pressure mode
#define MODE_PRESSURE 2 

// Numer of pressure reads that going to perform.  This is required to avoid the debouncing effect
#define DEBOUNCE_READ 15

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
// Graphics context used to show text on the color STN display.
//
//*****************************************************************************
tContext g_sContext;

//*****************************************************************************
//
// Holds the current state of the push button - pressed or not.
//
//*****************************************************************************
static volatile unsigned char g_ucButtons;

unsigned int timerIsrFlag = FALSE;
extern void (*I2CpFunc)(void);

//*****************************************************************************
//
// This structure defines the area of the display that is devoted to a
// mouse button.  Touchscreen input in this area is translated into press and
// release messages for the given button.
//
//*****************************************************************************
typedef struct
{
    const char *pszLabel;
    unsigned short usX;
    unsigned short usWidth;
    unsigned char  ucReportFlag;
}
tMouseButtonArea;

//*****************************************************************************
//
// The height of the mouse button bar at the bottom of the display and the
// number of buttons it contains.
//
//*****************************************************************************
#define BUTTON_HEIGHT 50
#define NUM_MOUSE_BUTTONS 3

//*****************************************************************************
//
// Definitions of the positions and labels for each of the three mouse buttons.
//
//*****************************************************************************
static tMouseButtonArea g_sMouseButtons[NUM_MOUSE_BUTTONS] =
{
    { "Left Button", 0,   160, MOUSE_REPORT_BUTTON_1 },
    { "Center Button", 159, 161, MOUSE_REPORT_BUTTON_3 },
    { "Right Button", 319, 160, MOUSE_REPORT_BUTTON_2 }
};


//*****************************************************************************
//
// Holds command bits used to signal the main loop to perform various tasks.
//
//*****************************************************************************
volatile unsigned int g_ulCommands;

//*****************************************************************************
//
// A flag used to indicate whether or not we are currently connected to the USB
// host.
//
//*****************************************************************************
volatile tBoolean bConnected;

//*****************************************************************************
//
// Global system tick counter holds elapsed time since the application started
// expressed in 100ths of a second.
//
//*****************************************************************************
volatile unsigned int g_ulSysTickCount;

//*****************************************************************************
//
// Holds the previous press position for the touchscreen.
//
//*****************************************************************************
static volatile int g_lScreenStartX;
static volatile int g_lScreenStartY;

//*****************************************************************************
//
// Holds the current press position for the touchscreen.
//
static int g_lScreenX;
static int g_lScreenY;
unsigned short int g_iTouch=0;

//*****************************************************************************
//
// This enumeration holds the various states that the mouse can be in during
// normal operation.
//
//*****************************************************************************
volatile enum
{
    //
    // Unconfigured.
    //
    MOUSE_STATE_UNCONFIGURED,

    //
    // No keys to send and not waiting on data.
    //
    MOUSE_STATE_IDLE,

    //
    // Waiting on data to be sent out.
    //
    MOUSE_STATE_SENDING
}
g_eMouseState = MOUSE_STATE_UNCONFIGURED;

//*****************************************************************************
//
// This function updates the color STN display to show button state.
//
// This function is called from ButtonHandler to update the display showing
// the state of each of the buttons.
//
// Returns None.
//
//*****************************************************************************
void
UpdateDisplay(unsigned char ucButtons, tBoolean bRedraw)
{
    unsigned int ulLoop;
    tRectangle sRect, sRectOutline;
    static unsigned char ucLastButtons;

    //
    // Initialize the Y coordinates of the button rectangle.
    //
    sRectOutline.sYMin = GrContextDpyHeightGet(&g_sContext) - BUTTON_HEIGHT;
    sRectOutline.sYMax = GrContextDpyHeightGet(&g_sContext) - 1;
    sRect.sYMin = sRectOutline.sYMin + 1;
    sRect.sYMax = sRectOutline.sYMax - 1;

    //
    // Set the font we use for the button text.
    //
    GrContextFontSet(&g_sContext, &g_sFontCmss18);

    //
    // Loop through each of the mouse buttons, drawing each in turn.
    //
    for(ulLoop = 0; ulLoop < NUM_MOUSE_BUTTONS; ulLoop++)
    {
        //
        // Draw the outline if we are redrawing the whole button area.
        //
        if(bRedraw)
        {
            GrContextForegroundSet(&g_sContext, ClrWhite);

            sRectOutline.sXMin = g_sMouseButtons[ulLoop].usX;
            sRectOutline.sXMax = (sRectOutline.sXMin +
                                 g_sMouseButtons[ulLoop].usWidth) - 1;

            GrRectDraw(&g_sContext, &sRectOutline);
        }

        //
        // Has the button state changed since we last drew it or are we
        // drawing the buttons unconditionally?
        //
        if(((g_ucButtons & g_sMouseButtons[ulLoop].ucReportFlag) !=
           (ucLastButtons & g_sMouseButtons[ulLoop].ucReportFlag)) || bRedraw)
        {
            //
            // Set the appropriate button color depending upon whether the
            // button is pressed or not.
            //
            GrContextForegroundSet(&g_sContext, ((g_ucButtons &
                                   g_sMouseButtons[ulLoop].ucReportFlag) ?
                                   ClrRed : ClrGreen));

            sRect.sXMin = g_sMouseButtons[ulLoop].usX + 1;
            sRect.sXMax = (sRect.sXMin + g_sMouseButtons[ulLoop].usWidth) - 3;
            GrRectFill(&g_sContext, &sRect);

            //
            // Draw the button text.
            //
            GrContextForegroundSet(&g_sContext, ClrWhite);
            GrStringDrawCentered(&g_sContext, g_sMouseButtons[ulLoop].pszLabel,
                                 -1, (sRect.sXMin + sRect.sXMax) / 2,
                                 (sRect.sYMin + sRect.sYMax) / 2, 0);
        }
    }

    //
    // Remember the button state we just drew.
    //
    ucLastButtons = ucButtons;
}

//*****************************************************************************
//
// This function handles updates due to touchscreen input.
//
// This function is called periodically from the main loop to check the
// touchscreen state and, if necessary, send a HID report back to the host
// system.
//
// Returns Returns \b true on success or \b false if an error is detected.
//
//*****************************************************************************
static void
TouchHandler(void)
{
    short lDeltaX = 0;
    short lDeltaY = 0;
	unsigned int ulLoop;
	static unsigned char ucButtons = 0;
	char cTempx,cTempy;
	int j =0; 

	g_ucButtons = 0;

	//
	//Is someone touching the screen
	//
	if(g_iTouch)
	{

		//
        //If touched,  Reset our start position.
        //
		lDeltaX =0;
		lDeltaY =0;

		//
        //Read the values before procceeding. This is to avoid the rebouncing effect.
        //
		for(j = 0; j < DEBOUNCE_READ; j++)
		{
			ReadAxis(MODE_PRESSURE,&cTempx,&cTempy);
			g_iTouch = (unsigned short int)cTempy;			
		}
		g_iTouch = 0;
	}

	//
	//If movement started 
	//

	else
	{	
			//
			//Read the touch value once again to confirm that there is a real movement 
			//
			ReadAxis(MODE_PRESSURE,&cTempx,&cTempy);
			g_iTouch = (unsigned short int)cTempy;

			//
			//If there is real movement, then calculate the delta
			//
			if(g_iTouch)
			{

				//
				// Calculate how far we moved since the last time we checked.  
				//
				lDeltaX = g_lScreenX;
				lDeltaY = g_lScreenY;
				lDeltaX -= g_lScreenStartX;
				lDeltaY -= g_lScreenStartY;
				g_iTouch = 0;
			}
			//
			//There is no movement, so reset the co-ordinates
			//
			else
			{
				lDeltaX =0;
				lDeltaY =0;
			}
		
	}

	//
	// Is the press within the button area?  If so, determine which
	// button has been pressed.
	//
	if(g_lScreenY >= (GrContextDpyHeightGet(&g_sContext) - BUTTON_HEIGHT))
	{
		lDeltaX =0;
		lDeltaY =0;
		//
		// Run through the list of buttons to determine which one was
		// pressed.
		//
		for(ulLoop = 0; ulLoop < NUM_MOUSE_BUTTONS; ulLoop++)
		{
			if((g_lScreenX >= g_sMouseButtons[ulLoop].usX) &&
			   (g_lScreenX < (g_sMouseButtons[ulLoop].usX +
				g_sMouseButtons[ulLoop].usWidth)))
			{
				g_ucButtons |= g_sMouseButtons[ulLoop].ucReportFlag;
				break;
			}
		}
	}

	//
	//Store the current x and y, we need it to calculate the delta
	//
	g_lScreenStartX = g_lScreenX;
	g_lScreenStartY = g_lScreenY;

    //
    // Was there any movement or change in button state?
    //
   	if(lDeltaX || lDeltaY || (ucButtons != g_ucButtons))
    {
        //
        // Yes - send a report back to the host after clipping the deltas
        // to the maximum we can support.
        //
        lDeltaX = (lDeltaX > 127) ? 127 : lDeltaX;
        lDeltaX = (lDeltaX < -128) ? -128 : lDeltaX;
        lDeltaY = (lDeltaY > 127) ? 127 : lDeltaY;
        lDeltaY = (lDeltaY < -128) ? -128 : lDeltaY;

        //
        // Remember the current button state.
        //
        ucButtons = g_ucButtons;

		//
        // Send the report back to the host.
        //
        USBDHIDMouseStateChange((void *)&g_sMouseDevice,
                                (char)lDeltaX, (char)lDeltaY,
                                ucButtons);
    }

	//
	// Update the button portion of the display.
	//   
	UpdateDisplay(ucButtons, false);
}

//*****************************************************************************
//
//  This is the callback from the USB device HID mouse class driver.
//
// \param pvCBData is ignored by this function.
// \param ulEvent is one of the valid events for a mouse device.
// \param ulMsgParam is defined by the event that occurs.
// \param pvMsgData is a pointer to data that is defined by the event that
// occurs.
//
// This function will be called to inform the application when a change occurs
// during operation as a HID class USB mouse device.
//
// \return This function will return 0.
//
//*****************************************************************************
unsigned int
MouseHandler(void *pvCBData, unsigned int ulEvent,
             unsigned int ulMsgData, void *pvMsgData)
{
    switch(ulEvent)
    {
        //
        // The USB host has connected to and configured the device.
        //
        case USB_EVENT_CONNECTED:
        {
            g_eMouseState = MOUSE_STATE_IDLE;
            bConnected = true;
            break;
        }

        //
        // The USB host has disconnected from the device.
        //
        case USB_EVENT_DISCONNECTED:
        {
            bConnected = false;
            g_eMouseState = MOUSE_STATE_UNCONFIGURED;
            break;
        }

        //
        // A report was sent to the host. We are free to send another.
        //
        case USB_EVENT_TX_COMPLETE:
        {
            g_eMouseState = MOUSE_STATE_IDLE;
            break;
        }

    }
    return(0);
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


void I2CIsr(void)
{
    (*I2CpFunc)();
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
    IntChannelSet(SYS_INT_LCDINT, 2);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_LCDINT);

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

void ConfigureAINTCIntI2C(void)
{
    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_I2CINT0, I2CIsr);

    IntChannelSet(SYS_INT_I2CINT0, 3);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_I2CINT0);
}

void I2CSetup(void)
{
    I2CPinMuxSetup(0);

    /* Put i2c in reset/disabled state */
    I2CMasterDisable(SOC_I2C_0_REGS);

    /* Configure i2c bus speed to 100khz */
    I2CMasterInitExpClk(SOC_I2C_0_REGS, 24000000, 8000000, 100000);

    /* Set i2c slave address */
    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, 0x48);
    ConfigureAINTCIntI2C();
}

static void PeripheralsSetup(void)
{
    I2CSetup();
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

	IntRegister(SYS_INT_USB0, USB0DeviceIntHandler);

	//
	// Map the channel number 2 of AINTC to system interrupt 61.
	// Channel number 2 of AINTC is mapped to IRQ interrupt of ARM9 processor.
	//
	IntChannelSet(SYS_INT_USB0, 4);

	//
	//Enable the system interrupt number 61 in AINTC.
	//
	IntSystemEnable(SYS_INT_USB0);
}

int main(void)
{
    tRectangle sRect;
	unsigned short int iPressure=0;
	unsigned int i = 0;
	unsigned char *src = (unsigned char *) palette_32b;
	unsigned char *dest = (unsigned char *) (g_pucBuffer+4);
	char cTempx,cTempy;	

	/* configures arm interrupt controller to generate raster interrupt */
	SetupIntc();

	/* Configures raster to display image */
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
	for( i = 4; i < (PALETTE_SIZE+4); i++)
	{
		*dest++ = *src++;
	}

	GrOffScreen16BPPInit(&g_sSHARP480x272x16Display, g_pucBuffer, LCD_WIDTH, LCD_HEIGHT);
	
	// Initialize a drawing context.
	GrContextInit(&g_sContext, &g_sSHARP480x272x16Display);

    /* enable End of frame interrupt */
    RasterEndOfFrameIntEnable(SOC_LCDC_0_REGS);

    /* enable raster */
    RasterEnable(SOC_LCDC_0_REGS);
	ConfigRasterDisplayEnable();

	//
    // Fill the top 24 rows of the screen with blue to create the banner.
    //
    sRect.sXMin = 0;
    sRect.sYMin = 0;
    sRect.sXMax = GrContextDpyWidthGet(&g_sContext) - 1;
    sRect.sYMax = 23;
    GrContextForegroundSet(&g_sContext, ClrDarkBlue);
    GrRectFill(&g_sContext, &sRect);

	
    //
    // Put a white box around the banner.
    //
    GrContextForegroundSet(&g_sContext, ClrWhite);
    GrRectDraw(&g_sContext, &sRect);

	//
    // Put the application name in the middle of the banner.
    //
    GrContextFontSet(&g_sContext, &g_sFontCm20);
    GrStringDrawCentered(&g_sContext, "usb-dev-mouse", -1,
                         GrContextDpyWidthGet(&g_sContext) / 2, 10, 0);


	//
    // Fill the top 24 rows of the screen with blue to create the banner.
    //
    sRect.sXMin = 0;
    sRect.sYMin = 25;
    sRect.sXMax = GrContextDpyWidthGet(&g_sContext) - 1;
    sRect.sYMax = GrContextDpyHeightGet(&g_sContext) - BUTTON_HEIGHT - 2;
    GrContextForegroundSet(&g_sContext, ClrDarkGray);
    GrRectFill(&g_sContext, &sRect);


    //
    // Put a white box around the banner.
    //
    GrContextForegroundSet(&g_sContext, ClrRed);
    GrRectDraw(&g_sContext, &sRect);

    //
    // Draw the buttons in their initial (unpressed)state.
    //
    UpdateDisplay(g_ucButtons, true);
	
	//
	// TS init
	//
	PeripheralsSetup();
	InitTouchScreen();

	//
	// Configure the USB Interrupts 
	//
	ConfigureAINTCIntUSB();
	DelayTimerSetup();
	//
	// Initialize the mouse
	//
	USBDHIDMouseInit(0, (tUSBDHIDMouseDevice *)&g_sMouseDevice);

	//
	// Drop into the main loop.
	//
	while(1)
	{
		//
		// Wait for USB configuration to complete.
		//
		while(!bConnected)
		{
		}

		//
		//Wait till someone touches the screen
		//
		while(!g_iTouch)
		{

			//
			//Read the pressure to check if someone touched.
			//
			ReadAxis(MODE_PRESSURE,&cTempx,&cTempy);
			iPressure = g_iTouch = (unsigned short int)cTempy;			
		}

		//
		//Loop here as long as someone moving the finger/stylus on the touch screen
		//
		do
		{
			//
			//read the pressure value to make sure that still touhing
			//
			ReadAxis(MODE_PRESSURE,&cTempx,&cTempy);
			iPressure = (unsigned short int)cTempy;			

			//
			//If so, read the x and Y vlaue and give it to touch handler
			//
			ResolveCoordinates(&g_lScreenX, &g_lScreenY);
			TouchHandler();
			
		}while(iPressure); 
		g_iTouch =0;
	}
}

