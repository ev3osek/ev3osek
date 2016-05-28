/**
 * \file  vpif.c
 *
 * \brief This file contains the board specific code for enabling the use of
 *        VPIF.
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
#include "hw_types.h"

/* EVM AM1808 APIs */
#include "evmAM1808.h"
#include "soc_AM1808.h"
#include "hw_syscfg0_AM1808.h"


/*****************************************************************************
**                      MACRO DEFINITIONS
*****************************************************************************/
#define PINMUX14_VPIF_ENABLE    (SYSCFG_PINMUX14_PINMUX14_31_28_DIN2 << \
                                 SYSCFG_PINMUX14_PINMUX14_31_28_SHIFT) | \
                                (SYSCFG_PINMUX14_PINMUX14_27_24_DIN3 << \
                                 SYSCFG_PINMUX14_PINMUX14_27_24_SHIFT) | \
                                (SYSCFG_PINMUX14_PINMUX14_23_20_DIN4 << \
                                 SYSCFG_PINMUX14_PINMUX14_23_20_SHIFT) | \
                                (SYSCFG_PINMUX14_PINMUX14_19_16_DIN5 << \
                                 SYSCFG_PINMUX14_PINMUX14_19_16_SHIFT) | \
                                (SYSCFG_PINMUX14_PINMUX14_15_12_DIN6 << \
                                 SYSCFG_PINMUX14_PINMUX14_15_12_SHIFT) | \
                                (SYSCFG_PINMUX14_PINMUX14_11_8_DIN7 << \
                                 SYSCFG_PINMUX14_PINMUX14_11_8_SHIFT) | \
                                (SYSCFG_PINMUX14_PINMUX14_7_4_CLKIN1 << \
                                 SYSCFG_PINMUX14_PINMUX14_7_4_SHIFT) | \
                                (SYSCFG_PINMUX14_PINMUX14_3_0_CLKIN0 << \
                                 SYSCFG_PINMUX14_PINMUX14_3_0_SHIFT)


#define PINMUX15_VPIF_ENABLE    (SYSCFG_PINMUX15_PINMUX15_31_28_DIN10 << \
                                 SYSCFG_PINMUX15_PINMUX15_31_28_SHIFT) | \
                                (SYSCFG_PINMUX15_PINMUX15_27_24_DIN11 << \
                                 SYSCFG_PINMUX15_PINMUX15_27_24_SHIFT) | \
                                (SYSCFG_PINMUX15_PINMUX15_23_20_DIN12 << \
                                 SYSCFG_PINMUX15_PINMUX15_23_20_SHIFT) | \
                                (SYSCFG_PINMUX15_PINMUX15_19_16_DIN13_FIELD << \
                                 SYSCFG_PINMUX15_PINMUX15_19_16_SHIFT) | \
                                (SYSCFG_PINMUX15_PINMUX15_15_12_DIN14_HSYNC << \
                                 SYSCFG_PINMUX15_PINMUX15_15_12_SHIFT) | \
                                (SYSCFG_PINMUX15_PINMUX15_11_8_DIN15_VSYNC << \
                                 SYSCFG_PINMUX15_PINMUX15_11_8_SHIFT) | \
                                (SYSCFG_PINMUX15_PINMUX15_7_4_DIN0 << \
                                 SYSCFG_PINMUX15_PINMUX15_7_4_SHIFT) | \
                                (SYSCFG_PINMUX15_PINMUX15_3_0_DIN1 << \
                                 SYSCFG_PINMUX15_PINMUX15_3_0_SHIFT)



#define PINMUX16_VPIF_ENABLE    (SYSCFG_PINMUX16_PINMUX16_31_28_DOUT2 << \
                                 SYSCFG_PINMUX16_PINMUX16_31_28_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_27_24_DOUT3 << \
                                 SYSCFG_PINMUX16_PINMUX16_27_24_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_23_20_DOUT4 << \
                                 SYSCFG_PINMUX16_PINMUX16_23_20_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_19_16_DOUT5 << \
                                 SYSCFG_PINMUX16_PINMUX16_19_16_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_15_12_DOUT6 << \
                                 SYSCFG_PINMUX16_PINMUX16_15_12_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_11_8_DOUT7 << \
                                 SYSCFG_PINMUX16_PINMUX16_11_8_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_7_4_DIN8 << \
                                 SYSCFG_PINMUX16_PINMUX16_7_4_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_3_0_DIN9 << \
                                 SYSCFG_PINMUX16_PINMUX16_3_0_SHIFT)

#define PINMUX17_VPIF_ENABLE    (SYSCFG_PINMUX17_PINMUX17_31_28_DOUT10 << \
                                 SYSCFG_PINMUX17_PINMUX17_31_28_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_27_24_DOUT11 << \
                                 SYSCFG_PINMUX17_PINMUX17_27_24_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_23_20_DOUT12 << \
                                 SYSCFG_PINMUX17_PINMUX17_23_20_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_19_16_DOUT13 << \
                                 SYSCFG_PINMUX17_PINMUX17_19_16_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_15_12_DOUT14 << \
                                 SYSCFG_PINMUX17_PINMUX17_15_12_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_11_8_DOUT15 << \
                                 SYSCFG_PINMUX17_PINMUX17_11_8_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_7_4_DOUT0 << \
                                 SYSCFG_PINMUX17_PINMUX17_7_4_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_3_0_DOUT1 << \
                                 SYSCFG_PINMUX17_PINMUX17_3_0_SHIFT)

#define PINMUX18_VPIF_ENABLE    (SYSCFG_PINMUX18_PINMUX18_7_4_DOUT8 << \
                                 SYSCFG_PINMUX18_PINMUX18_7_4_SHIFT) | \
                                (SYSCFG_PINMUX18_PINMUX18_3_0_DOUT9 << \
                                 SYSCFG_PINMUX18_PINMUX18_3_0_SHIFT)
 
#define PINMUX19_VPIF_ENABLE    (SYSCFG_PINMUX19_PINMUX19_23_20_CLKO3 << \
                                 SYSCFG_PINMUX19_PINMUX19_23_20_SHIFT) | \
                                (SYSCFG_PINMUX19_PINMUX19_19_16_CLKIN3 << \
                                 SYSCFG_PINMUX19_PINMUX19_19_16_SHIFT) | \
                                (SYSCFG_PINMUX19_PINMUX19_15_12_CLKO2 << \
                                 SYSCFG_PINMUX19_PINMUX19_15_12_SHIFT) | \
                                (SYSCFG_PINMUX19_PINMUX19_11_8_CLKIN2 << \
                                 SYSCFG_PINMUX19_PINMUX19_11_8_SHIFT)

   
/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/

/*****************************************************************************
**                       FUNCTION DEFINITION
*****************************************************************************/

/**
 * \brief   This function selects the VPIF pins for use. The VPIF pins
 *          are multiplexed with pins of other peripherals in the
 *          System on Chip(SoC).
 *
 * \param   None.
 *
 * \return  None.
 */

void VPIFPinMuxSetup(void)
{
     unsigned int savePinMux = 0;

     /* Programming the PINMUX14 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX14 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(14)) & \
                        ~(SYSCFG_PINMUX14_PINMUX14_31_28 | \
                          SYSCFG_PINMUX14_PINMUX14_27_24 | \
                          SYSCFG_PINMUX14_PINMUX14_23_20 | \
                          SYSCFG_PINMUX14_PINMUX14_19_16 | \
                          SYSCFG_PINMUX14_PINMUX14_15_12 | \
                          SYSCFG_PINMUX14_PINMUX14_11_8 | \
                          SYSCFG_PINMUX14_PINMUX14_7_4 | \
                          SYSCFG_PINMUX14_PINMUX14_3_0);


     /*
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX14  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(14)) = \
          (PINMUX14_VPIF_ENABLE | savePinMux);

     /* Programming the PINMUX15 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX15 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(15)) & \
                        ~(SYSCFG_PINMUX15_PINMUX15_31_28 | \
                          SYSCFG_PINMUX15_PINMUX15_27_24 | \
                          SYSCFG_PINMUX15_PINMUX15_23_20 | \
                          SYSCFG_PINMUX15_PINMUX15_19_16 | \
                          SYSCFG_PINMUX15_PINMUX15_15_12 | \
                          SYSCFG_PINMUX15_PINMUX15_11_8 | \
                          SYSCFG_PINMUX15_PINMUX15_7_4 | \
                          SYSCFG_PINMUX15_PINMUX15_3_0);


     /*
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX15  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(15)) = \
          (PINMUX15_VPIF_ENABLE | savePinMux);

     /* Programming the PINMUX16 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX16 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(16)) & \
                        ~(SYSCFG_PINMUX16_PINMUX16_31_28 | \
                          SYSCFG_PINMUX16_PINMUX16_27_24 | \
                          SYSCFG_PINMUX16_PINMUX16_23_20 | \
                          SYSCFG_PINMUX16_PINMUX16_19_16 | \
                          SYSCFG_PINMUX16_PINMUX16_15_12 | \
                          SYSCFG_PINMUX16_PINMUX16_11_8 | \
                          SYSCFG_PINMUX16_PINMUX16_7_4 | \
                          SYSCFG_PINMUX16_PINMUX16_3_0);


     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX16  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(16)) = \
          (PINMUX16_VPIF_ENABLE | savePinMux);
 
     /* Programming the PINMUX17 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX17 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(17)) & \
                        ~(SYSCFG_PINMUX17_PINMUX17_31_28 | \
                          SYSCFG_PINMUX17_PINMUX17_27_24 | \
                          SYSCFG_PINMUX17_PINMUX17_23_20 | \
                          SYSCFG_PINMUX17_PINMUX17_19_16 | \
                          SYSCFG_PINMUX17_PINMUX17_15_12 | \
                          SYSCFG_PINMUX17_PINMUX17_11_8 | \
                          SYSCFG_PINMUX17_PINMUX17_7_4 | \
                          SYSCFG_PINMUX17_PINMUX17_3_0);

     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX17  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(17)) = \
          (PINMUX17_VPIF_ENABLE | savePinMux);

     /* Programming the PINMUX18 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX18 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(18)) & \
                       ~(SYSCFG_PINMUX18_PINMUX18_7_4 |  \
                         SYSCFG_PINMUX18_PINMUX18_3_0);

     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX18  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(18)) = \
           (PINMUX18_VPIF_ENABLE | savePinMux);
     

     /* Programming the PINMUX19 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX19 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) & \
                       ~(SYSCFG_PINMUX19_PINMUX19_23_20 | \
                         SYSCFG_PINMUX19_PINMUX19_19_16 | \
                         SYSCFG_PINMUX19_PINMUX19_15_12 | \
                         SYSCFG_PINMUX19_PINMUX19_11_8);
 
     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX19 register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) = \
          (PINMUX19_VPIF_ENABLE | savePinMux);

}


/****************************** End of file *********************************/
