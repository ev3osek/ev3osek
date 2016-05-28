/**
 * \file     gpio.c
 *
 * \brief    This file selects the pin 0 of GPIO Bank 4 for use.
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

/* HW Macros */

#include "hw_syscfg0_AM1808.h"
#include "soc_AM1808.h"
#include "evmAM1808.h"
#include "hw_types.h"

/*****************************************************************************
**                       MACRO DEFINITION
*****************************************************************************/
/* Pin Multiplexing bit mask to select GP4[0] pin. */
#define PINMUX10_GPIO4_0_ENABLE    (SYSCFG_PINMUX10_PINMUX10_31_28_GPIO4_0  << \
                                    SYSCFG_PINMUX10_PINMUX10_31_28_SHIFT)
 

/*****************************************************************************
**                       FUNCTION DEFINITION
*****************************************************************************/

/**
 * \brief   This function selects the Pin 0 of GPIO bank 4 for use.
 *          This GPIO pin is multiplexed with pins of other peripherals
 *          in the System on Chip(SoC).
 *         
 * \return  None.
 *
 */

void GPIOBank4Pin0PinMuxSetup(void)
{
     unsigned int savePinmux = 0;
     
     /*
     ** Clearing the bit in context and retaining the other bit values 
     ** in PINMUX10 register. 
     */
     savePinmux = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(10)) &
                  ~(SYSCFG_PINMUX10_PINMUX10_31_28));

     /* Setting the pins corresponding to GP4[0] in PINMUX10 register.*/
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(10)) = 
          (PINMUX10_GPIO4_0_ENABLE | savePinmux);

}

/******************************* End of file ********************************/
