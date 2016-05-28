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
// This is part of AM1808 StarterWare firmware package, modified and reused
// from revision 6288 of the DK-LM3S9B96 Firmware Package.
//
//*****************************************************************************

#include "hw_types.h"
#include "raster.h"
#include "psc.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "demoTouch.h"
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

//Used to set the mode of PMIC asread pressure mode
#define MODE_PRESSURE 2 

// Numer of pressure reads that going to perform.  This is required to avoid the debouncing effect
#define DEBOUNCE_READ 2


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
	static unsigned char ucButtons = 0;
	char cTempx,cTempy;
	int j =0; 

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
	if(g_ucButtons )
	{
		lDeltaX =0;
		lDeltaY =0;				
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


//
// \brief  This function confiugres the INTC to receive USB interrupts.
// 
static void ConfigureINTCIntUSB(void)
{
#ifdef _TMS320C6X
	IntRegister(C674X_MASK_INT11, USB0DeviceIntHandler);
	IntEventMap(C674X_MASK_INT11, SYS_INT_USB0);
	IntEnable(C674X_MASK_INT11);
#else
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
#endif
}

//
// \brief  This function initializes the USB.
// 
void USBInit(void)
{
	ConfigRasterDisplayEnable();

	//
	// Configure the USB Interrupts 
	//
	ConfigureINTCIntUSB();

	//
	//delay timer setup
	//
	DelayTimerSetup();

	//
	// Initialize the mouse
	//
	USBDHIDMouseInit(0, (tUSBDHIDMouseDevice *)&g_sMouseDevice);
}

//
// \brief  This function gets the HID events and handles the further processing.
// 
void TouchDebounce(void)
{
	unsigned short int iPressure=0;
	char cTempx,cTempy;	
	
	//
	// check if USB configuration to complete.
	//
	if(!bConnected)
	{	
		return;
	}

	//
	//Read the pressure to check if someone touched.
	//
	ReadAxis(MODE_PRESSURE,&cTempx,&cTempy);
	iPressure = g_iTouch = (unsigned short int)cTempy;			

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
		TouchCoOrdGet(&g_lScreenX, &g_lScreenY);
		TouchHandler();
		
	}while(iPressure); 
	g_ucButtons = 0;
	TouchHandler();
	g_iTouch =0;
}

//
// \brief  This function takes action on touchpad event.
// 
void ActionTouchPad(void)
{
	g_ucButtons = 0;
	TouchDebounce();
}		

//
// \brief  This function takes action on left button click.
// 
void ActionLeftClick(void)
{
	g_ucButtons = MOUSE_REPORT_BUTTON_1;
	TouchDebounce();
}

//
// \brief  This function takes action on middle button click.
// 
void ActionMiddleClick(void)
{
	g_ucButtons = MOUSE_REPORT_BUTTON_3;
	TouchDebounce();
}

//
// \brief  This function takes action on right button click.
// 
void ActionRightClick(void)
{
	g_ucButtons = MOUSE_REPORT_BUTTON_2;
	TouchDebounce();
}
