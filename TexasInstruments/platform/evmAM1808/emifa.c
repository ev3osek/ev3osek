/**
 * \file  emifa.c
 *
 * \brief This file contains the board specific code for enabling the use of
 *        emifa driver.
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
#include "hw_types.h"
#include "evmAM1808.h"
#include "psc.h"

/*****************************************************************************
**                      MACRO DEFINITIONS
*****************************************************************************/

#define PINMUX7_NAND_ENABLE     (SYSCFG_PINMUX7_PINMUX7_7_4_NEMA_CS3 << \
                                 SYSCFG_PINMUX7_PINMUX7_7_4_SHIFT) | \
                                (SYSCFG_PINMUX7_PINMUX7_11_8_NEMA_CS4 << \
                                 SYSCFG_PINMUX7_PINMUX7_11_8_SHIFT) | \
                                (SYSCFG_PINMUX7_PINMUX7_19_16_NEMA_WE << \
                                 SYSCFG_PINMUX7_PINMUX7_19_16_SHIFT) | \
                                (SYSCFG_PINMUX7_PINMUX7_23_20_NEMA_OE << \
                                 SYSCFG_PINMUX7_PINMUX7_23_20_SHIFT)

#define PINMUX9_NAND_ENABLE     (SYSCFG_PINMUX9_PINMUX9_3_0_EMA_D7 << \
                                 SYSCFG_PINMUX9_PINMUX9_3_0_SHIFT) | \
                                (SYSCFG_PINMUX9_PINMUX9_7_4_EMA_D6 << \
                                 SYSCFG_PINMUX9_PINMUX9_7_4_SHIFT) | \
                                (SYSCFG_PINMUX9_PINMUX9_11_8_EMA_D5 << \
                                 SYSCFG_PINMUX9_PINMUX9_11_8_SHIFT) | \
                                (SYSCFG_PINMUX9_PINMUX9_15_12_EMA_D4 << \
                                 SYSCFG_PINMUX9_PINMUX9_15_12_SHIFT) | \
                                (SYSCFG_PINMUX9_PINMUX9_19_16_EMA_D3 << \
                                 SYSCFG_PINMUX9_PINMUX9_19_16_SHIFT) | \
                                (SYSCFG_PINMUX9_PINMUX9_23_20_EMA_D2 << \
                                 SYSCFG_PINMUX9_PINMUX9_23_20_SHIFT) | \
                                (SYSCFG_PINMUX9_PINMUX9_27_24_EMA_D1 << \
                                 SYSCFG_PINMUX9_PINMUX9_27_24_SHIFT) | \
                                (SYSCFG_PINMUX9_PINMUX9_31_28_EMA_D0 << \
                                 SYSCFG_PINMUX9_PINMUX9_31_28_SHIFT)

#define PINMUX12_NAND_ENABLE    (SYSCFG_PINMUX12_PINMUX12_27_24_EMA_A1 << \
                                 SYSCFG_PINMUX12_PINMUX12_27_24_SHIFT) | \
                                (SYSCFG_PINMUX12_PINMUX12_23_20_EMA_A2 << \
                                 SYSCFG_PINMUX12_PINMUX12_23_20_SHIFT)
 
/*****************************************************************************
**                       FUNCTION DEFINITION
*****************************************************************************/

/**
 * \brief   This function enables the EMIF modules and clocks on the SoC.
 *
 * \param   None.
 *
 * \return  None.
 */
void EMIFAClkConfig(void)
{
 
    /* Power on the EMIFA */
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_EMIFA, PSC_POWERDOMAIN_ALWAYS_ON,
                     PSC_MDCTL_NEXT_ENABLE);    
 
}

/**
 * \brief   This function selects the NAND pins for use. The NAND pins
 *          are multiplexed with pins of other peripherals in the
 *          System on Chip(SoC).
 *
 * \param   None.
 *
 * \return  None.
 */
void NANDPinMuxSetup(void)
{
     volatile unsigned int savePinMux = 0;


     /* Programming the PINMUX7 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX7 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(7)) & \
                        ~(SYSCFG_PINMUX7_PINMUX7_23_20 | \
                          SYSCFG_PINMUX7_PINMUX7_19_16 | \
                          SYSCFG_PINMUX7_PINMUX7_11_8 | \
                          SYSCFG_PINMUX7_PINMUX7_7_4);


     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX16  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(7)) = \
          (PINMUX7_NAND_ENABLE | savePinMux);
 
     /* Programming the PINMUX9 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX9 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(9)) & \
                        ~(SYSCFG_PINMUX9_PINMUX9_31_28 | \
                          SYSCFG_PINMUX9_PINMUX9_27_24 | \
                          SYSCFG_PINMUX9_PINMUX9_23_20 | \
                          SYSCFG_PINMUX9_PINMUX9_19_16 | \
                          SYSCFG_PINMUX9_PINMUX9_15_12 | \
                          SYSCFG_PINMUX9_PINMUX9_11_8 | \
                          SYSCFG_PINMUX9_PINMUX9_7_4 | \
                          SYSCFG_PINMUX9_PINMUX9_3_0);

     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX9  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(9)) = \
          (PINMUX9_NAND_ENABLE | savePinMux);

     /* Programming the PINMUX12 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX12 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(12)) & \
                       ~(SYSCFG_PINMUX12_PINMUX12_27_24 | \
                         SYSCFG_PINMUX12_PINMUX12_23_20);

     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX12  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(12)) = \
           (PINMUX12_NAND_ENABLE | savePinMux);

}

/****************************** End of file *********************************/
