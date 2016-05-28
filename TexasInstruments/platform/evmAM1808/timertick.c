/**
 * \file   systick.c
 *
 * \brief  system timer tick routines
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


#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_syscfg0_AM1808.h"
#include "timer.h"
#include "evmAM1808.h"
#include "systick.h"

static volatile unsigned int flagIsrCnt = 1;

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define TMR_PERIOD_LSB32              0x5DC0
#define TMR_PERIOD_MSB32              0x0

void (*pfnCallbackHandler)(void);

/*
** Timer Interrupt Service Routine. 
*/
static void TimerTickIsr(void)
{
    /* Disable the timer interrupt */
    TimerIntDisable(SOC_TMR_0_REGS, TMR_INT_TMR34_NON_CAPT_MODE);

    /* Clear the interrupt status in AINTC and in timer */
    IntSystemStatusClear(SYS_INT_TINT34_0);
    TimerIntStatusClear(SOC_TMR_0_REGS, TMR_INT_TMR34_NON_CAPT_MODE);
  
     pfnCallbackHandler(); 
  
    /* Enable the timer interrupt */
    TimerIntEnable(SOC_TMR_0_REGS, TMR_INT_TMR34_NON_CAPT_MODE);
}



void TimerTickConfigure(void (*pfnHandler)(void))
{    

	pfnCallbackHandler = pfnHandler;
	/* Configuration of Timer */
    TimerConfigure(SOC_TMR_0_REGS, TMR_CFG_32BIT_UNCH_CLK_BOTH_INT);

   /* Register the Timer ISR */
    IntRegister(SYS_INT_TINT34_0, TimerTickIsr);
  
    /* Set the channel number for Timer interrupt, it will map to IRQ */
    IntChannelSet(SYS_INT_TINT34_0, 5);
      
      /* Enable timer interrupts in AINTC */
    IntSystemEnable(SYS_INT_TINT34_0);

    /* Enable the timer interrupt */
    TimerIntEnable(SOC_TMR_0_REGS, TMR_INT_TMR34_NON_CAPT_MODE);    
   
}


void TimerTickPeriodSet(unsigned int milliSec)
{

	TimerPeriodSet(SOC_TMR_0_REGS, TMR_TIMER34, (milliSec * TMR_PERIOD_LSB32));
	TimerReloadSet(SOC_TMR_0_REGS, TMR_TIMER34, (milliSec * TMR_PERIOD_LSB32));
}

void TimerTickEnable(void)
{	

	/* Start the timer. Characters from cntArr will be sent from the ISR */
	TimerEnable(SOC_TMR_0_REGS, TMR_TIMER34, TMR_ENABLE_CONTRELOAD);

}

void TimerTickDisable(void)
{
	TimerDisable(SOC_TMR_0_REGS, TMR_TIMER34); 
}



