/**
 * \file  uartConsole.c
 *
 * \brief This file contains functions which interface interactively
 *        with the user through the serial console to perform some
 *        utility operations.
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

/* Driver APIs */
#include "uart.h"
#include "psc.h"

/* EVM AM1808 APIs */
#include "evmAM1808.h"

/* ARM System Defines */
#include "soc_AM1808.h"
#include "hw_syscfg0_AM1808.h"

/******************************************************************************
**              INTERNAL MACRO DEFINITIONS
******************************************************************************/
#define UART_STDIO_INSTANCE             (2)
#define UART_CONSOLE_BASE               (SOC_UART_2_REGS)

/******************************************************************************
**              INTERNAL FUNCTION PROTOTYPES
******************************************************************************/
static void UARTStdioInitExpClk(unsigned int baudRate,
                                unsigned int rxTrigLevel);
void UARTConsolePutc(unsigned char data);
unsigned char UARTConsoleGetc(void);
void UARTConsoleInit(void);

/******************************************************************************
**              INTERNAL FUNCTION DEFINITIONS
******************************************************************************/

/**
 *  \brief   This function initializes the specified UART instance for use.
 *           This does the following:
 *           1> Sets the baud rate of communication. \n
 *           2> Configures the line characteristics. Specifically, this:
 *              a> sets the Word Length in each character frame as 8 bits.
 *              b> selects No parity option.
 *              c> selects one stop bit in each frame.
 *            
 *           3> Enables the FIFO mode for transmitter and receiver.
 *           4> Sets the Receiver FIFO Trigger Level.
 *
 *  \param   baudRate     The baud rate to be used for communication.
 *  \param   rxTrigLevel  The receiver trigger level. This can take one of the 
 *                        following four values:
 *                        1> UART_RX_TRIG_LEVEL_1
 *                        2> UART_RX_TRIG_LEVEL_4
 *                        3> UART_RX_TRIG_LEVEL_8
 *                        4> UART_RX_TRIG_LEVEL_14
 *
 *
 *  \return  None.
 */
static void UARTStdioInitExpClk(unsigned int baudRate, unsigned int rxTrigLevel)
{
 
     /* Enables the transmitter and receiver*/
     UARTEnable(UART_CONSOLE_BASE);

     /* Configuring the UART parameters*/
     /* 8-bit work length, no parity, 1 stop bit. */
     /* The UART module input frequency shall be 150MHz.*/
     UARTConfigSetExpClk(UART_CONSOLE_BASE, 
                         SOC_UART_2_MODULE_FREQ,
                         baudRate, 
                         UART_WORDL_8BITS,
                         UART_OVER_SAMP_RATE_16);


     /* Enables FIFO mode for transmitter and receiver.*/
     UARTFIFOEnable(UART_CONSOLE_BASE);

     /* Sets the receiver FIFO Trigger level.*/
     UARTFIFOLevelSet(UART_CONSOLE_BASE, rxTrigLevel);

}

/**
 * \brief   This function initializes the specified UART instance for use.
 *          This does the following:
 *          1> Sets the baud rate of communication as 115200.
 *          2> Configures the line characteristics to a typical value being
 *              8-N-1 which means 8 data bits per frame, No parity bit and 
 *              1 stop bit/frame.
 *          3> Enables the FIFO for transmitter and receiver.
 *          4> Sets the receiver trigger level to be 1 byte.
 *
 * \return  None.
 *
 * \note    This function invokes UARTStdioInitExpClk() to perform the above
 *          configurations. The function UARTStdioInitExpClk() could be
 *          directly invoked for more customized configurations.
 */
void UARTConsoleInit(void)
{
     #if (0 == UART_STDIO_INSTANCE)
     {
          PSCModuleControl(SOC_PSC_0_REGS,9, 0, PSC_MDCTL_NEXT_ENABLE);
          UARTPinMuxSetup(0, FALSE);
     }
     
     #elif (1 == UART_STDIO_INSTANCE)
     {
          PSCModuleControl(SOC_PSC_1_REGS,12, 0, PSC_MDCTL_NEXT_ENABLE);
          UARTPinMuxSetup(1, FALSE);
     }

     #else 
     {
          PSCModuleControl(SOC_PSC_1_REGS,13, 0, PSC_MDCTL_NEXT_ENABLE);
          UARTPinMuxSetup(2, FALSE);
     }
     #endif
     
     UARTStdioInitExpClk(BAUD_115200, UART_RX_TRIG_LEVEL_1);
}

/**
 * \brief   This function puts a character on the serial console.
 *
 * \param   data    The character to be put on the serial console
 *
 * \return  None.
 */
void UARTConsolePutc(unsigned char data)
{
     UARTCharPut(UART_CONSOLE_BASE, data);
}

/**
 * \brief   This function puts a character on the serial console.
 *
 * \param   none
 *
 * \return  Character as input from the console
 */
unsigned char UARTConsoleGetc(void)
{
    return ((unsigned char)UARTCharGet(UART_CONSOLE_BASE));
}

/********************************* End Of File ******************************/
