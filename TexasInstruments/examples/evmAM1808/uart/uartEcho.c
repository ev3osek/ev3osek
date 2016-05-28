/**
 * \file uartEcho.c
 *
 * \brief  This is a sample application file which invokes some APIs
 *         from the UART device abstraction library to perform configuration,
 *         transmission and reception operations.
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

#include "hw_psc_AM1808.h"
#include "soc_AM1808.h"
#include "interrupt.h"
#include "evmAM1808.h"
#include "hw_types.h"
#include "uart.h"
#include "psc.h"

/****************************************************************************/
/*                      LOCAL FUNCTION PROTOTYPES                           */
/****************************************************************************/
static void ConfigureAINTCIntUART(void);
static void SetupAINTCInt(void);
static void UARTIsr(void);

/****************************************************************************/
/*                      GLOBAL VARIABLES                                    */
/****************************************************************************/
char txArray[] = "StarterWare AM1808 UART echo application.\n\r";

/****************************************************************************/
/*                      LOCAL FUNCTION DEFINITIONS                          */
/****************************************************************************/

int main(void)
{
    unsigned int intFlags = 0;
    unsigned int config = 0;

    /* Enabling the PSC for UART2.*/
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_UART2, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    /* Setup PINMUX */
    UARTPinMuxSetup(2, FALSE);
    
    /* Enabling the transmitter and receiver*/
    UARTEnable(SOC_UART_2_REGS);

    /* 1 stopbit, 8-bit character, no parity */
    config = UART_WORDL_8BITS;

    /* Configuring the UART parameters*/
    UARTConfigSetExpClk(SOC_UART_2_REGS, SOC_UART_2_MODULE_FREQ,
                        BAUD_115200, config,
                        UART_OVER_SAMP_RATE_16);

    /* Enabling the FIFO and flushing the Tx and Rx FIFOs.*/
    UARTFIFOEnable(SOC_UART_2_REGS);

    /* Setting the UART Receiver Trigger Level*/
    UARTFIFOLevelSet(SOC_UART_2_REGS, UART_RX_TRIG_LEVEL_1);
    
    /*
    ** Enable AINTC to handle interrupts. Also enable IRQ interrupt in ARM 
    ** processor.
    */
    SetupAINTCInt();

    /* Configure AINTC to receive and handle UART interrupts. */
    ConfigureAINTCIntUART();

    /* Preparing the 'intFlags' variable to be passed as an argument.*/
    intFlags |= (UART_INT_LINE_STAT  |  \
                 UART_INT_TX_EMPTY |    \
                 UART_INT_RXDATA_CTI);

    /* Enable the Interrupts in UART.*/
    UARTIntEnable(SOC_UART_2_REGS, intFlags);

    while(1);

}

/*
** \brief   Interrupt Service Routine(ISR) to be executed on UART interrupts.
**          Depending on the source of interrupt, this 
**          1> writes to the serial communication console, or 
**          2> reads from the serial communication console, or 
**          3> reads the byte in RBR if receiver line error has occured.
*/

static void UARTIsr()
{
    static unsigned int length = sizeof(txArray);
    static unsigned int count = 0;
    unsigned char rxData = 0;
    unsigned int int_id = 0;

    /* This determines the cause of UART2 interrupt.*/
    int_id = UARTIntStatus(SOC_UART_2_REGS);

    /* Clears the system interupt status of UART2 in AINTC. */
    IntSystemStatusClear(SYS_INT_UARTINT2);
  
    /* Checked if the cause is transmitter empty condition.*/
    if(UART_INTID_TX_EMPTY == int_id)
    {
        if(0 < length)
        {
            /* Write a byte into the THR if THR is free. */
            UARTCharPutNonBlocking(SOC_UART_2_REGS, txArray[count]);
            length--;
            count++;
        }
        if(0 == length)
        {
            /* Disable the Transmitter interrupt in UART.*/
            UARTIntDisable(SOC_UART_2_REGS, UART_INT_TX_EMPTY);
        }
     }

    /* Check if the cause is receiver data condition.*/
    if(UART_INTID_RX_DATA == int_id)
    {
        rxData = UARTCharGetNonBlocking(SOC_UART_2_REGS);
        UARTCharPutNonBlocking(SOC_UART_2_REGS, rxData);
    }


    /* Check if the cause is receiver line error condition.*/
    if(UART_INTID_RX_LINE_STAT == int_id)
    {
        while(UARTRxErrorGet(SOC_UART_2_REGS))
        {
            /* Read a byte from the RBR if RBR has data.*/
            UARTCharGetNonBlocking(SOC_UART_2_REGS);
        }
    }

    return;
}

/*
** \brief   This function invokes necessary functions to configure the ARM
**          processor and ARM Interrupt Controller(AINTC) to receive and
**          handle interrupts.
*/


static void SetupAINTCInt(void)
{
    /* Initialize the ARM Interrupt Controller(AINTC). */
    IntAINTCInit();

    /* Enable IRQ in CPSR.*/     
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();

}

/*
** \brief  This function confiugres the AINTC to receive UART interrupts.
*/ 
static void ConfigureAINTCIntUART(void)
{
    /* Registers the UARTIsr in the Interrupt Vector Table of AINTC. */
    IntRegister(SYS_INT_UARTINT2, UARTIsr);

    /* Map the channel number 2 of AINTC to UART2 system interrupt. */
    IntChannelSet(SYS_INT_UARTINT2, 2);

    IntSystemEnable(SYS_INT_UARTINT2);
}

/****************************END OF FILE*************************************/
