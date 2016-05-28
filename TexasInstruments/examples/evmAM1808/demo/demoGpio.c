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

#include "hw_types.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "gpio.h"
#include "demoTouch.h"
#include "demoCfg.h"
#include "demoGpio.h"

/*******************************************************************************
**                       INTERNAL MACRO DEFINITIONS
*******************************************************************************/

/*******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void Gpio0Isr(void);

/*******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
unsigned int cardDetFlag = FALSE;

/*******************************************************************************
**                     FUNCTION DEFINITIONS
*******************************************************************************/
/*
** Registers the GPIO ISR.
*/
#ifdef _TMS320C6X
void Gpio0IntRegister(unsigned int cpuINT)
{
    IntRegister(cpuINT, Gpio0Isr);
    IntEventMap(cpuINT, SYS_INT_GPIO_B4INT);
}
#else
void Gpio0IntRegister(unsigned int channel)
{
    IntRegister(SYS_INT_GPIOB4, Gpio0Isr);
    IntChannelSet(SYS_INT_GPIOB4, channel);
}
#endif

/*
** Configures the GPIO for card detection
*/
void Gpio0CardDetConfig(void)
{
    /* Sets the pin 65(GP4[0]) as input.*/
    GPIODirModeSet(SOC_GPIO_0_REGS, 65, GPIO_DIR_INPUT);

    /*
    ** Configure rising edge and falling edge triggers on pin 65 to generate
    ** an interrupt
    */
    GPIOIntTypeSet(SOC_GPIO_0_REGS, 65, GPIO_INT_TYPE_BOTHEDGE);
}

/*
** Detects if a card is inserted or removed 
*/
unsigned int GpioCardInserted(void)
{
    if(GPIOPinRead(SOC_GPIO_0_REGS, 65))
    {
        return FALSE; 
    }
  
    else
    {
        return TRUE;
    }
}

/*
** Enables GPIO Bank4 interrupts
*/
void Gpio0IntEnable(void)
{
    GPIOBankIntEnable(SOC_GPIO_0_REGS, 4);
}

/*
** GPIO Interrupt Service Routine
*/
static void Gpio0Isr(void)
{
#ifdef _TMS320C6X
	IntEventClear(SYS_INT_GPIO_B4INT);
#else
    /* Clear the interrupt status in AINTC and in timer */
    IntSystemStatusClear(46);
#endif

    /* Clears the Interrupt Status of GP4[0] in GPIO.*/
    GPIOPinIntClear(SOC_GPIO_0_REGS, 65);

    cardDetFlag = TRUE;
}

/******************************** End of file **********************************/



