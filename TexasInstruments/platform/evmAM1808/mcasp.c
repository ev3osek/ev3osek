/**
 *  \file   mcasp.c
 *
 *  \brief  This file contains the board specific code for enabling the use of
 *          mcasp driver.
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

#include "hw_syscfg0_AM1808.h"
#include "soc_AM1808.h"
#include "evmAM1808.h"
#include "hw_types.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/

/*
** Pin Multiplexing masks for the mandatory pins to be used to operate
** McASP.
*/

#define PINMUX0_MCASP0_ACLKR_ENABLE    (SYSCFG_PINMUX0_PINMUX0_3_0_ACLKR0 << \
                                       SYSCFG_PINMUX0_PINMUX0_3_0_SHIFT)

#define PINMUX0_MCASP0_ACLKX_ENABLE    (SYSCFG_PINMUX0_PINMUX0_7_4_ACLKX0 << \
                                       SYSCFG_PINMUX0_PINMUX0_7_4_SHIFT)

#define PINMUX0_MCASP0_AFSR_ENABLE     (SYSCFG_PINMUX0_PINMUX0_11_8_AFSR0 << \
                                       SYSCFG_PINMUX0_PINMUX0_11_8_SHIFT)

#define PINMUX0_MCASP0_AFSX_ENABLE     (SYSCFG_PINMUX0_PINMUX0_15_12_AFSX0 << \
                                       SYSCFG_PINMUX0_PINMUX0_15_12_SHIFT)

#define PINMUX0_MCASP0_AHCLKR_ENABLE   (SYSCFG_PINMUX0_PINMUX0_19_16_AHCLKR0 << \
                                       SYSCFG_PINMUX0_PINMUX0_19_16_SHIFT)

#define PINMUX0_MCASP0_AHCLKX_ENABLE   (SYSCFG_PINMUX0_PINMUX0_23_20_AHCLKX0 << \
                                       SYSCFG_PINMUX0_PINMUX0_23_20_SHIFT)

#define PINMUX0_MCASP0_AMUTE_ENABLE    (SYSCFG_PINMUX0_PINMUX0_27_24_AMUTE0 << \
                                       SYSCFG_PINMUX0_PINMUX0_27_24_SHIFT)

/* Pin Multiplexing masks for AXR[11] and AXR[12]. */

#define PINMUX1_MCASP0_AXR11_ENABLE    (SYSCFG_PINMUX1_PINMUX1_19_16_AXR0_11 <<\
                                       SYSCFG_PINMUX1_PINMUX1_19_16_SHIFT)

#define PINMUX1_MCASP0_AXR12_ENABLE    (SYSCFG_PINMUX1_PINMUX1_15_12_AXR0_12 << \
                                       SYSCFG_PINMUX1_PINMUX1_15_12_SHIFT)

/******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/

/**
 * \brief   This function selects the McASP pins for use. The McASP pins
 *          are multiplexed with pins of other peripherals in the
 *          System on Chip(SoC).
 *
 * \param   None.
 *
 * \return  None.
 *
 * \note    AM1808 EVM uses AXR[11] and AXR[12] pins for communication.
 *          Thus we have not given a provision to select the serial data
 *          pins other than AXR[11] and AXR[12].
 */

void McASPPinMuxSetup(void)
{
    unsigned int savePinMux = 0;

    /*
    ** Clearing the bits in context and retaining the other bit values
    ** of PINMUX0 register.
    */
    savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) & \
                       ~(SYSCFG_PINMUX0_PINMUX0_27_24 | \
                         SYSCFG_PINMUX0_PINMUX0_23_20 | \
                         SYSCFG_PINMUX0_PINMUX0_19_16 | \
                         SYSCFG_PINMUX0_PINMUX0_15_12 | \
                         SYSCFG_PINMUX0_PINMUX0_11_8 | \
                         SYSCFG_PINMUX0_PINMUX0_7_4 | \
                         SYSCFG_PINMUX0_PINMUX0_3_0);

    /*
    ** Performing the actual Pin Multiplexing to select mandatory pins in
    ** PINMUX0  register.
    */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) = \
         (PINMUX0_MCASP0_AMUTE_ENABLE | PINMUX0_MCASP0_AHCLKX_ENABLE | \
          PINMUX0_MCASP0_AHCLKR_ENABLE | PINMUX0_MCASP0_AFSX_ENABLE | \
          PINMUX0_MCASP0_AFSR_ENABLE | PINMUX0_MCASP0_ACLKX_ENABLE | \
          PINMUX0_MCASP0_ACLKR_ENABLE | savePinMux);

    /*
    ** Performing the Pin Multiplexing for AXR[11] and AXR[12] pins
    ** of McASP.
    */
    savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(1)) & \
                       ~(SYSCFG_PINMUX1_PINMUX1_19_16 | \
                         SYSCFG_PINMUX1_PINMUX1_15_12);

    /*
    ** Performing the actual Pin Multiplexing to select AXR[11] and AXR[12]
    ** pins for use.
    */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(1)) = \
         (PINMUX1_MCASP0_AXR11_ENABLE | \
          PINMUX1_MCASP0_AXR12_ENABLE | \
          savePinMux);
}


/****************************** End Of File ***********************************/
