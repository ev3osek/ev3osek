/**
 *  \file   emac.c
 *
 *  \brief  This file contains the board specific code for enabling the use of
 *          emac driver.
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

#define PINMUX4_MDIO_ENABLE      (SYSCFG_PINMUX4_PINMUX4_7_4_MDIO_D << \
                                  SYSCFG_PINMUX4_PINMUX4_7_4_SHIFT) | \
                                 (SYSCFG_PINMUX4_PINMUX4_3_0_MDIO_CLK << \
                                  SYSCFG_PINMUX4_PINMUX4_3_0_SHIFT)

#define PINMUX2_EMAC_ENABLE      (SYSCFG_PINMUX2_PINMUX2_31_28_MII_TXD0 << \
                                  SYSCFG_PINMUX2_PINMUX2_31_28_SHIFT) | \
                                 (SYSCFG_PINMUX2_PINMUX2_27_24_MII_TXD1 << \
                                  SYSCFG_PINMUX2_PINMUX2_27_24_SHIFT) | \
                                 (SYSCFG_PINMUX2_PINMUX2_23_20_MII_TXD2 << \
                                  SYSCFG_PINMUX2_PINMUX2_23_20_SHIFT) | \
                                 (SYSCFG_PINMUX2_PINMUX2_19_16_MII_TXD3 << \
                                  SYSCFG_PINMUX2_PINMUX2_19_16_SHIFT) | \
                                 (SYSCFG_PINMUX2_PINMUX2_15_12_MII_COL << \
                                  SYSCFG_PINMUX2_PINMUX2_15_12_SHIFT) | \
                                 (SYSCFG_PINMUX2_PINMUX2_11_8_MII_TXCLK << \
                                  SYSCFG_PINMUX2_PINMUX2_11_8_SHIFT) | \
                                 (SYSCFG_PINMUX2_PINMUX2_7_4_MII_TXEN << \
                                  SYSCFG_PINMUX2_PINMUX2_7_4_SHIFT)


#define PINMUX3_EMAC_ENABLE      (SYSCFG_PINMUX3_PINMUX3_31_28_MII_RXD0 << \
                                  SYSCFG_PINMUX3_PINMUX3_31_28_SHIFT) | \
                                 (SYSCFG_PINMUX3_PINMUX3_27_24_MII_RXD1 << \
                                  SYSCFG_PINMUX3_PINMUX3_27_24_SHIFT) | \
                                 (SYSCFG_PINMUX3_PINMUX3_23_20_MII_RXD2 << \
                                  SYSCFG_PINMUX3_PINMUX3_23_20_SHIFT) | \
                                 (SYSCFG_PINMUX3_PINMUX3_19_16_MII_RXD3 << \
                                  SYSCFG_PINMUX3_PINMUX3_19_16_SHIFT) | \
                                 (SYSCFG_PINMUX3_PINMUX3_15_12_MII_CRS << \
                                  SYSCFG_PINMUX3_PINMUX3_15_12_SHIFT) | \
                                 (SYSCFG_PINMUX3_PINMUX3_11_8_MII_RXER << \
                                  SYSCFG_PINMUX3_PINMUX3_11_8_SHIFT) | \
                                 (SYSCFG_PINMUX3_PINMUX3_7_4_MII_RXDV << \
                                  SYSCFG_PINMUX3_PINMUX3_7_4_SHIFT) | \
                                 (SYSCFG_PINMUX3_PINMUX3_3_0_MII_RXCLK << \
                                  SYSCFG_PINMUX3_PINMUX3_3_0_SHIFT)


/******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/

/**
 * \brief   This function selects the MII and MDIO pins of EMAC peripheral for
 *          use. These pins are multiplexed with pins of other peripherals in the
 *          System on Chip(SoC).
 *
 * \param   None.
 *
 * \return  None.
 */

void EMACPinMuxSetup(void)
{
    unsigned int savePinMux = 0;

    /*
    ** Clearing the bits in context and retaining the other bit values
    ** of PINMUX4 register.
    */
    savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                       ~(SYSCFG_PINMUX4_PINMUX4_3_0 | \
                         SYSCFG_PINMUX4_PINMUX4_7_4);
    /*
    ** Performing the actual pin multiplexing to select MDIO peripheral's pins
    ** for use.
    */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
         (PINMUX4_MDIO_ENABLE | savePinMux);


    /*
    ** Clearing the bits in context and retaining the other bit values
    ** of PINMUX2 register.
    */
    savePinMux =  HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(2)) & \
                        ~(SYSCFG_PINMUX2_PINMUX2_31_28 | \
                          SYSCFG_PINMUX2_PINMUX2_27_24 | \
                          SYSCFG_PINMUX2_PINMUX2_23_20 | \
                          SYSCFG_PINMUX2_PINMUX2_19_16 | \
                          SYSCFG_PINMUX2_PINMUX2_15_12 | \
                          SYSCFG_PINMUX2_PINMUX2_11_8 | \
                          SYSCFG_PINMUX2_PINMUX2_7_4);

    /*
    ** Performing the actual Pin Multiplexing to select relevant pins in
    ** PINMUX2 register.
    */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(2)) = \
         (PINMUX2_EMAC_ENABLE | savePinMux);

    /*
    ** Clearing the bits in context and retaining the other bit values
    ** of PINMUX3 register.
    */
    savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                       ~(SYSCFG_PINMUX3_PINMUX3_31_28 | \
                         SYSCFG_PINMUX3_PINMUX3_27_24 | \
                         SYSCFG_PINMUX3_PINMUX3_23_20 | \
                         SYSCFG_PINMUX3_PINMUX3_19_16 | \
                         SYSCFG_PINMUX3_PINMUX3_15_12 | \
                         SYSCFG_PINMUX3_PINMUX3_11_8 | \
                         SYSCFG_PINMUX3_PINMUX3_7_4 | \
                         SYSCFG_PINMUX3_PINMUX3_3_0);


    /*
    ** Performing the actual Pin Multiplexing to select relevant pins in
    ** PINMUX3 register.
    */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
         (PINMUX3_EMAC_ENABLE | savePinMux);

    /* Enable MII mode of operation */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP3) &= ~(SYSCFG_CFGCHIP3_RMII_SEL);

}


/****************************** End Of File ***********************************/
