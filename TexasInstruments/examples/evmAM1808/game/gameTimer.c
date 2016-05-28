/**
 * \file    demoTimer.c
 *
 * \brief   This file contains Timer related functions.
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

#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "timer.h"
#include "gameTimer.h"

/*******************************************************************************
**                       INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define TMR_STEP_CNT                        (7u)
#define TMR_PERIOD                          (0xFFFFFFFFu)

/*******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void Timer2Isr(void);

/*******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
static unsigned int tmrIsrCnt = 0u;
static unsigned int tmrStep = TMR_STEP_CNT;

unsigned int tmrStepVary = FALSE;
unsigned int tmrFlag = FALSE;

/*******************************************************************************
**                     FUNCTION DEFINITIONS
*******************************************************************************/
/*
** Registers the Timer2 ISR.
*/
void Timer2IntRegister(unsigned int channel)
{
#ifdef _TMS320C6X
	IntRegister(C674X_MASK_INT6, Timer2Isr);
	IntEventMap(C674X_MASK_INT6, SYS_INT_T64P2_TINTALL);
	IntEnable(C674X_MASK_INT6);
#else
    IntRegister(SYS_INT_TIMR2_ALL, Timer2Isr);
    IntChannelSet(SYS_INT_TIMR2_ALL, channel);
#endif
}

/*
** Configures the Timer2 for 32 bit
*/
void Timer2Config(void)
{
    /* Configure the Timer for 64 bit unchained mode */
    TimerConfigure(SOC_TMR_2_REGS, TMR_CFG_64BIT_CLK_INT);
 
    /* Set the value for the Timer */
    TimerPeriodSet(SOC_TMR_2_REGS, TMR_TIMER12, TMR_PERIOD);
    TimerPeriodSet(SOC_TMR_2_REGS, TMR_TIMER34, 0);
}

/*
** Enables the Timer2 Interrupts
*/
void Timer2IntEnable(void)
{
    /* Enable the timer interrupt */
    TimerIntEnable(SOC_TMR_2_REGS, TMR_INT_TMR12_NON_CAPT_MODE);
}

/*
** Starts the Timer
*/
void Timer2Start(void)
{
    tmrStep = TMR_STEP_CNT;
 
    /* Enable the Timer12. It starts counting */
    TimerEnable(SOC_TMR_2_REGS, TMR_TIMER12, TMR_ENABLE_CONTRELOAD);
}

/*
** Stops the Timer. The Timer Counter is Reset.
*/
void Timer2Stop(void)
{
    TimerDisable(SOC_TMR_2_REGS, TMR_TIMER12);
    TimerCounterSet(SOC_TMR_2_REGS, TMR_TIMER12, 0);
}

/*
** Timer 2 Interrupt Service Routine
*/
static void Timer2Isr(void)
{
    /* Clear the interrupt status in AINTC and in timer */
#ifdef _TMS320C6X
	IntEventClear(SYS_INT_T64P2_TINTALL);
#else
    IntSystemStatusClear(68);
#endif
    TimerIntStatusClear(SOC_TMR_2_REGS, TMR_INT_TMR12_NON_CAPT_MODE);
    
    tmrIsrCnt = (tmrIsrCnt + 1) & 0x07;
 
    if(tmrIsrCnt == tmrStep)
    {
        tmrFlag = TRUE;
        tmrIsrCnt = 0;

        if(TRUE == tmrStepVary)
        {
            tmrStep = (tmrStep + 1) & 0x07;  
        }
    } 
}

/******************************** End of file **********************************/



