/**
 * \file  liddDisplay.c
 *
 * \brief Sample application for LIDD character display interface
 *
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

#include "lidd.h"
#include "psc.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"

/******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
#define LIDD_INTERFACE_CLOCK        1181102
#define LIDD_CS                     0x1
/* Character LCD command set - Refer to the Character display datasheet */
#define LIDD_DISPLAY_INIT_SEQ1      0x30 /*Standard init command*/
#define LIDD_DISPLAY_INIT_SEQ2      0x38 /*Two line 5x7 dot matrix*/
#define LIDD_DISPLAY_OFF            0x8
#define LIDD_DISPLAY_CLEAR          0x1
#define LIDD_ENTRY_MODE             0x6 /*Incremental address, display shift off*/
#define LIDD_DISPLAY_HOME           0x2
#define LIDD_DISPLAY_ON             0xF /*Display, cursor, blink on*/
#define LIDD_DISPLAY_CURSOR_OFF     0xC /*Display, cursor, blink on*/
#define LIDD_DISPLAY_SCROLL_RIGHT   0x1C/*Display shift right*/
#define LIDD_DISPLAY_SCROLL_LEFT    0x18/*Display shift left*/
#define LIDD_DISPLAY_SET_LINE_1     0x80/*Point to Display RAM line 1 start*/
#define LIDD_DISPLAY_SET_LINE_2     0xC0/*Point to Display RAM line 2 start*/


/******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/

/* General delay loop */
static void Delay(volatile unsigned int count)
{
    while(count--);
}
/*
** configures arm interrupt controller to generate raster interrupt 
*/
static void SetupIntc(void)
{
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

/*
** Configures LCD in LIDD mode for interfacing character display
*/
static void SetUpLCD(void)
{
    unsigned int csConf; 

    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_LCDC, PSC_POWERDOMAIN_ALWAYS_ON,
                     PSC_MDCTL_NEXT_ENABLE);

    LIDDPinMuxSetup();

    LIDDDisplayEnable();

    LIDDClkConfig(SOC_LCDC_0_REGS, LIDD_INTERFACE_CLOCK, SOC_LCDC_0_MODULE_FREQ);

    LIDDModeSet(SOC_LCDC_0_REGS, LIDD_MODE_HITACHI);

    /*
    ** The strobe timing parameters need to referred to from the 
    ** character display datasheet
    */
    csConf = LIDD_CS_CONF(0, 1, 1, 0, 1, 1, 1);
    LIDDCSTimingConfig(SOC_LCDC_0_REGS, LIDD_CS, csConf);
}

/*
** The commands are written to the ADDR register since the writes
** to this register asserts the ALE/RS for the character LCD
*/
static void DisplayControlValueWrite(unsigned char value)
{
    LIDDAddrIndexSet(SOC_LCDC_0_REGS, LIDD_CS, value);    
    Delay(0xFFF);
}

/*
** Init sequence for the display. For the exact sequence refer to the 
** character display device data sheet
*/
static void InitDisplay(void)
{
    DisplayControlValueWrite(LIDD_DISPLAY_INIT_SEQ1);    
    DisplayControlValueWrite(LIDD_DISPLAY_INIT_SEQ1);    
    DisplayControlValueWrite(LIDD_DISPLAY_INIT_SEQ1);    

    DisplayControlValueWrite(LIDD_DISPLAY_INIT_SEQ2);

    DisplayControlValueWrite(LIDD_DISPLAY_OFF);

    DisplayControlValueWrite(LIDD_DISPLAY_CLEAR);

    DisplayControlValueWrite(LIDD_ENTRY_MODE);
}

static void DisplayMsgWrite(char *msg, unsigned int len)
{
    unsigned int count;

    for (count = 0;  count < len; count++)
    {
        LIDDDataWrite(SOC_LCDC_0_REGS, LIDD_CS, msg[count]);
        Delay(0xFFF);
    }
}

/* Horizontal scroll */
static void DisplayMsgScroll(unsigned int len)
{
    unsigned int count;

    for (count = 0;  count < len; count++)
    {
        DisplayControlValueWrite(LIDD_DISPLAY_SCROLL_RIGHT);
		Delay(0x7FFFF);
    }
	
	Delay(0x3FFFFF);

    for (count = 0;  count < len; count++)
    {
        DisplayControlValueWrite(LIDD_DISPLAY_SCROLL_LEFT);
		Delay(0x7FFFF);
    }
}

int main(void)
{
    char *message = "WELCOME TO STARTERWARE";

    SetupIntc();

    SetUpLCD();

    InitDisplay();

    /* Turn on the display */
    DisplayControlValueWrite(LIDD_DISPLAY_ON);

    DisplayControlValueWrite(LIDD_DISPLAY_HOME);

    DisplayControlValueWrite(LIDD_DISPLAY_CURSOR_OFF);

    do
    {
        DisplayControlValueWrite(LIDD_DISPLAY_HOME);
        DisplayMsgWrite(message, 22);
        DisplayMsgScroll(40);
    } while(1);
}

