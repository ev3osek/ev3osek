/**
 * \file  wdtReset.c
 *
 * \brief Sample application for WDT
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

#include "uart.h"
#include "hw_uart.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "timer.h"
#include "evmAM1808.h"
#include "uartStdio.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define TMR_PERIOD_LSB32               (0x06FFFFFF)
#define TMR_PERIOD_MSB32               (0x0)

/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void TimerSetUpWatchDog(void);

/******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/

/******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
int main(void)
{

    /* Set up the UART2 peripheral */
    UARTStdioInit();

    /* Set up the Timer2 peripheral */
    TimerSetUpWatchDog();

    /* Send the message to UART console */
    UARTPuts("Program Reset!", -1);
    UARTPuts("Input any key at least once in every 4 seconds to avoid a further reset.\n\r", -1);
    
    /* Activate the Watch Dog Timer */   
    TimerWatchdogActivate(SOC_TMR_1_REGS);

    /* Reset the WDT upon any character input */
    while(1)
    {
        /*
        ** Wait for an input through UART. If no input is given, the WDT 
        ** will timeout and reset will occur
        */
        UARTGetc();
            
        /*
        ** Reactivate the WDT upon character input. The WDT will restart
        ** at this point. 
        */
        TimerWatchdogReactivate(SOC_TMR_1_REGS);
    }
}

/*
** Setup the timer for 64 bit WDT mode
*/
static void TimerSetUpWatchDog(void)
{
    /* Configuration of Timer */
    TimerConfigure(SOC_TMR_1_REGS, TMR_CFG_64BIT_WATCHDOG);

    /* Set the 64 bit timer period */
    TimerPeriodSet(SOC_TMR_1_REGS, TMR_TIMER12, TMR_PERIOD_LSB32);
    TimerPeriodSet(SOC_TMR_1_REGS, TMR_TIMER34, TMR_PERIOD_MSB32);
}

/***************************** End Of File ***********************************/
