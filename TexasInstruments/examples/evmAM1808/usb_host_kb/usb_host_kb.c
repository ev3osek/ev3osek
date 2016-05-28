//*****************************************************************************
//
// usb_host_kb.c - main application code for the host mouse example.
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
// This is part of AM1808 StarterWare firmware package, modified and reused
// from revision 6288 of the DK-LM3S9B96 Firmware Package.
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
#include "usbhhidkeyboard.h"
#include "delay.h"
#include "uartStdio.h"

//*****************************************************************************
//
//! \addtogroup example_list
//! <h1>USB HID Keyboard Host (usb_host_keyboard)</h1>
//!
//! This example application demonstrates how to support a USB keyboard
//! attached to the evaluation kit board.  The display will show if a keyboard
//! is currently connected and the current state of the Caps Lock key on the
//! keyboard that is connected on the bottom status area of the screen.
//! Pressing any keys on the keyboard will cause them to be printed on the
//! screen and to be sent out the UART at 115200 baud with no parity, 8 bits
//! and 1 stop bit.  Any keyboard that supports the USB HID bios protocol
//! should work with this demo application.
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
// The size of the keyboard device interface's memory pool in bytes.
//
//*****************************************************************************
#define KEYBOARD_MEMORY_SIZE       128

//*****************************************************************************
//
// The memory pool to provide to the keyboard device.
//
//*****************************************************************************
unsigned char g_pucKeyboardBuffer[KEYBOARD_MEMORY_SIZE];

//*****************************************************************************
//
// Declare the USB Events driver interface.
//
//*****************************************************************************
DECLARE_EVENT_DRIVER(g_sUSBEventDriver, 0, 0, USBHCDEvents);

//*****************************************************************************
//
// The global that holds all of the host drivers in use in the application.
// In this case, only the Keyboard class is loaded.
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
#define PALETTE_OFFSET    4

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
// The global value used to store the keyboard instance value.
//
//*****************************************************************************
static unsigned int g_ulKeyboardInstance;

//*****************************************************************************
//
// The global values used to store the mouse state.
//
//*****************************************************************************
// static unsigned int g_ulButtons;
// static tRectangle g_sCursor;

// This enumerated type is used to hold the states of the keyboard.
//
//*****************************************************************************
enum
{
    //
    // No device is present.
    //
    STATE_NO_DEVICE,

    //
    // Keyboard has been detected and needs to be initialized in the main
    // loop.
    //
    STATE_KEYBOARD_INIT,

    //
    // Keyboard is connected and waiting for events.
    //
    STATE_KEYBOARD_CONNECTED,

    //
    // Keyboard has received a key press that requires updating the keyboard
    // in the main loop.
    //
    STATE_KEYBOARD_UPDATE,

    //
    // An unsupported device has been attached.
    //
    STATE_UNKNOWN_DEVICE,

    //
    // A power fault has occurred.
    //
    STATE_POWER_FAULT
}
g_eUSBState;

extern const tHIDKeyboardUsageTable g_sUSKeyboardMap;

//*****************************************************************************
//
// These defines are used to define the screen constraints to the application.
//
//*****************************************************************************
#define DISPLAY_BANNER_HEIGHT   23
#define DISPLAY_BANNER_BG       ClrDarkBlue
#define DISPLAY_BANNER_FG       ClrWhite
#define DISPLAY_TEXT_BORDER     2
#define DISPLAY_TEXT_BG         ClrBlack
#define DISPLAY_TEXT_FG         ClrWhite

//*****************************************************************************
//
// This variable holds the current status of the modifiers keys.
//
//*****************************************************************************
unsigned int g_ulModifiers = 0;

//*****************************************************************************
//
// This is the number of characters that will fit on a line in the text area.
//
//*****************************************************************************
unsigned int g_ulCharsPerLine;

//*****************************************************************************
//
// This is the number of lines that will fit in the text area.
//
//*****************************************************************************
unsigned int g_ulLinesPerScreen;

//*****************************************************************************
//
// This is the current line for printing in the text area.
//
//*****************************************************************************
unsigned int g_ulLine = 0;

//*****************************************************************************
//
// This is the current column for printing in the text area.
//
//*****************************************************************************
unsigned int g_ulColumn = 0;

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
// This function prints the character out the UART and into the text area of
// the screen.
//
// \param ucChar is the character to print out.
//
// This function handles all of the detail of printing a character to both the
// UART and to the text area of the screen on the evaluation board.  The text
// area of the screen will be cleared any time the text goes beyond the end
// of the text area.
//
// \return None.
//
//*****************************************************************************

void
PrintChar(const char ucChar)
{
    tRectangle sRect;

    //
    // If both the line and column have gone to zero then clear the screen.
    //
    if((g_ulLine == 0) && (g_ulColumn == 0))
    {
        //
        // Form the rectangle that makes up the text box.
        //
        sRect.sXMin = 0;
        sRect.sYMin = DISPLAY_BANNER_HEIGHT + DISPLAY_TEXT_BORDER;
        sRect.sXMax = GrContextDpyWidthGet(&g_sContext) - DISPLAY_TEXT_BORDER;
        sRect.sYMax = GrContextDpyHeightGet(&g_sContext) -
                      DISPLAY_BANNER_HEIGHT - DISPLAY_TEXT_BORDER;

        //
        // Change the foreground color to black and draw black rectangle to
        // clear the screen.
        //
        GrContextForegroundSet(&g_sContext, DISPLAY_TEXT_BG);
        GrRectFill(&g_sContext, &sRect);

        //
        // Reset the foreground color to the text color.
        //
        GrContextForegroundSet(&g_sContext, DISPLAY_TEXT_FG);
    }

    //
    // Send the character to the UART.
    //
    // UARTprintf("%c", ucChar);

    //
    // Allow new lines to cause the column to go back to zero.
    //
    if(ucChar != '\n')
    {
        //
        // Print the character to the screen.
        //
        GrStringDraw(&g_sContext, &ucChar, 1,
                     GrFontMaxWidthGet(&g_sFontCm20) * g_ulColumn,
                     DISPLAY_BANNER_HEIGHT + DISPLAY_TEXT_BORDER +
                     (g_ulLine * GrFontHeightGet(&g_sFontCm20)), 0);
    }
    else
    {
        //
        // This will allow the code below to properly handle the new line.
        //
        g_ulColumn = g_ulCharsPerLine;
    }

    //
    // Update the text row and column that the next character will use.
    //
    if(g_ulColumn < g_ulCharsPerLine)
    {
        //
        // No line wrap yet so move one column over.
        //
        g_ulColumn++;
    }
    else
    {
        //
        // Line wrapped so go back to the first column and update the line.
        //
        g_ulColumn = 0;
        g_ulLine++;

        //
        // The line has gone past the end so go back to the first line.
        //
        if(g_ulLine >= g_ulLinesPerScreen)
        {
            g_ulLine = 0;
        }
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

    //
    // Fill the bottom rows of the screen with blue to create the status area.
    //
    sRect.sXMin = 0;
    sRect.sYMin = GrContextDpyHeightGet(&g_sContext) -
                  DISPLAY_BANNER_HEIGHT - 1;
    sRect.sXMax = GrContextDpyWidthGet(&g_sContext) - 1;
    sRect.sYMax = sRect.sYMin + DISPLAY_BANNER_HEIGHT;

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
    if(g_eUSBState == STATE_NO_DEVICE)
    {
        //
        // Keyboard is currently disconnected.
        //
        GrStringDraw(&g_sContext, "No Device", -1, 4, sRect.sYMin + 4, 0);
    }
    else if(g_eUSBState == STATE_UNKNOWN_DEVICE)
    {
        //
        // Unknown device is currently connected.
        //
        GrStringDraw(&g_sContext, "Unknown Device", -1, 4, sRect.sYMin + 4, 0);
    }
    else if(g_eUSBState == STATE_POWER_FAULT)
    {
        //
        // Something caused a power fault.
        //
        GrStringDraw(&g_sContext, "Power Fault", -1, 4, sRect.sYMin + 4, 0);
    }
    else if((g_eUSBState == STATE_KEYBOARD_CONNECTED) ||
            (g_eUSBState == STATE_KEYBOARD_UPDATE))
    {
        //
        // Keyboard is connected.
        //
        GrStringDraw(&g_sContext, "Connected", -1, 4, sRect.sYMin + 4, 0);

        //
        // Update the CAPS Lock status.
        //
        if(g_ulModifiers & HID_KEYB_CAPS_LOCK)
        {
            GrStringDraw(&g_sContext, "CAPS", 4, sRect.sXMax - 28,
                         sRect.sYMin + 4, 0);
        }
    }
}


/*
** For each end of frame interrupt base and ceiling is reconfigured 
*/
static void LCDIsr(void)
{
    unsigned int  status;

#ifdef _TMS320C6X
    IntEventClear(SYS_INT_LCDC_INT);
#else
    IntSystemStatusClear(SYS_INT_LCDINT);
#endif

    status = RasterIntStatus(SOC_LCDC_0_REGS,RASTER_END_OF_FRAME0_INT_STAT |
                                             RASTER_END_OF_FRAME1_INT_STAT );

    status = RasterClearGetIntStatus(SOC_LCDC_0_REGS, status);    
}

#ifdef _TMS320C6X
static void SetupDSPINTCInt (void)
{
    IntDSPINTCInit();
    IntGlobalEnable();
}
#else
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
#endif


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
#ifdef _TMS320C6X
    /* Initialize the DSP interrupt controller */
    IntDSPINTCInit();

    /* Register ISR to vector table */
    IntRegister(C674X_MASK_INT5, LCDIsr);

    /* Map system interrupt to DSP maskable interrupt */
    IntEventMap(C674X_MASK_INT5, SYS_INT_LCDC_INT);

    /* Enable DSP maskable interrupt */
    IntEnable(C674X_MASK_INT5);

    /* Enable DSP interrupts */
    IntGlobalEnable();
#else
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
#endif
}


#ifdef _TMS320C6X
static void ConfigureDSPINTCIntUSB (void)
{
    IntRegister(4, USB0HostIntHandler);
    IntEventMap(4, SYS_INT_USB0);
    IntEnable(4);
}
#else
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
#endif


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
        // New Keyboard detected.
        //
        case USB_EVENT_CONNECTED:
        {
            //
            // An unknown device was detected.
            //
            g_eUSBState = STATE_UNKNOWN_DEVICE;

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
            g_eUSBState = STATE_NO_DEVICE;

            UpdateStatus();
            break;
        }
        case USB_EVENT_POWER_FAULT:
        {
            //UARTprintf("Power Fault\n");

            //
            // No power means no device is present.
            //
            g_eUSBState = STATE_POWER_FAULT;

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
// This is the callback from the USB HID keyboard handler.
//
// \param pvCBData is ignored by this function.
// \param ulEvent is one of the valid events for a keyboard device.
// \param ulMsgParam is defined by the event that occurs.
// \param pvMsgData is a pointer to data that is defined by the event that
// occurs.
//
// This function will be called to inform the application when a keyboard has
// been plugged in or removed and any time a key is pressed or released.
//
// \return This function will return 0.
//
//*****************************************************************************
unsigned int
KeyboardCallback(void *pvCBData, unsigned int ulEvent,
                 unsigned int ulMsgParam, void *pvMsgData)
{
    unsigned char ucChar;

    switch(ulEvent)
    {
        //
        // New keyboard detected.
        //
        case USB_EVENT_CONNECTED:
        {
            //
            // Indicate that the keyboard has been detected.
            //
            // UARTprintf("Keyboard Connected\n");

            //
            // Proceed to the STATE_KEYBOARD_INIT state so that the main loop
            // can finish initialized the mouse since USBHKeyboardInit() cannot
            // be called from within a callback.
            //
            g_eUSBState = STATE_KEYBOARD_INIT;

            break;
        }

        //
        // Keyboard has been unplugged.
        //
        case USB_EVENT_DISCONNECTED:
        {
            //
            // Indicate that the keyboard has been disconnected.
            //
            // UARTprintf("Keyboard Disconnected\n");

            //
            // Change the state so that the main loop knows that the keyboard
            // is no longer present.
            //
            g_eUSBState = STATE_NO_DEVICE;

            //
            // Reset the modifiers state.
            //
            g_ulModifiers = 0;

            //
            // Update the screen.
            //
            UpdateStatus();

            break;
        }

        //
        // New Key press detected.
        //
        case USBH_EVENT_HID_KB_PRESS:
        {
            //
            // If this was a Caps Lock key then update the Caps Lock state.
            //
            if(ulMsgParam == HID_KEYB_USAGE_CAPSLOCK)
            {
                //
                // The main loop needs to update the keyboard's Caps Lock
                // state.
                //
                g_eUSBState = STATE_KEYBOARD_UPDATE;

                //
                // Toggle the current Caps Lock state.
                //
                g_ulModifiers ^= HID_KEYB_CAPS_LOCK;

                //
                // Update the screen based on the Caps Lock status.
                //
                UpdateStatus();
            }
            else
            {
                //
                // Print the current key out the UART.
                //
                ucChar = (unsigned char)
                    USBHKeyboardUsageToChar(g_ulKeyboardInstance,
                                            &g_sUSKeyboardMap,
                                            (unsigned char)ulMsgParam);
                //
                // A zero value indicates there was no textual mapping of this
                // usage code.
                //
                if(ucChar != 0)
                {
                    PrintChar(ucChar);
                }
            }
            break;
        }
        case USBH_EVENT_HID_KB_MOD:
        {
            //
            // This application ignores the state of the shift or control
            // and other special keys.
            //
            break;
        }
        case USBH_EVENT_HID_KB_REL:
        {
            //
            // This applications ignores the release of keys as well.
            //
            break;
        }
    }
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
    GrContextForegroundSet(&g_sContext, ClrWhite);
    GrRectDraw(&g_sContext, &sRect);

    //
    // Put the application name in the middle of the banner.
    //
    GrContextFontSet(&g_sContext, &g_sFontCm20);
    GrStringDrawCentered(&g_sContext, "usb host keyboard", -1,
                         GrContextDpyWidthGet(&g_sContext) / 2, 10, 0);

    //
    //Setup the interrupt controller
    //
#ifdef _TMS320C6X
    SetupDSPINTCInt();
    ConfigureDSPINTCIntUSB();
#else
    SetupAINTCInt(); 
    ConfigureAINTCIntUSB();
#endif
    
    DelayTimerSetup();
    
    //
    // Calculate the number of characters that will fit on a line.
    // Make sure to leave a small border for the text box.
    //
    g_ulCharsPerLine = (GrContextDpyWidthGet(&g_sContext) - 4) /
                        GrFontMaxWidthGet(&g_sFontCm20);

    //
    // Calculate the number of lines per usable text screen.  This requires
    // taking off space for the top and bottom banners and adding a small bit
    // for a border.
    //
    g_ulLinesPerScreen = (GrContextDpyHeightGet(&g_sContext) -
                          (2*(DISPLAY_BANNER_HEIGHT + 1)))/
                          GrFontHeightGet(&g_sFontCm20);


    //
    // Register the host class drivers.
    //
    USBHCDRegisterDrivers(0, g_ppHostClassDrivers, g_ulNumHostClassDrivers);

    // Open an instance of the keyboard driver.  The keyboard does not need
    // to be present at this time, this just save a place for it and allows
    // the applications to be notified when a keyboard is present.
    //
    g_ulKeyboardInstance = USBHKeyboardOpen(KeyboardCallback, g_pucBuffer,
                                            KEYBOARD_MEMORY_SIZE);

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
    // Initial update of the screen.
    //
    UpdateStatus();

    //
    // The main loop for the application.
    //
    while(1)
    {
        switch(g_eUSBState)
        {
            //
            // This state is entered when they keyboard is first detected.
            //
            case STATE_KEYBOARD_INIT:
            {
                //
                // Initialized the newly connected keyboard.
                //
                USBHKeyboardInit(g_ulKeyboardInstance);

                //
                // Proceed to the keyboard connected state.
                //
                g_eUSBState = STATE_KEYBOARD_CONNECTED;

                //
                // Update the screen now that the keyboard has been
                // initialized.
                //
                UpdateStatus();

                break;
            }
            case STATE_KEYBOARD_UPDATE:
            {
                //
                // If the application detected a change that required an
                // update to be sent to the keyboard to change the modifier
                // state then call it and return to the connected state.
                //
                g_eUSBState = STATE_KEYBOARD_CONNECTED;

                USBHKeyboardModifierSet(g_ulKeyboardInstance, g_ulModifiers);

                break;
            }
            case STATE_KEYBOARD_CONNECTED:
            {
                //
                // Nothing is currently done in the main loop when the keyboard
                // is connected.
                //
                break;
            }
            case STATE_UNKNOWN_DEVICE:
            {
                //
                // Nothing to do as the device is unknown.
                //
                break;
            }
            case STATE_NO_DEVICE:
            {
                //
                // Nothing is currently done in the main loop when the keyboard
                // is not connected.
                //
                break;
            }
            default:
            {
                break;
            }
        }

        //
        // Periodic call the main loop for the Host controller driver.
        //
        USBHCDMain();
    }
}
