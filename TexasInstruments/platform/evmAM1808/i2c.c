/**
 *  \file   i2c.c
 *
 *  \brief  This file contains the board specific code for enabling the use of
 *          I2C driver.
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

/*****************************************************************************
**                       MACRO DEFINITIONS
*****************************************************************************/
/* Pin Multiplexing bit masks to select I2C0 pins. */
#define PINMUX4_I2C0_SDA_ENABLE    (SYSCFG_PINMUX4_PINMUX4_15_12_I2C0_SDA << \
                                    SYSCFG_PINMUX4_PINMUX4_15_12_SHIFT)

#define PINMUX4_I2C0_SCL_ENABLE    (SYSCFG_PINMUX4_PINMUX4_11_8_I2C0_SCL << \
                                    SYSCFG_PINMUX4_PINMUX4_11_8_SHIFT)


/* Pin Multiplexing bit masks to select I2C1 pins. */
#define PINMUX4_I2C1_SDA_ENABLE    (SYSCFG_PINMUX4_PINMUX4_23_20_I2C1_SDA << \
                                    SYSCFG_PINMUX4_PINMUX4_23_20_SHIFT)

#define PINMUX4_I2C1_SCL_ENABLE    (SYSCFG_PINMUX4_PINMUX4_19_16_I2C1_SCL << \
                                    SYSCFG_PINMUX4_PINMUX4_19_16_SHIFT)

/*****************************************************************************
**                       FUNCTION DEFINITION
*****************************************************************************/

/**
 * \brief   This function selects the I2C pins for use. The I2C pins are
 *          multiplexed with pins of other peripherals in the System on
 *          Chip(SoC).
 *
 * \param   instanceNum   The instance number of the I2C instance to be used.
 * 
 * \return  None.
 *
 */
void I2CPinMuxSetup(unsigned int instanceNum)
{
     unsigned int savePinMux = 0;

     if(0 == instanceNum)
     {

          /* 
          ** Clearing the bits in context and retaining the other bit values
          ** of PINMUX4 register. 
          */
          savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                             ~(SYSCFG_PINMUX4_PINMUX4_15_12 | \
                               SYSCFG_PINMUX4_PINMUX4_11_8);


          /* Actual selection of I2C0 peripheral's pins for use. */
          HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
               (PINMUX4_I2C0_SDA_ENABLE | \
                PINMUX4_I2C0_SCL_ENABLE | \
                savePinMux);

     }

     else if(1 == instanceNum)
     {

          /* 
          ** Clearing the bits in context and retaining the other bit values
          ** of PINMUX4 register. 
          */
          savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                             ~(SYSCFG_PINMUX4_PINMUX4_23_20 | \
                               SYSCFG_PINMUX4_PINMUX4_19_16);


          /* Actual selection of I2C1 peripheral's pins for use. */
          HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                (PINMUX4_I2C1_SDA_ENABLE | \
                 PINMUX4_I2C1_SCL_ENABLE | \
                 savePinMux);

     }
    
     else
     {

     }

}

/****************************** End of file *********************************/
