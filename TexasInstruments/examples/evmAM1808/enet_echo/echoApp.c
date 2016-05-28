/**
 * \file  echoServer.c
 *
 * \brief Sample application for ethernet. Demonstrates a sample echo server
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

#include "locator.h"
#include "echod.h"
#include "interrupt.h"
#include "evmAM1808.h"
#include "psc.h"
#include "soc_AM1808.h"
#include "lwiplib.h"
#include "lwipopts.h"
#include "uart.h"
#include "hw_uart.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define LEN_IP_ADDR                    (4u)
#define ASCII_NUM_IDX                  (48u) 

/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void EMACCore0RxIsr(void);
static void EMACCore0TxIsr(void);
static void AintcEMACIntrSetUp(void);
static void IpAddrDisplay(unsigned int ipAddr);
static void ByteDecDisplay(unsigned char byte);
static void UartSetUp(void);
static void UARTCharDisplay(unsigned char ch);

/******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
/*
** The main function
*/
int main(void)
{
    unsigned char macArray[6] = MAC_ADDRESS;
    unsigned int ipAddr;

    /* Set up the UART2 peripheral */
    UartSetUp();

    /* Set up the pin multiplex for EMAC and MDIO and enable PSC */
    EMACPinMuxSetup();
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_EMAC, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    AintcEMACIntrSetUp();

    /* Initialze the lwIP library, using DHCP.*/
#if STATIC_IP_ADDRESS 

    ipAddr = lwIPInit(0, macArray, STATIC_IP_ADDRESS, 0, 0, IPADDR_USE_STATIC);

#else

    ipAddr = lwIPInit(0, macArray, 0, 0, 0, IPADDR_USE_DHCP);

#endif
   
    IpAddrDisplay(ipAddr);

    LocatorConfig(macArray, "evmAM1808 enet_lwip");

    /* Initialize the sample echo server. */
    echo_init();
    
    /* Loop forever.  All the work is done in interrupt handlers. */
    while(1)
    {
        ; /* Perform nothing */
    }
}

/*
** Interrupt Handler for Core 0 Receive interrupt
*/
static void EMACCore0RxIsr(void)
{
    IntSystemStatusClear(SYS_INT_C0_RX);
    lwIPRxIntHandler(0);
}

/*
** Interrupt Handler for Core 0 Transmit interrupt
*/
static void EMACCore0TxIsr(void)
{
    IntSystemStatusClear(SYS_INT_C0_TX);
    lwIPTxIntHandler(0);
}

/*
** Displays the IP addrss on the UART Console
*/
static void IpAddrDisplay(unsigned int ipAddr) 
{
    unsigned char msg[] = " EVM AM1808 IP Address Assigned : "; 
    unsigned char byte;
    int cnt;
 
    cnt = sizeof(msg);
    while(cnt--)
    {
        UARTCharDisplay(msg[sizeof(msg) - cnt]);
    }
  
    for(cnt = 0; cnt <= LEN_IP_ADDR - 1; cnt++) 
    {
        byte = (ipAddr >> (cnt * 8)) & 0xFF; 

        if(cnt)
        {        
            UARTCharDisplay('.');
        }
    
        ByteDecDisplay(byte);
    }

    UARTCharDisplay('\r');
    UARTCharDisplay('\n');
}

/*
** Displays a byte in decimal format 
*/
static void ByteDecDisplay(unsigned char byte) 
{
    unsigned char digitHi;
    unsigned char digitLo;

    digitHi = byte / 100; 
    if(digitHi) 
    {
        UARTCharDisplay(digitHi + ASCII_NUM_IDX);
        byte -= (100 * digitHi);
    }
  
    digitLo = byte / 10;
    if(digitLo)
    {
        byte -= (10 * digitLo);
    }
    
    if(digitHi || digitLo) 
    {
      UARTCharDisplay(digitLo + ASCII_NUM_IDX);
    }

    UARTCharDisplay(byte + ASCII_NUM_IDX);    
}

/*
** Set up the ARM Interrupt Controller for generating timer interrupt
*/
static void AintcEMACIntrSetUp(void)
{
    IntAINTCInit();
    
    /* Register the Receive ISR for Core 0 */
    IntRegister(SYS_INT_C0_RX, EMACCore0RxIsr);
  
    /* Register the Transmit ISR for Core 0 */
    IntRegister(SYS_INT_C0_TX, EMACCore0TxIsr);
    
    IntChannelSet(SYS_INT_C0_RX, 2);
    IntChannelSet(SYS_INT_C0_TX, 3);

    /* Enable IRQ for ARM (in CPSR)*/
    IntMasterIRQEnable();
  
    /* Enable AINTC interrupts in GER */
    IntGlobalEnable();

    /* Enable IRQ in AINTC */
    IntIRQEnable();

    IntSystemEnable(SYS_INT_C0_RX);
    IntSystemEnable(SYS_INT_C0_TX);
}

/*
** Set up the UART2 peripheral.
*/
static void UartSetUp(void)
{
    UARTPinMuxSetup(2, FALSE);

    UARTEnable(SOC_UART_2_REGS);

    UARTConfigSetExpClk(SOC_UART_2_REGS, SOC_UART_2_MODULE_FREQ,
                        BAUD_115200, UART_WORDL_8BITS,
                        UART_OVER_SAMP_RATE_16);

    /* Enabling the FIFO and flushing the Tx and Rx FIFOs.*/
    UARTFIFOEnable (SOC_UART_2_REGS);
    UARTFIFOLevelSet (SOC_UART_2_REGS, UART_RX_TRIG_LEVEL_1);
}

/*
** Displays a Character
*/
static void UARTCharDisplay(unsigned char ch) 
{
    UARTCharPutNonBlocking(SOC_UART_2_REGS, ch);

    while(!UARTSpaceAvail(SOC_UART_2_REGS));
}

/***************************** End Of File ***********************************/
