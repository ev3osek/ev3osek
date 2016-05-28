/**
 * \file  game_example.c
 *
 * \brief Part of the StarterWare game application
 */

/* Copyright (c) 2006-2010 Texas Instruments Incorporated.  All rights reserved.
 *
 * Software License Agreement
 * 
 * Texas Instruments (TI) is supplying this software for use solely and
 * exclusively on TI's microcontroller products. The software is owned by
 * TI and/or its suppliers, and is protected under applicable copyright
 * laws. You may not combine this software with "viral" open-source
 * software in order to form a larger program.
 * 
 * THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
 * NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
 * NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
 * CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
 * DAMAGES, FOR ANY REASON WHATSOEVER.
 * 
 * This is part of revision 6288 of the EK-LM3S2965 Firmware Package.
 * This file is updated to make it work for StarterWare. */

//*****************************************************************************
//
//! \addtogroup example_list
//! <h1>EK-LM3S2965 Quickstart Application (qs_ek-lm3s2965)</h1>
//!
//! A game in which a blob-like character tries to find its way out of a maze.
//! The character starts in the middle of the maze and must find the exit,
//! which will always be located at one of the four corners of the maze.  Once
//! the exit to the maze is located, the character is placed into the middle of
//! a new maze and must find the exit to that maze; this repeats endlessly.
//!
//! The game is started by pressing the select push button on the right side
//! of the board.  During game play, the select push button will fire a bullet
//! in the direction the character is currently facing, and the navigation push
//! buttons on the left side of the board will cause the character to walk in
//! the corresponding direction.
//!
//! Populating the maze are a hundred spinning stars that mindlessly attack the
//! character.  Contact with one of these stars results in the game ending, but
//! the stars go away when shot.
//!
//! Score is accumulated for shooting the stars and for finding the exit to the
//! maze.  The game lasts for only one character, and the score is displayed on
//! the virtual UART at 115,200, 8-N-1 during game play and will be displayed
//! on the screen at the end of the game.
//!
//! If the CAN device board is attached and is running the can_device_qs
//! application, the volume of the music and sound effects can be adjusted over
//! CAN with the two push buttons on the target board.  The LED on the CAN
//! device board will track the state of the LED on the main board via CAN
//! messages.  The operation of the game will not be affected by the absence of
//! the CAN device board.
//!
//! Since the OLED display on the evaluation board has burn-in characteristics
//! similar to a CRT, the application also contains a screen saver.  The screen
//! saver will only become active if two minutes have passed without the user
//! push button being pressed while waiting to start the game (that is, it will
//! never come on during game play).  Qix-style bouncing lines are drawn on the
//! display by the screen saver.
//!
//! After two minutes of running the screen saver, the display will be turned
//! off and the user LED will blink.  Either mode of screen saver (bouncing
//! lines or blank display) will be exited by pressing the select push button.
//! The select push button will then need to be pressed again to start the
//! game.
//
//*****************************************************************************

#include "debug.h"
#include "globals.h"
#include "images.h"
#include "random.h"
#include "screen_saver.h"
#include "raster.h"
#include "psc.h"
#include "interrupt.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "i2c.h"
#include "gameTimer.h"
#include "game_example.h"

#ifdef _TMS320C6X
#include "dspcache.h"
#else
#include "cp15.h"
#endif

#include "gameToneLoop.h"
#include "gameAic31.h"
#include "gameI2C.h"

/*******************************************************************************
**                       INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define LCD_SIZE 261156
#define LCD_CLK  150000000

#define PALETTE_SIZE 32
#define LCD_WIDTH 480
#define LCD_HEIGHT 272

#define PALETTE_OFFSET	4
#define FRAME_BUFFER_0	0
#define FRAME_BUFFER_1	1
#define TIME_ELAPSED_INST	20

/*******************************************************************************
**                      EXTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
extern const unsigned char splash[];
extern void (*I2CpFunc)(void);

/*******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/

//*****************************************************************************
//
//  Memory that is used as the local frame buffer. 16 BPP image. 
//	Two buffers are used.
//
//*****************************************************************************
#ifdef __TMS470__
#pragma DATA_ALIGN(g_pucBuffer0, 4)
unsigned char g_pucBuffer0[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];
#pragma DATA_ALIGN(g_pucBuffer1, 4)
unsigned char g_pucBuffer1[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];

#elif defined _TMS320C6X
#pragma DATA_ALIGN(g_pucBuffer0, 4)
unsigned char g_pucBuffer0[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];
#pragma DATA_ALIGN(g_pucBuffer1, 4)
unsigned char g_pucBuffer1[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];

#elif defined(__IAR_SYSTEMS_ICC__)
#pragma data_alignment=4
unsigned char g_pucBuffer0[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];
#pragma data_alignment=4
unsigned char g_pucBuffer1[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)];

#else
unsigned char g_pucBuffer0[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)] __attribute__ ((aligned (4)));
unsigned char g_pucBuffer1[GrOffScreen16BPPSize(LCD_WIDTH, LCD_HEIGHT)] __attribute__ ((aligned (4)));
#endif


//*****************************************************************************
//
//  The graphics library display structure.
//
//*****************************************************************************
tDisplay g_sSHARP480x272x16Display0;
tDisplay g_sSHARP480x272x16Display1;

//*****************************************************************************
//
//  Display context which is passed to the graphics library.
//
//*****************************************************************************
tContext sContext0;
tContext sContext1;

//*****************************************************************************
//
//	32 byte palette for 16bpp LCD display.
//
//*****************************************************************************
unsigned short palette_32b[PALETTE_SIZE/2] = 
            {0x4000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u,
             0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u, 0x0000u};


//*****************************************************************************
//
//	Array to hold the time elapsed for TIME_ELAPSED_INST iterations.
//
//*****************************************************************************
unsigned int frameTransferRate[TIME_ELAPSED_INST];
//*****************************************************************************
//
//	Index used to fill the frameTransferRate array.
//
//*****************************************************************************
unsigned int trIndex = 0;

//*****************************************************************************
//
// A set of flags used to track the state of the application.
//
//*****************************************************************************
unsigned int g_ulFlags;

//*****************************************************************************
//
// The speed of the processor clock, which is therefore the speed of the clock
// that is fed to the peripherals.
//
//*****************************************************************************
unsigned int g_ulSystemClock;

//*****************************************************************************
//
// Storage for a local frame buffer.
//
//*****************************************************************************
unsigned char g_pucFrame[(GAME_W*GAME_H/2)+6+(16*3)];

//*****************************************************************************
//
// The debounced state of the five push buttons.  The bit positions correspond
// to:
//
//     0x00	- All
//     0x0b - Left
//     0x07 - Right
//     0x0E - Up
//     0x0D - Down
//	   0x0A	- Select/Fire
//
//*****************************************************************************
unsigned char g_ucSwitches = 0x1f;

/* page tables start must be aligned in 16K boundary */
#ifdef __TMS470__
#pragma DATA_ALIGN(pageTable, 16384);
static volatile unsigned int pageTable[4*1024];
#elif defined(__IAR_SYSTEMS_ICC__)
#pragma data_alignment=16384
static volatile unsigned int pageTable[4*1024];
#elif _TMS320C6X
#else
static volatile unsigned int pageTable[4*1024] __attribute__((aligned(16*1024)));
#endif

/*******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
void SetupIntc(void);
void SetUpLCD(void);
static void LCDIsr(void);
void Isr(void);
void ConfigureAINTCIntI2C(void);
void I2CSetup(void);
static void PeripheralsSetup(void);
void ConfigureFrameBuffer(void);

#ifdef _TMS320C6X
void CleanDSPCache_LCD (void);
#endif

//*****************************************************************************
//
// Delay for a multiple of the system tick clock rate.
//
//*****************************************************************************
void Delay(unsigned int ulCount)
{
	volatile unsigned int count = ulCount;
    //
    // Loop while there are more clock ticks to wait for.
    //
    while(count--);
}


//*****************************************************************************
//
// The main code for the application.  It sets up the peripherals, displays the
// splash screens, and then manages the interaction between the game and the
// screen saver.
//
//*****************************************************************************
int
main(void)
{
	tRectangle sRect;
#ifndef _TMS320C6X
    unsigned int index;
#endif
	
    SetupIntc();

	
	/* Configuring UART2 instance for serial communication. */
    UARTStdioInit();

#ifdef _TMS320C6X
    CacheEnableMAR((unsigned int)0xC0000000, (unsigned int)0x20000000);
    CacheEnable(L1PCFG_L1PMODE_32K | L1DCFG_L1DMODE_32K | L2CFG_L2MODE_256K);
#else
    /* Sets up 'Level 1" page table entries. 
     * The page table entry consists of the base address of the page
     * and the attributes for the page. The following operation is to
     * setup one-to-one mapping page table for DDR memeory range and set
     * the atributes for the same. The DDR memory range is from 0xC0000000
     * to 0xDFFFFFFF. Thus the base of the page table ranges from 0xC00 to 
     * 0xDFF. Cache(C bit) and Write Buffer(B bit) are enabled  only for
     * those page table entries which maps to DDR RAM and internal RAM.
     * All the pages in the DDR range are provided with R/W permissions
     */
    for(index = 0; index < (4*1024); index++)
    {
         if((index >= 0xC00 && index < 0xE00)|| (index == 0x800))
         {             
              pageTable[index] = (index << 20) | 0x00000C1E;
         }
         else
         {
              pageTable[index] = (index << 20) | 0x00000C12;
         }
    }
     
    /* Configures translation table base register
     * with pagetable base address.
     */
    CP15TtbSet((unsigned int )pageTable);

    /* Enables MMU */
    CP15MMUEnable();
   
	/* Enable Instruction Cache */
    CP15ICacheEnable();

    /* Enable Data Cache */
    CP15DCacheEnable();
#endif

    SetUpLCD();
	
	ConfigureFrameBuffer();
		
	GrOffScreen16BPPInit(&g_sSHARP480x272x16Display0, (unsigned char *)g_pucBuffer0, LCD_WIDTH, LCD_HEIGHT);
	GrOffScreen16BPPInit(&g_sSHARP480x272x16Display1, (unsigned char *)g_pucBuffer1, LCD_WIDTH, LCD_HEIGHT);
	
	// Initialize a drawing context.
	GrContextInit(&sContext0, &g_sSHARP480x272x16Display0);
	GrContextInit(&sContext1, &g_sSHARP480x272x16Display1);

    /* enable End of frame interrupt */
    RasterEndOfFrameIntEnable(SOC_LCDC_0_REGS);

    /* enable raster */
    RasterEnable(SOC_LCDC_0_REGS);

	PeripheralsSetup();
	I2C0IntRegister(4);
    AIC31Init();
    ToneLoopInit();
	/* Start playing the tone */
    ToneLoopStart();
	
    // TS init	
	TouchInit();
	
	GrContextForegroundSet(&sContext0, ClrBlack);
	GrContextForegroundSet(&sContext1, ClrBlack);
    sRect.sXMin = GAME_X - 1;
    sRect.sYMin = GAME_Y - 1;
    sRect.sXMax = GAME_X + GAME_W;
    sRect.sYMax = GAME_Y + GAME_H;
    GrRectFill(&sContext0, &sRect);
    GrRectFill(&sContext1, &sRect);

    GrImageDraw(&sContext0, g_pucTILogo128x96, GAME_X, GAME_Y);
	GrImageDraw(&sContext1, g_pucTILogo128x96, GAME_X, GAME_Y);
	
	Delay(0x5FFFFF);
	
	// Confiure and start timer2
	Timer2Config();
	Timer2Start();

    // Loop forever.
    while(1)
    {
        // Display the main screen.
        if(MainScreen())
        {
            // The button was pressed, so start the game.
            PlayGame();
        }
        else
        {
            // The button was not pressed during the timeout period, so start
            // the screen saver.
            ScreenSaver();
        }
    }
}

/*
** Configures raster to display image 
*/
void SetUpLCD(void)
{
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_LCDC, PSC_POWERDOMAIN_ALWAYS_ON,
             PSC_MDCTL_NEXT_ENABLE);

    LCDPinMuxSetup();

    ConfigRasterDisplayEnable();

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
   RasterFIFODMADelayConfig(SOC_LCDC_0_REGS, (17647058/8823529));
}

/*
** configures arm interrupt controller to generate raster interrupt 
*/
void SetupIntc(void)
{
#ifdef _TMS320C6X
	IntDSPINTCInit();
	IntRegister(C674X_MASK_INT4, LCDIsr);
	IntEventMap(C674X_MASK_INT4, SYS_INT_LCDC_INT);
	IntEnable(C674X_MASK_INT4);
	IntGlobalEnable();
#else
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_LCDINT, LCDIsr);

    /* Set the channnel number 2 of AINTC for LCD system interrupt.
     */
    IntChannelSet(SYS_INT_LCDINT, 2);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_LCDINT);
	IntSystemEnable(SYS_INT_I2CINT0); 
	
    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
#endif
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

	/* Read the timer counter, to see how much time has elapsed */
	/*if(trIndex < TIME_ELAPSED_INST)
		frameTransferRate[trIndex++] = TimerCounterGet(SOC_TMR_2_REGS, TMR_TIMER12);*/
	
	if (status & RASTER_END_OF_FRAME0_INT_STAT)
	{
		flagA = 1;
	}
	
	if(status & RASTER_END_OF_FRAME1_INT_STAT)
	{
		flagB = 1;
	}
	
	/* since the frame buffers are constant no need to re-configure again.*/
}


void ConfigureFrameBuffer(void)
{
    unsigned int index = 0;
    unsigned char *dest0, *dest1, *src;

	/* configuring the base ceiling */
	RasterDMAFBConfig(SOC_LCDC_0_REGS, 
					  (unsigned int)(g_pucBuffer0+PALETTE_OFFSET),
					  (unsigned int)(g_pucBuffer0+PALETTE_OFFSET) + sizeof(g_pucBuffer0) - 2 -
					  PALETTE_OFFSET, FRAME_BUFFER_0);

	RasterDMAFBConfig(SOC_LCDC_0_REGS, 
					  (unsigned int)(g_pucBuffer1+PALETTE_OFFSET),
					  (unsigned int)(g_pucBuffer1+PALETTE_OFFSET) + sizeof(g_pucBuffer1) - 2 - 
					  PALETTE_OFFSET, FRAME_BUFFER_1);

	src = (unsigned char *) palette_32b;
	dest0 = (g_pucBuffer0+PALETTE_OFFSET);
	dest1 = (g_pucBuffer1+PALETTE_OFFSET);

	// Copy palette info into buffer
	for( index = PALETTE_OFFSET; index < (PALETTE_SIZE+PALETTE_OFFSET); index++)
	{
		*dest0++ = *src;
		*dest1++ = *src++;
	}
	
	// copy splash screen
	src = (unsigned char *)&splash[5];
	for(; index < LCD_SIZE; index++)
	{
		*dest0++ = *src;
		*dest1++ = *src++;
	}
}


/*
** Enable all the peripherals in use
*/
static void PeripheralsSetup(void)
{
    /* pin mux for I2C */
    I2CPinMuxSetup(0);
	
    /* PSC for McASP and EDMA, pinmux for McASP*/
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_MCASP0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_CC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_TC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);
    McASPPinMuxSetup();

}

#ifdef _TMS320C6X
void CleanDSPCache_LCD (void)
{
	CacheWB((unsigned int)g_pucBuffer0, sizeof(g_pucBuffer0));
	CacheWB((unsigned int)g_pucBuffer1, sizeof(g_pucBuffer1));
}
#endif

