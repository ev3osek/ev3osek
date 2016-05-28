/**
 *  \file   uart.c
 *
 *  \brief  This file contains the board specific code for enabling the use of
 *          UART driver.
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


/****************************************************************************
**                          MACRO DEFINITIONS
****************************************************************************/

/* Pin multiplexing masks for UART0 pins. */

#define PINMUX3_UART0_CTS_ENABLE    (SYSCFG_PINMUX3_PINMUX3_27_24_UART0_CTS << \
                                     SYSCFG_PINMUX3_PINMUX3_27_24_SHIFT)

#define PINMUX3_UART0_RTS_ENABLE    (SYSCFG_PINMUX3_PINMUX3_31_28_UART0_RTS << \
                                     SYSCFG_PINMUX3_PINMUX3_31_28_SHIFT)

#define PINMUX3_UART0_TXD_ENABLE    (SYSCFG_PINMUX3_PINMUX3_23_20_UART0_TXD << \
                                     SYSCFG_PINMUX3_PINMUX3_23_20_SHIFT)

#define PINMUX3_UART0_RXD_ENABLE    (SYSCFG_PINMUX3_PINMUX3_19_16_UART0_RXD << \
                                     SYSCFG_PINMUX3_PINMUX3_19_16_SHIFT)

/* Pin multiplexing masks for UART1 pins. */

#define PINMUX0_UART1_CTS_ENABLE    (SYSCFG_PINMUX0_PINMUX0_23_20_UART1_CTS << \
                                     SYSCFG_PINMUX0_PINMUX0_23_20_SHIFT)

#define PINMUX0_UART1_RTS_ENABLE    (SYSCFG_PINMUX0_PINMUX0_19_16_UART1_RTS << \
                                     SYSCFG_PINMUX0_PINMUX0_19_16_SHIFT)

#define PINMUX4_UART1_TXD_ENABLE    (SYSCFG_PINMUX4_PINMUX4_31_28_UART1_TXD << \
                                     SYSCFG_PINMUX4_PINMUX4_31_28_SHIFT)

#define PINMUX4_UART1_RXD_ENABLE    (SYSCFG_PINMUX4_PINMUX4_27_24_UART1_RXD << \
                                     SYSCFG_PINMUX4_PINMUX4_27_24_SHIFT)


/* Pin multiplexing masks for UART2 pins. */

#define PINMUX0_UART2_CTS_ENABLE    (SYSCFG_PINMUX0_PINMUX0_31_28_UART2_CTS << \
                                     SYSCFG_PINMUX0_PINMUX0_31_28_SHIFT)

#define PINMUX0_UART2_RTS_ENABLE    (SYSCFG_PINMUX0_PINMUX0_27_24_UART2_RTS << \
                                     SYSCFG_PINMUX0_PINMUX0_27_24_SHIFT)

#define PINMUX4_UART2_TXD_ENABLE    (SYSCFG_PINMUX4_PINMUX4_23_20_UART2_TXD << \
                                     SYSCFG_PINMUX4_PINMUX4_23_20_SHIFT)

#define PINMUX4_UART2_RXD_ENABLE    (SYSCFG_PINMUX4_PINMUX4_19_16_UART2_RXD << \
                                     SYSCFG_PINMUX4_PINMUX4_19_16_SHIFT)


/****************************************************************************
**                        FUNCTION DEFINITION                               
****************************************************************************/

/**
 * \brief   This function selects the UART pins for use. The UART pins
 *          are multiplexed with pins of other peripherals in the 
 *          System on Chip(SoC). 
 *          
 * \param   instanceNum       The instance number of the UART instance to be
 *                            used.
 * \param   modemCtrlChoice   User specifies whether he wants to use modem
 *                            control pins namely UARTn_RTS(Request To Send) 
 *                            and UARTn_ CTS(Clear To Send).\n
 *                            This is:
 *                            TRUE - when modem control lines need to be 
 *                                   selected.
 *                            FALSE - when modem control lines need not be 
 *                                    selected.
 *
 * \return  None.
 *
 * \Note   The second parameter here is required because the UARTn_RTS and
 *         UARTn_CTS lines are multiplexed with pins of other peripherals 
 *         which might also be used.\n
 *
 */

void UARTPinMuxSetup(unsigned int instanceNum, unsigned int modemCtrlChoice)
{
    unsigned int svPinMuxRtsCts = 0;
    unsigned int svPinMuxTxdRxd = 0;

    if(0 == instanceNum)
    {
          if(TRUE == modemCtrlChoice)
          {
               /* 
               ** Clearing the pins in context and retaining the other pin values
               ** of PINMUX3 register. 
               */
               svPinMuxRtsCts = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                                 ~(SYSCFG_PINMUX3_PINMUX3_27_24 | \
                                   SYSCFG_PINMUX3_PINMUX3_31_28));

               /* Actual pin multiplexing for UART0_CTS and UART0_RTS. */
               HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
                    (PINMUX3_UART0_CTS_ENABLE | \
                     PINMUX3_UART0_RTS_ENABLE | \
                     svPinMuxRtsCts);
          }

          /*
          ** Clearing the pins in context and retaining the other pin values
          ** of PINMUX3 register.
          */
          svPinMuxTxdRxd = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & \
                            ~(SYSCFG_PINMUX3_PINMUX3_23_20 | \
                              SYSCFG_PINMUX3_PINMUX3_19_16));
       
          /* Actual pin multiplexing for UART0_TXD and UART0_RXD. */
          HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) = \
               (PINMUX3_UART0_TXD_ENABLE | \
                PINMUX3_UART0_RXD_ENABLE | \
                svPinMuxTxdRxd);
     }

     else if(1 == instanceNum)
     {
          if(TRUE == modemCtrlChoice)
          {
               /*
               ** Clearing the pins in context and retaining the other pin values
               ** of PINMUX0 register.
               */
               svPinMuxRtsCts = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) & \
                                 ~(SYSCFG_PINMUX0_PINMUX0_23_20 | \
                                   SYSCFG_PINMUX0_PINMUX0_19_16));

               /* Actual pin multiplexing for UART1_CTS and UART1_RTS. */
               HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) = \
                    (PINMUX0_UART1_CTS_ENABLE | \
                     PINMUX0_UART1_RTS_ENABLE | \
                     svPinMuxRtsCts);
          }
        
          /*
          ** Clearing the pins in context and retaining the other pin values
          ** of PINMUX4 register.
          */
          svPinMuxTxdRxd = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                           ~(SYSCFG_PINMUX4_PINMUX4_31_28 | \
                             SYSCFG_PINMUX4_PINMUX4_27_24)); 

          /* Actual pin multiplexing for UART1_TXD and UART1_RXD. */
          HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
               (PINMUX4_UART1_TXD_ENABLE | \
                PINMUX4_UART1_RXD_ENABLE | \
                svPinMuxTxdRxd);
    }      
                       
     else if(2 == instanceNum)
     {

          if(TRUE == modemCtrlChoice)
          {
               /*
               ** Clearing the pins in context and retaining the other pin values
               ** of PINMUX0 register.
               */
               svPinMuxRtsCts = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) & \
                                 ~(SYSCFG_PINMUX0_PINMUX0_31_28 | \
                                   SYSCFG_PINMUX0_PINMUX0_27_24));

               /* Actual pin multiplexing for UART2_CTS and UART2_RTS. */
               HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) = \
                    (PINMUX0_UART2_CTS_ENABLE | \
                     PINMUX0_UART2_RTS_ENABLE | \
                     svPinMuxRtsCts);
          }
          
          /*
          ** Clearing the pins in context and retaining the other pin values
          ** of PINMUX4 register.
          */
          svPinMuxTxdRxd = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) & \
                            ~(SYSCFG_PINMUX4_PINMUX4_23_20 | \
                              SYSCFG_PINMUX4_PINMUX4_19_16));

          /* Actual pin multiplexing for UART2_TXD and UART2_RXD. */
          HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(4)) = \
               (PINMUX4_UART2_TXD_ENABLE | \
                PINMUX4_UART2_RXD_ENABLE | \
                svPinMuxTxdRxd);
          
    }

    else
    {

    }

}


/********************************* End of file *******************************/
