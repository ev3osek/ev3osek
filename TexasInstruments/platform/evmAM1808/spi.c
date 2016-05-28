/**
 * \file  spi.c
 *
 * \brief This file contains the board specific code for enabling the use of
 *        SPI driver.
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
**                        MACRO DEFINITIONS
*****************************************************************************/

/* Pin multiplexing bit masks for SPI0 pins. */
#define PINMUX3_SPI0_CLK_ENABLE   (SYSCFG_PINMUX3_PINMUX3_3_0_SPI0_CLK << \
                                    SYSCFG_PINMUX3_PINMUX3_3_0_SHIFT)

#define PINMUX3_SPI0_SIMO_ENABLE  (SYSCFG_PINMUX3_PINMUX3_15_12_SPI0_SIMO0 << \
                                    SYSCFG_PINMUX3_PINMUX3_15_12_SHIFT)

#define PINMUX3_SPI0_SOMI_ENABLE  (SYSCFG_PINMUX3_PINMUX3_11_8_SPI0_SOMI0 << \
                                    SYSCFG_PINMUX3_PINMUX3_11_8_SHIFT)

#define PINMUX3_SPI0_ENA_ENABLE   (SYSCFG_PINMUX3_PINMUX3_7_4_NSPI0_ENA << \
                                    SYSCFG_PINMUX3_PINMUX3_7_4_SHIFT)

/* Pin multiplexing bit masks for SPI1 pins. */

#define PINMUX5_SPI1_CLK_ENABLE   (SYSCFG_PINMUX5_PINMUX5_11_8_SPI1_CLK << \
                                   SYSCFG_PINMUX5_PINMUX5_11_8_SHIFT)

#define PINMUX5_SPI1_SIMO_ENABLE  (SYSCFG_PINMUX5_PINMUX5_23_20_SPI1_SIMO0 << \
                                   SYSCFG_PINMUX5_PINMUX5_23_20_SHIFT)

#define PINMUX5_SPI1_SOMI_ENABLE  (SYSCFG_PINMUX5_PINMUX5_19_16_SPI1_SOMI0 << \
                                   SYSCFG_PINMUX5_PINMUX5_19_16_SHIFT)

#define PINMUX5_SPI1_ENA_ENABLE   (SYSCFG_PINMUX5_PINMUX5_15_12_NSPI1_ENA << \
                                   SYSCFG_PINMUX5_PINMUX5_15_12_SHIFT)


/*****************************************************************************
**                        FUNCTION DEFINITIONS
*****************************************************************************/

/**
 * \brief   This function selects the SPI0 pins for use. The SPI0 pins
 *          are multiplexed with pins of other peripherals in the 
 *          System on Chip(SoC).
 *  
 * \param   None.
 * 
 * \return  None. 
 */


void SPIPinMuxSetup(unsigned int instanceNum)
{
    unsigned int savePinMux = 0;    

    if(0 == instanceNum)
    {
        /* 
        ** Clearing the bits in context and retaining the other bit values
        ** of PINMUX3 register. 
        */
        savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                            ~(SYSCFG_PINMUX3_PINMUX3_3_0 | \
                              SYSCFG_PINMUX3_PINMUX3_15_12 | \
                              SYSCFG_PINMUX3_PINMUX3_11_8 | \
                              SYSCFG_PINMUX3_PINMUX3_7_4);

        /* Actual selection of SPI0 peripheral's pins for use. */
        HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
             (PINMUX3_SPI0_CLK_ENABLE | PINMUX3_SPI0_SIMO_ENABLE | \
              PINMUX3_SPI0_SOMI_ENABLE | PINMUX3_SPI0_ENA_ENABLE | \
              savePinMux);

    }
    else if(1 == instanceNum)
    {
        /* 
        ** Clearing the bits in context and retaining the other bit values
        ** of PINMUX5 register. 
        */
        savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) & \
                            ~(SYSCFG_PINMUX5_PINMUX5_11_8 | \
                              SYSCFG_PINMUX5_PINMUX5_23_20 | \
                              SYSCFG_PINMUX5_PINMUX5_19_16 | \
                              SYSCFG_PINMUX5_PINMUX5_15_12);     

        /* Actual selection of SPI1 peripheral's pins for use. */
        HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) = \
             (PINMUX5_SPI1_CLK_ENABLE | PINMUX5_SPI1_SIMO_ENABLE | \
              PINMUX5_SPI1_SOMI_ENABLE | PINMUX5_SPI1_ENA_ENABLE | \
              savePinMux);



    }
    else
    {


    }

}

/**
 * \brief   This function selects the specified Chip Select(CS) pin of 
 *          SPI0 for use.
 *
 * \param   csPinNum    the number of the Chip Select(CS) pin to be used.
 *
 * \return  None.
 */

void SPI0CSPinMuxSetup(unsigned int csPinNum)
{
     unsigned int spi0CSPinMux = 0;
     unsigned int savePinMux = 0;

     switch(csPinNum)
     {
          case 0: 

              /* Obtaining the bit-mask to select SPI0_SCS[0] for use. */
              spi0CSPinMux = (SYSCFG_PINMUX4_PINMUX4_7_4_NSPI0_SCS0 << \
                              SYSCFG_PINMUX4_PINMUX4_7_4_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                                 ~(SYSCFG_PINMUX4_PINMUX4_7_4);

              /* Actual selection of SPI0_SCS[0] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi0CSPinMux | savePinMux); 
          break;

          case 1: 

              /* Obtaining the bit-mask to select SPI0_SCS[1] for use. */
              spi0CSPinMux = (SYSCFG_PINMUX4_PINMUX4_3_0_NSPI0_SCS1 << \
                              SYSCFG_PINMUX4_PINMUX4_3_0_SHIFT);
                  
              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                                 ~(SYSCFG_PINMUX4_PINMUX4_3_0);
                  
              /* Actual selection of SPI0_SCS[1] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi0CSPinMux | savePinMux); 

          break;    

          case 2: 

              /* Obtaining the bit-mask to select SPI0_SCS[2] for use. */
              spi0CSPinMux = (SYSCFG_PINMUX3_PINMUX3_31_28_NSPI0_SCS2 << \
                              SYSCFG_PINMUX3_PINMUX3_31_28_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX3 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                                 ~(SYSCFG_PINMUX3_PINMUX3_31_28); 
                  
                  
              /* Actual selection of SPI0_SCS[2] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
                   (spi0CSPinMux | savePinMux);

          break;

          case 3: 

              /* Obtaining the bit-mask to select SPI0_SCS[3] for use. */
              spi0CSPinMux = (SYSCFG_PINMUX3_PINMUX3_27_24_NSPI0_SCS3 << \
                              SYSCFG_PINMUX3_PINMUX3_27_24_SHIFT);
                  
              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX3 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                                 ~(SYSCFG_PINMUX3_PINMUX3_27_24);

              /* Actual selection of SPI0_SCS[3] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
                   (spi0CSPinMux | savePinMux);

          break;

          case 4: 

              /* Obtaining the bit-mask to select SPI0_SCS[4] for use. */
              spi0CSPinMux = (SYSCFG_PINMUX3_PINMUX3_23_20_NSPI0_SCS4 << \
                              SYSCFG_PINMUX3_PINMUX3_23_20_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX3 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                                 ~(SYSCFG_PINMUX3_PINMUX3_23_20);

              /* Actual selection of SPI0_SCS[4] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
                   (spi0CSPinMux | savePinMux);

          break;

          case 5: 

              /* Obtaining the bit-mask to select SPI0_SCS[5] for use. */
              spi0CSPinMux = (SYSCFG_PINMUX3_PINMUX3_19_16_NSPI0_SCS5 << \
                              SYSCFG_PINMUX3_PINMUX3_19_16_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX3 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                                 ~(SYSCFG_PINMUX3_PINMUX3_19_16);

              /* Actual selection of SPI0_SCS[5] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
                   (spi0CSPinMux | savePinMux);

          break;

          default:
          break;
     }

}

/**
 * \brief   This function selects the specified Chip Select(CS) pin of 
 *          SPI1 for use.
 *
 * \param   csPinNum    the number of the Chip Select(CS) pin to be used.
 *
 * \return  None.
 */

void SPI1CSPinMuxSetup(unsigned int csPinNum)
{
     unsigned int spi1CSPinMux = 0;
     unsigned int savePinMux = 0;

     switch(csPinNum)
     {
          case 0: 

              /* Obtaining the bit-mask to select SPI1_SCS[0] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX5_PINMUX5_7_4_NSPI1_SCS0 << \
                              SYSCFG_PINMUX5_PINMUX5_7_4_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX5 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) & \
                                 ~(SYSCFG_PINMUX5_PINMUX5_7_4);

              /* Actual selection of SPI1_SCS[0] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          case 1: 

              /* Obtaining the bit-mask to select SPI1_SCS[1] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX5_PINMUX5_3_0_NSPI1_SCS1 << \
                              SYSCFG_PINMUX5_PINMUX5_3_0_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX5 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) & \
                                 ~(SYSCFG_PINMUX5_PINMUX5_3_0);

              /* Actual selection of SPI1_SCS[1] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          case 2: 

              /* Obtaining the bit-mask to select SPI1_SCS[2] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX4_PINMUX4_31_28_NSPI1_SCS2 << \
                              SYSCFG_PINMUX4_PINMUX4_31_28_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) &
                                 ~(SYSCFG_PINMUX4_PINMUX4_31_28);

              /* Actual selection of SPI1_SCS[2] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          case 3: 

              /* Obtaining the bit-mask to select SPI1_SCS[3] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX4_PINMUX4_27_24_NSPI1_SCS3 << \
                              SYSCFG_PINMUX4_PINMUX4_27_24_SHIFT);
                  
              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                                 ~(SYSCFG_PINMUX4_PINMUX4_27_24);

              /* Actual selection of SPI1_SCS[3] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          case 4: 

              /* Obtaining the bit-mask to select SPI1_SCS[4] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX4_PINMUX4_23_20_NSPI1_SCS4 << \
                              SYSCFG_PINMUX4_PINMUX4_23_20_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                                 ~(SYSCFG_PINMUX4_PINMUX4_23_20);

              /* Actual selection of SPI1_SCS[4] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          case 5: 

              /* Obtaining the bit-mask to select SPI1_SCS[5] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX4_PINMUX4_19_16_NSPI1_SCS5 << \
                              SYSCFG_PINMUX4_PINMUX4_19_16_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                                 ~(SYSCFG_PINMUX4_PINMUX4_19_16);
                  
              /* Actual selection of SPI1_SCS[5] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          case 6: 

              /* Obtaining the bit-mask to select SPI1_SCS[6] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX4_PINMUX4_15_12_NSPI1_SCS6 << \
                              SYSCFG_PINMUX4_PINMUX4_15_12_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                                 ~(SYSCFG_PINMUX4_PINMUX4_15_12);

              /* Actual selection of SPI1_SCS[6] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          case 7: 

              /* Obtaining the bit-mask to select SPI1_SCS[7] for use. */
              spi1CSPinMux = (SYSCFG_PINMUX4_PINMUX4_11_8_NSPI1_SCS7 << \
                              SYSCFG_PINMUX4_PINMUX4_11_8_SHIFT);

              /* 
              ** Clearing the bits in context and retaining the other bit
              ** values of PINMUX4 register. 
              */
              savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                                 ~(SYSCFG_PINMUX4_PINMUX4_11_8);

              /* Actual selection of SPI1_SCS[7] pin for use. */
              HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
                   (spi1CSPinMux | savePinMux);

          break;

          default:
          break;

     }

}

/***************************** End of file **********************************/
