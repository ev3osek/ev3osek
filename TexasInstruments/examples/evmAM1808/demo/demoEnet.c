/**
 * \file    demoEnet.c
 *
 * \brief   This file contains Ethernet related functions.
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

#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "interrupt.h"
#include "demoEnet.h"
#include "demoCfg.h"
#include "lwiplib.h"
#include "httpd.h"
#include "demoMain.h"
#include "lwipopts.h"
#include "uartStdio.h"

#include <string.h>

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define LEN_IP_ADDR                          (4u)
#define ASCII_NUM_IDX                        (48u)
#define NUM_CONFIG_CGI_URIS                  (1)

/******************************************************************************
**                     INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void EMACCore0RxIsr(void);
static void EMACCore0TxIsr(void);
static char* ControlCGIHandler(char *params);

/*******************************************************************************
**                     INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
static const tCGI g_psConfigCGIURIs[] =
{
    { "/io_control.cgi", ControlCGIHandler }      
};

unsigned int ipAddr;

/*******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
/* 
** Registers ethernet ISRs
*/
#ifdef _TMS320C6X
void EnetIntRegister(unsigned int RXcpuINT, unsigned int TXcpuINT)
{
    /* Register the Receive ISR for Core 0 */
    IntRegister(RXcpuINT, EMACCore0RxIsr);

    /* Register the Transmit ISR for Core 0 */
    IntRegister(TXcpuINT, EMACCore0TxIsr);

    IntEventMap(RXcpuINT, SYS_INT_EMAC_C0RX);
    IntEventMap(TXcpuINT, SYS_INT_EMAC_C0TX);
}
#else
void EnetIntRegister(unsigned int channel)
{
    /* Register the Receive ISR for Core 0 */
    IntRegister(SYS_INT_C0_RX, EMACCore0RxIsr);

    /* Register the Transmit ISR for Core 0 */
    IntRegister(SYS_INT_C0_TX, EMACCore0TxIsr);

    IntChannelSet(SYS_INT_C0_RX, channel);
    IntChannelSet(SYS_INT_C0_TX, channel);
}
#endif

unsigned int EnetIfIsUp(void)
{
   return (lwIPNetIfStatusGet(0));
}

unsigned int EnetLinkIsUp(void)
{

   return (lwIPLinkStatusGet(0));
}

/*
** initializes the httpserver and prints the IP address on the UART console
*/
void EnetHttpServerInit(void)
{
    unsigned char macArray[6] = MAC_ADDRESS;

    UARTPuts("\n\rAcquiring IP Address...\n\r", -1);
        
    /* Initialze the lwIP library, using DHCP.*/
#if STATIC_IP_ADDRESS

    ipAddr = lwIPInit(0, macArray, STATIC_IP_ADDRESS, 0, 0, IPADDR_USE_STATIC);

#else

    ipAddr = lwIPInit(0, macArray, 0, 0, 0, IPADDR_USE_DHCP);

#endif


    if(0 == ipAddr)
    {
        UARTPuts("\n\rIP Address not assigned. Check connection/DHCP.\n\r",
                 -1);
        return;
    }
    
    UARTPuts("\n\rEVM AM1808 IP Address Assigned: ", -1);

    IpAddrDisplay();

    http_set_cgi_handlers(g_psConfigCGIURIs, NUM_CONFIG_CGI_URIS);

    /* Initialize the sample httpd server. */
    httpd_init();
}



/*
** CGI handler 
*/
char* ControlCGIHandler(char *params)
{
    if(!(strcmp(params,"I2C")))
    {
        clickIdx = CLICK_IDX_LED;    
    }

    else if(!(strcmp(params,"TIMER")))
    {
        clickIdx = CLICK_IDX_TIMER;    
    }

    else if(!(strcmp(params,"GPIO")))
    {
        clickIdx = CLICK_IDX_GPIO;    
    }

    else if(!(strcmp(params,"RTC")))
    {
        clickIdx = CLICK_IDX_RTC;    
    }

    else if(!(strcmp(params,"SPI")))
    {
        clickIdx = CLICK_IDX_SPI;    
    }

    else if(!(strcmp(params,"McASP")))
    {
        clickIdx = CLICK_IDX_MCASP;    
    }

    else
    {
        clickIdx = 0;
    }
 
    return "/io_cgi.ssi";
}


/*
** Displays the IP addrss on the UART Console
*/
void IpAddrDisplay(void)
{
    unsigned char byte;
    int cnt;

    for(cnt = 0; cnt <= LEN_IP_ADDR - 1; cnt++)
    {
        byte = (ipAddr >> (cnt * 8)) & 0xFF;

        if(cnt)
        {
            UARTPuts(".", -1);
        }

        UARTPutNum((int)byte);
    }

    UARTPuts("\r\n" , -1);
}

/*
** Interrupt Handler for Core 0 Receive interrupt
*/
static void EMACCore0RxIsr(void)
{
#ifdef _TMS320C6X
	IntEventClear(SYS_INT_EMAC_C0RX);
#else
    IntSystemStatusClear(SYS_INT_C0_RX);
#endif
    lwIPRxIntHandler(0);
}

/*
** Interrupt Handler for Core 0 Transmit interrupt
*/
static void EMACCore0TxIsr(void)
{
#ifdef _TMS320C6X
	IntEventClear(SYS_INT_EMAC_C0TX);
#else
    IntSystemStatusClear(SYS_INT_C0_TX);
#endif
    lwIPTxIntHandler(0);
}

/****************************** End of file **********************************/



