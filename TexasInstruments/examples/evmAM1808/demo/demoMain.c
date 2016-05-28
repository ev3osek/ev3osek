/**
 * \file    demoMain.c
 *
 * \brief   This file contains the main() and other functions.
 */

/*
* Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/ 
*
*  Redistribution and use in source and binary forms, with or without 
*  modification, are permitted provided that the following conditions 
*  are met:
*
*    Redistributions of source code must retain the above copyright 
*    notice, this list of conditions and the following disclaimer.
*
*    Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in the 
*    documentation and/or other materials provided with the   
*    distribution.
*
*    Neither the name of Texas Instruments Incorporated nor the names of
*    its contributors may be used to endorse or promote products derived
*    from this software without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include "hw_types.h"
#include "interrupt.h"
#include "demoI2C.h"
#include "demoRaster.h"
#include "demoTouch.h"
#include "demoMain.h"
#include "soc_AM1808.h"
#include "demoToneLoop.h"
#include "demoCfg.h"
#include "demoAic31.h"
#include "demoTimer.h"
#include "demoLedIf.h"
#include "demoGpio.h"
#include "demoEnet.h"
#include "demoRtc.h"
#include "evmAM1808.h"
#include "uartStdio.h"
#include "psc.h"

#include "demoImages.h"
#include "demoSlides.h"

#include "grlib.h"
#include <string.h>


/****************************************************************************
**                   INTERNAL MACRO DEFINITIONS                                       
****************************************************************************/
#define NUM_OF_IMAGES           (13u)
 
/****************************************************************************
**                   LOCAL FUNCTION PROTOTYPES                                
****************************************************************************/
static void Delay(volatile unsigned int delay);
static void CoOrdAction(int x, int y);
static void PeripheralsSetUp(void);
static void ClickAction(void);
static void PrevContextClear(void);
static void ActionIdle(void);
static void ActionDefault(void);
static void ActionI2C(void);
static void ActionTimer(void);
static void ActionGpio(void);
static void ActionTimeSet(void);
static void ActionEnetInit(void);
static void ActionUSBMouse(void);

static void ActionMenu(void);
static void ActionMenuIntro(void);
static void ActionMenuWebDemo(void);
static void ActionMenuMcASP(void);
static void ActionMenuSPI(void);
static void ActionMenuUart(void);
static void ActionMenuGPIO(void);
static void ActionMenuRTC(void);
static void ActionMenuI2C(void);
static void ActionMenuUSBMouse(void);
static void ActionMenuEthernet(void);
static void ActionMenuTimer(void);

static void updateUSBMouseImage(void);

extern void USBInit(void);
extern void ActionTouchPad(void);
extern void ActionLeftClick(void);
extern void ActionMiddleClick(void);
extern void ActionRightClick(void);

extern unsigned int ipAddr;
extern volatile tBoolean bConnected;

/****************************************************************************
**                  GLOBAL VARIABLES DEFINITIONS                                         
****************************************************************************/
/*
** Coordinates for each icon.
*/
static int const xyDefault[4] =  {0, 0, 0, 0};

static int const xyNext[4] = {XMIN_NEXT, XMAX_NEXT, YMIN_NEXT, YMAX_NEXT};

static int const xyPrev[4] = {XMIN_PREV, XMAX_PREV, YMIN_PREV, YMAX_PREV};	
				
static int const xyHome[4] = {XMIN_HOME, XMAX_HOME, YMIN_HOME, YMAX_HOME};

static int const xyTimeSet[4] = {XMIN_RTC_STD, XMAX_RTC_STD,
                                 YMIN_RTC_STD, YMAX_RTC_STD};
								 
static int const xyIntro[4] =  { XMIN_INTRO, XMAX_INTRO, YMIN_INTRO, YMAX_INTRO};

static int const xyWebDemo[4] = { XMIN_WEB_DEMO, XMAX_WEB_DEMO,
								  YMIN_WEB_DEMO, YMAX_WEB_DEMO};
								  
static int const xyMcASP[4] = { XMIN_MCASP, XMAX_MCASP, YMIN_MCASP, YMAX_MCASP};

static int const xySPI[4] =  { XMIN_SPI, XMAX_SPI, YMIN_SPI, YMAX_SPI}; 

static int const xyUart[4] =  { XMIN_UART, XMAX_UART, YMIN_UART, YMAX_UART}; 

static int const xyGPIO[4] = { XMIN_GPIO, XMAX_GPIO, YMIN_GPIO, YMAX_GPIO}; 

static int const xyRTC[4] = { XMIN_RTC, XMAX_RTC, YMIN_RTC, YMAX_RTC}; 

static int const xyI2C[4] = { XMIN_I2C, XMAX_I2C, YMIN_I2C, YMAX_I2C}; 

static int const xyUSBMouse[4] = { XMIN_USB_MOUSE, XMAX_USB_MOUSE, 
								   YMIN_USB_MOUSE, YMAX_USB_MOUSE}; 
								   
static int const xyTimer[4] = { XMIN_TIMER, XMAX_TIMER, YMIN_TIMER, YMAX_TIMER};

static int const xyEthernet[4] = { XMIN_ETHERNET, XMAX_ETHERNET, 
										YMIN_ETHERNET, YMAX_ETHERNET }; 

static int const xyMouseLeft[4] = { XMIN_MOUSE_LEFT, XMAX_MOUSE_LEFT, 
										YMIN_MOUSE_LEFT, YMAX_MOUSE_LEFT }; 
										
static int const xyMouseMiddle[4] = { XMIN_MOUSE_MIDDLE, XMAX_MOUSE_MIDDLE, 
										YMIN_MOUSE_MIDDLE, YMAX_MOUSE_MIDDLE }; 

static int const xyMouseRight[4] = { XMIN_MOUSE_RIGHT, XMAX_MOUSE_RIGHT, 
										YMIN_MOUSE_RIGHT, YMAX_MOUSE_RIGHT }; 
										
static int const xyTouchPad[4] = { XMIN_TOUCH_PAD, XMAX_TOUCH_PAD, 
										YMIN_TOUCH_PAD, YMAX_TOUCH_PAD }; 

/*
** Specifications for each icon
*/
static TOUCHSPEC const touchSpecBanner[NUM_ICON_BANNER] =
                    {
                       {xyDefault, ActionIdle}
                    };

static TOUCHSPEC const touchSpecMenu[NUM_ICON_MENU] =
                    {
					   {xyIntro, 	ActionMenuIntro},
					   {xyWebDemo, 	ActionMenuWebDemo},
					   {xyMcASP, 	ActionMenuMcASP},
					   {xySPI, 		ActionMenuSPI},
					   {xyUart, 	ActionMenuUart},
					   {xyGPIO, 	ActionMenuGPIO},
					   {xyRTC, 		ActionMenuRTC},
					   {xyI2C, 		ActionMenuI2C},
					   {xyUSBMouse, ActionMenuUSBMouse},
					   {xyTimer, 	ActionMenuTimer},
					   {xyEthernet, ActionMenuEthernet},								   
                    };
					
static TOUCHSPEC const touchSpecIntro[NUM_ICON_INTRO] = 
                    {
                       {xyNext, ActionEnetInit},
                       {xyPrev, ActionMenu},
                       {xyHome, ActionMenu}
                    };
static TOUCHSPEC const touchSpecI2C[NUM_ICON_I2C] =
                    {
                       {xyNext, ActionUSBMouse},
					   {xyPrev, ActionDefault},
					   {xyHome, ActionMenu}
                    };
static TOUCHSPEC const touchSpecUart[NUM_ICON_UART] = 
                    {
                       {xyNext, ActionGpio},
					   {xyPrev, ActionDefault},
					   {xyHome, ActionMenu}
                    };
static TOUCHSPEC const touchSpecRtc[NUM_ICON_RTC] = 
                    {
                       {xyNext, ActionI2C},
					   {xyPrev, ActionGpio},
					   {xyHome, ActionMenu},
                       {xyTimeSet, ActionTimeSet}					   
                    };
static TOUCHSPEC const touchSpecDefault[NUM_ICON_DFLT] = 
                    {
                       {xyNext, ActionDefault},
                       {xyPrev, ActionDefault},
                       {xyHome, ActionMenu}
                    };
static TOUCHSPEC const touchSpecMcASP[NUM_ICON_MCASP] = 
                    {
                       {xyNext, ActionDefault},
                       {xyPrev, ActionEnetInit},
                       {xyHome, ActionMenu}
                    };					
static TOUCHSPEC const touchSpecTimer[NUM_ICON_MCASP] = 
                    {
                       {xyNext, ActionDefault},
                       {xyPrev, ActionUSBMouse},
                       {xyHome, ActionMenu}			
					};
static TOUCHSPEC const touchSpecEthernet[NUM_ICON_ENET] =
                    {
                       {xyNext, ActionMenu},
                       {xyPrev, ActionTimer},
                       {xyHome, ActionMenu}
					};				

static TOUCHSPEC const touchSpecUSBMouse[NUM_ICON_USB_MOUSE] =
                    {
                       {xyNext, ActionTimer},
                       {xyPrev, ActionI2C},
                       {xyHome, ActionMenu},
					   {xyMouseLeft, ActionLeftClick},
					   {xyMouseMiddle, ActionMiddleClick},
					   {xyMouseRight, ActionRightClick},
					   {xyTouchPad, ActionTouchPad}					   
					};				
					
/*
** Context information.
** Image, number of icons in the image, specification.
** The next icon will come as the last specification for each image.
*/
IMAGECONTEXT contextInfo[NUM_OF_IMAGES] =             
                    {
					   {bannerImage + HW_VAL, NUM_ICON_BANNER, touchSpecBanner},
                       {menuImage + HW_VAL, NUM_ICON_MENU, touchSpecMenu},
                       {introImage + HW_VAL, NUM_ICON_INTRO, touchSpecIntro},
                       {choiceImage + HW_VAL, NUM_ICON_CHOICE, touchSpecDefault},
                       {mcaspImage + HW_VAL, NUM_ICON_MCASP, touchSpecMcASP},
                       {spiImage + HW_VAL, NUM_ICON_SPI, touchSpecDefault},
                       {uartImage + HW_VAL, NUM_ICON_UART, touchSpecUart},
                       {gpioImage + HW_VAL, NUM_ICON_GPIO, touchSpecDefault},
                       {rtcImage + HW_VAL, NUM_ICON_RTC, touchSpecRtc},
                       {i2cImage + HW_VAL, NUM_ICON_I2C, touchSpecI2C},
					   {usbMouseImage + HW_VAL, NUM_ICON_USB_MOUSE, touchSpecUSBMouse},
                       {timerImage + HW_VAL, NUM_ICON_TMR, touchSpecTimer},					   
                       {ethernetImage + HW_VAL, NUM_ICON_ENET, touchSpecEthernet},					   
                    };

/*
** The variable which is used to keep track of the current slide.
*/
volatile unsigned int imageCount = 0;

/*
** The variable which indicates which peripheral demo to be shown.
*/
unsigned int clickIdx = 0;

/*
** The variable which indicates whether ethernet is initialized.
*/
unsigned int enetInitFlag = FALSE;

/*
** The variable which indicates whether an action is called as a result of prev
** button click.
*/
unsigned int prevAction = 0;

/****************************************************************************
**                      FUNCTION DEFINITIONS                                         
****************************************************************************/
/*
** Enable all the peripherals in use
*/
static void PeripheralsSetUp(void)
{
    /* pin mux for I2C */
    I2CPinMuxSetup(0);

    /* PSC and pinmux for Raster */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_LCDC, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    LCDPinMuxSetup();

    /* PSC for McASP and EDMA, pinmux for McASP*/
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_MCASP0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_CC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_TC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    McASPPinMuxSetup();

    /* PSC and pinmux for GPIO */
    PSCModuleControl(SOC_PSC_1_REGS,HW_PSC_GPIO, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    GPIOBank4Pin0PinMuxSetup();

    /* PSC and pinmux for EMAC and MDIO */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_EMAC, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    EMACPinMuxSetup();

    /* Pinmux for RTC */
    RTCPinMuxSetup(FALSE);
}

/*
** This function clears any previous context info
*/
static void PrevContextClear(void)
{
    /* Close the previous state */
    Timer2Stop();
    tmrFlag  = FALSE;
    rtcSetFlag = FALSE;

    /* Make sure the LEDs are Off */
    LedIfConfig();
    LedOff();
    TouchIfConfig();
}

/*
** Take the actions on the touch.
** The coordinates are given by the parameters
*/
static void CoOrdAction(int x, int y)
{
    int const *coOrd;
    unsigned int cnt;
    unsigned int numIcon = contextInfo[imageCount].numIcon;
    TOUCHSPEC const *touchSpec;

    for(cnt = 0; cnt < numIcon; cnt++)
    {
        touchSpec = contextInfo[imageCount].touchSpec + cnt;
        coOrd = touchSpec->coOrd;

        /* Take action only for proper coordinates */
        if((x >= coOrd[0]) && (x <= coOrd[1]) &&
           ((y >= coOrd[2]) && (y <= coOrd[3])))
        {
            PrevContextClear();            

			if((1 == cnt) && (1 != imageCount))
			{
				prevAction = 1;
			}
            (touchSpec->action)();
			break;
        }
    
    }         
}

/*
** Take the actions on click. 
*/
static void ClickAction(void)
{
    TOUCHSPEC const *clickSpec;

    /*
    ** Get the spec. Assumed that the last touch spec only will give 
    ** action for the next image.
    */
    clickSpec = contextInfo[clickIdx - 1].touchSpec;
                //+ (contextInfo[clickIdx - 1].numIcon - 1) ;

    PrevContextClear();

    (clickSpec->action)();
}

/*
** Main function. The application starts here.
*/
int main(void)
{
    int x;
    int y;
    
    /* Initialize slide contents */
    InitializeSlides();

    PeripheralsSetUp();

    /* Initialize the Interrupt Controller */
#ifdef _TMS320C6X
    IntDSPINTCInit();
#else
    IntAINTCInit();
#endif

#ifdef _TMS320C6X
    /* Register the ISRs */  
    Raster0IntRegister(C674X_MASK_INT4);
    I2C0IntRegister(C674X_MASK_INT5);
    Timer2IntRegister(C674X_MASK_INT6);
    Gpio0IntRegister(C674X_MASK_INT7);
    EnetIntRegister(C674X_MASK_INT8, C674X_MASK_INT9);
    RtcIntRegister(C674X_MASK_INT10);


    IntEnable(C674X_MASK_INT4);
    IntEnable(C674X_MASK_INT5);
    IntEnable(C674X_MASK_INT6);
    IntEnable(C674X_MASK_INT7);
    IntEnable(C674X_MASK_INT8);
    IntEnable(C674X_MASK_INT9);

    IntGlobalEnable();
#else
    Raster0IntRegister(2);
    I2C0IntRegister(4);
    Timer2IntRegister(3);
    Gpio0IntRegister(4);
    EnetIntRegister(2);
    RtcIntRegister(3);

    IntMasterIRQEnable();

    /* Enable interrrupts at AINTC */
    IntGlobalEnable();
    IntIRQEnable();

    IntSystemEnable(SYS_INT_LCDINT); 
    IntSystemEnable(SYS_INT_I2CINT0); 
    IntSystemEnable(SYS_INT_TIMR2_ALL);
    IntSystemEnable(SYS_INT_GPIOB4);
    IntSystemEnable(SYS_INT_C0_RX);
    IntSystemEnable(SYS_INT_C0_TX);
    IntSystemEnable(SYS_INT_RTC);
#endif

	USBInit();
    Raster0Init();
    AIC31Init();
    ToneLoopInit();
    TouchInit();
    RtcInit();
    UARTStdioInit(); 
    Timer2Config();
    Gpio0CardDetConfig();   

    Raster0EOFIntEnable();
    Timer2IntEnable();
    Gpio0IntEnable(); 
    RtcSecIntEnable();

    imageCount = 0;
    Raster0Start(); 

    /* Start playing the tone */
    ToneLoopStart();

    Delay(0xFFFFF);

	if(prevAction)
	{
		/* Go to prev image */
	    imageCount--;
	}
	else
	{
	    /* Go to next image */
	    (0 == clickIdx) ? imageCount++ : (imageCount = clickIdx); 
	}
	prevAction = 0;

    /*
    ** Loop for ever. Necessary actions shall be taken
    ** after detecting touch, based on the coordinates
    */
    while(1)
    {
         /*
         ** Check if touch is detected 
         */
         if(TRUE == TouchDetect())
         {
             TouchCoOrdGet(&x, &y);

             /*
             ** Validate the coordinates and take action 
             */
             CoOrdAction(x, y);
         }

         /*
         ** Check if click is detected
         */
         if(clickIdx != 0)
         {
             /*
             ** Take the Action for click
             */
             ClickAction();

             clickIdx = 0;
         }
        
         /*
         ** Check if the Timer Expired
         */ 
         if(TRUE == tmrFlag)
         {
             tmrFlag = FALSE;

             /* Initialize the I2C interfae to LED */
             LedIfConfig();

             /* Toggle the LED state */
             LedToggle();

             /* Re-Initialize the I2C interface to Touch */
             TouchIfConfig();
         }
 
         /*
         ** Check if MMC/SD card is inserted
         */
         if(TRUE == cardDetFlag)
         {
             Delay(0x1FFF);
             cardDetFlag = FALSE;
              
             if(TRUE == GpioCardInserted()) 
             {
                 UARTPuts("\n\rMMC/SD card inserted.\n\r", -1);
             }
        
             else
             {
                 UARTPuts("\n\rMMC/SD card removed.\n\r", -1);
             }
         }
 
         /*
         ** Check if RTC Time is set
         */
         if(TRUE == rtcSetFlag)
         {
             if(TRUE == rtcSecUpdate)
             { 
                 rtcSecUpdate = FALSE;
                 RtcTimeCalDisplay();
             }
         } 
		 
         /*
         ** Check if USB touch pad slide need to be updated
         */		 
		 updateUSBMouseImage();
    }
}

/*
** Action to be taken when the demo is to be driven via Ethernet
*/
static void ActionEnetInit(void)
{
    char ipMsg[60] = {"http://"};
    unsigned int i_index, i_msg = 7, ipByte = 0;
    unsigned int linkFlag = FALSE;
 

	if(prevAction)
	{
		/* Go to prev image */
	    imageCount--;
	}
	else
	{
	    /* Go to next image */
	    (0 == clickIdx) ? imageCount++ : (imageCount = clickIdx); 
	}
	prevAction = 0;
   
    /* restore  original slide contents */
    ResetChoiceSlide();
       
    GrContextForegroundSet(&sContextChoice, ClrRed);
    GrContextFontSet(&sContextChoice, &g_sFontCmss18b);
    GrStringDrawCentered(&sContextChoice, 
                         "Checking Ethernet link and acquiring IP address...", 
                         -1, 240, 235, 0);

    if(!EnetIfIsUp())
    {
        linkFlag = FALSE;
        EnetHttpServerInit();

        if(ipAddr)
        {
            linkFlag = TRUE;
        }
    }

    else
    {
        if(EnetLinkIsUp())
        {
            linkFlag = TRUE;
            UARTPuts("\n\rEVM AM1808 IP Address: ", -1);
            IpAddrDisplay();
        }
   
        else
        {
            linkFlag = FALSE;
        }
    }
 
    /* restore  original slide contents */
    ResetChoiceSlide();

    if((TRUE == linkFlag) && (ipAddr != 0))
    {
        for(i_index = 0; i_index < 4; i_index++)
        {
            ipByte = 0x000000FF & (ipAddr >> ((i_index)*8) );

            if(ipByte/100)
            {
                ipMsg[i_msg++] = (ipByte/100) + 48;
                ipByte = ipByte%100;
                ipMsg[i_msg++] = (ipByte/10) + 48;
                ipByte = ipByte%10;
                ipMsg[i_msg++] = ipByte + 48;
                ipByte = 0;
            }
            if(ipByte/10)
            {
                ipMsg[i_msg++] = (ipByte/10) + 48;
                ipByte = ipByte%10;
                ipMsg[i_msg++] = ipByte + 48;
                ipByte = 0;
            }
            if(ipByte)
            {
                ipMsg[i_msg++] = ipByte + 48;
            }

            ipMsg[i_msg++] = '.';
        }
        ipMsg[--i_msg] = '\0';

        strcat(ipMsg, "/index.html");
        GrStringDrawCentered(&sContextChoice, ipMsg, -1, 240, 235, 0);
    }

    else
    {
        UARTPuts("\n\rNetwork Connection failed.\n\r", -1);
        
        GrStringDrawCentered(&sContextChoice, "Network Connectivity NOT Detected",
                             -1, 240, 235, 0);
    }
}

/*
** Action when no touch is detected 
*/
static void ActionIdle(void)
{
    ; /* Perform nothing */
}

/*
** Action for Menu
*/
static void ActionMenu(void)
{
	imageCount = 1;
	prevAction = 0;
}

/*
** Action for menu introduction icon click
*/
static void ActionMenuIntro(void) { 	imageCount++;}
/*
** Action for menu webdemo icon click
*/
static void ActionMenuWebDemo(void) { 	clickIdx = CLICK_IDX_CHOICE;}
/*
** Action for menu McASP icon click
*/
static void ActionMenuMcASP(void) { 	clickIdx = CLICK_IDX_MCASP;}
/*
** Action for menu SPI icon click
*/
static void ActionMenuSPI(void) { 	clickIdx = CLICK_IDX_SPI;}
/*
** Action for menu Uart icon click
*/
static void ActionMenuUart(void) { 	clickIdx = CLICK_IDX_UART;}
/*
** Action for menu GPIO icon click
*/
static void ActionMenuGPIO(void) { 	clickIdx = CLICK_IDX_GPIO;}
/*
** Action for menu RTC icon click
*/
static void ActionMenuRTC(void) { 	clickIdx = CLICK_IDX_RTC;}
/*
** Action for menu I2C icon click
*/
static void ActionMenuI2C(void) { 	clickIdx = CLICK_IDX_LED;}
/*
** Action for menu USB icon click
*/
static void ActionMenuUSBMouse(void) { 	clickIdx = CLICK_IDX_USB_MOUSE;}
/*
** Action for menu timer icon click
*/
static void ActionMenuTimer(void) { 	clickIdx = CLICK_IDX_TIMER;}
/*
** Action for menu ethernet icon click
*/
static void ActionMenuEthernet(void) { 	clickIdx = CLICK_IDX_ETHERNET;}


/*
** Default action 
*/
static void ActionDefault(void)
{
	if(prevAction)
	{
		/* Go to prev image */
	    imageCount--;
	}
	else
	{
	    (0 == clickIdx) ? imageCount++ : (imageCount = clickIdx); 
	}
	prevAction = 0;
}

/*
** Action for LED blink through I2C
*/
static void ActionI2C(void)
{
    /* Display the proper Image */ 
	if(prevAction)
	{
		/* Go to prev image */
	    imageCount--;
	}
	else
	{
	    (0 == clickIdx) ? imageCount++ : (imageCount = clickIdx); 
	}
	prevAction = 0;

    tmrFlag  = FALSE;
    tmrStepVary = FALSE;
  
    /* Start the timer */
    Timer2Start();
}

/*
** Action for LED blink with varying period
*/
static void ActionTimer(void)
{
    /* Display the proper Image */ 
	if(prevAction)
	{
		/* Go to prev image */
	    imageCount--;
	}
	else
	{
	    (0 == clickIdx) ? imageCount++ : (imageCount = clickIdx); 
	}
	prevAction = 0;    
  
    tmrFlag  = FALSE;
    tmrStepVary = TRUE;

    Timer2Start();
}

/*
** Action for GPIO card detection
*/
static void ActionGpio(void)
{
    /* Display the proper Image */ 
	if(prevAction)
	{
		/* Go to prev image */
	    imageCount--;
	}
	else
	{
	    (0 == clickIdx) ? imageCount++ : (imageCount = clickIdx); 
	}
	prevAction = 0;
}

void updateUSBMouseImage(void)
{
	static tBoolean bConnectedPrev = 10;
	
	if(bConnectedPrev != bConnected)
	{
		/* restore original slide contents */
		ResetUsbMouseSlide();

		if(!bConnected)
		{
			GrContextForegroundSet(&sContextUsbMouse, ClrRed);
			GrContextFontSet(&sContextUsbMouse, &g_sFontCmss20b);
			GrStringDrawCentered(&sContextUsbMouse, "Please connect the USB cable",
								 -1, 240, 80, 0);
								 
			GrStringDrawCentered(&sContextUsbMouse, "from this target to host.",
								 -1, 240, 100, 0);
		}
		bConnectedPrev = bConnected;
	}
}

static void ActionUSBMouse(void)
{
	/* Display the proper Image */ 
	if(prevAction)
	{
		/* Go to prev image */
	    imageCount--;
	}
	else
	{
	    (0 == clickIdx) ? imageCount++ : (imageCount = clickIdx); 
	}
	prevAction = 0;
	
	updateUSBMouseImage();
}




/*
** Action for RTC Time Set. This is a blocking call.
*/
static void ActionTimeSet(void)
{
    RtcTimeCalSet(); 
}


/*
** Delay Generator
*/
static void Delay(volatile unsigned int delay)
{
    while(delay--);
}

/****************************** End of file *********************************/
  
