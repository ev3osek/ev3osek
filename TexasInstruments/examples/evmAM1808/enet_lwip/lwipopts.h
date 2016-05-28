/**
 * \file lwipopts.h
 *
 * \brief Configuration options for lwIP
 */

/* Copyright (c) 2010 Texas Instruments Incorporated */

/*
 * Copyright (c) 2001-2004 Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 *
 * Author: Adam Dunkels <adam@sics.se>
 *
 */

#ifndef __LWIPOPTS_H__
#define __LWIPOPTS_H__

/*****************************************************************************
**                           CONFIGURATIONS
*****************************************************************************/
/*
** Give the MAC Address on the EVM here.
*/
#define MAC_ADDRESS                     {0x00, 0x08, 0xEE, 0x03, 0x6A, 0xC6}

/*
** If Static IP address to be used, give it here. This value shall be 0 if 
** dynamic IP address is to be used.
** For Example, for IP Address 192.168.247.1, use the corresponding hex
** value 0xC0A8F701.
*/
#define STATIC_IP_ADDRESS               0

/*****************************************************************************
**            lwIP SPECIFIC DEFINITIONS - To be used by lwIP stack
*****************************************************************************/
#define HOST_TMR_INTERVAL               0         
#define DYNAMIC_HTTP_HEADERS

/*****************************************************************************
**                    Platform specific locking 
*****************************************************************************/
#define SYS_LIGHTWEIGHT_PROT            1          
#define NO_SYS                          1          

/*****************************************************************************
**                          Memory Options
*****************************************************************************/
#define MEM_ALIGNMENT                   4         
#define MEM_SIZE                        (30 * 1024) /* 30K */
#define MEMP_NUM_PBUF                   48     
#define MEMP_NUM_TCP_PCB                16    
#define PBUF_POOL_SIZE                  96    

/*****************************************************************************
**                           IP Options
*****************************************************************************/
#define IP_REASSEMBLY                   0          
#define IP_FRAG                         0          

/*****************************************************************************
**                           DHCP Options
*****************************************************************************/
#define LWIP_DHCP                       1
#define DHCP_DOES_ARP_CHECK             0

/*****************************************************************************
**                           Auto IP  Options
*****************************************************************************/
#define LWIP_AUTOIP                     0           /* default is 0 */
#define LWIP_DHCP_AUTOIP_COOP           ((LWIP_DHCP) && (LWIP_AUTOIP))
                                                    /* default is 0 */
#define LWIP_DHCP_AUTOIP_COOP_TRIES     5           /* default is 9 */

/*****************************************************************************
**                           TCP  Options
*****************************************************************************/
#define TCP_WND                         4096   /* default is 2048 */
#define TCP_MSS                         1500        /* default is 128 */
#define TCP_SND_BUF                     (4 * TCP_MSS)

/*****************************************************************************
**                           PBUF  Options
*****************************************************************************/
#define PBUF_LINK_HLEN                  14      /* default is 14 */
#define PBUF_POOL_BUFSIZE               256
                                           /* default is LWIP_MEM_ALIGN_SIZE(TCP_MSS+40+PBUF_LINK_HLEN)*/
#define ETH_PAD_SIZE                    0           
#define LWIP_NETCONN                    0          /*default is 1*/ 

/*****************************************************************************
**                           Socket  Options
*****************************************************************************/
#define LWIP_SOCKET                     0           /* default is 1 */

/*****************************************************************************
**                          Debugging options
*****************************************************************************/
#define LWIP_DBG_MIN_LEVEL              LWIP_DBG_LEVEL_OFF
#define LWIP_DBG_TYPES_ON               (LWIP_DBG_ON | LWIP_DBG_TRACE \
                                         |LWIP_DBG_STATE | LWIP_DBG_FRESH)

#endif /* __LWIPOPTS_H__ */
