/**
 * \file   uartEcho.c
 *
 * \brief  This is a sample application file which invokes some APIs
 *         from the EDMA3 device abstraction layer as well as UART 
 *         device abstraction layer to perform configuration, and 
 *         transfer of data between UART and CPU RAM by the 
 *         use of EDMA3 with cache and mmu being enabled.
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

#include "psc.h"
#include "uart.h"
#include "edma.h"
#include "cp15.h"
#include "string.h"
#include "hw_types.h"
#include "uartStdio.h"
#include "evmAM1808.h"
#include "interrupt.h"
#include "edma_event.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"

/****************************************************************************/
/*                      INTERNAL MACRO DEFINITIONS                          */
/****************************************************************************/
#define UART_RBR_THR_REG           ((0x01D0D000u) + (0u))

#define MAX_ACNT                   1
#define MAX_CCNT                   1

#define TX_BUFFER_SIZE             26

/* EDMA3 Event queue number. */
#define EVT_QUEUE_NUM	           0

/****************************************************************************/
/*                      LOCAL FUNCTION PROTOTYPES                           */
/****************************************************************************/
static void UartTransmitData(unsigned int tccNum, unsigned int chNum,
                             volatile char *buffer, unsigned int buffLength);

/* Callback Function Declaration*/
static void (*cb_Fxn[EDMA3_NUM_TCC]) (unsigned int tcc, unsigned int status);
static void callback(unsigned int tccNum, unsigned int status);
static void ConfigureAINTCIntEDMA3(void);
static void Edma3ComplHandlerIsr(void);
static void Edma3CCErrHandlerIsr(void);
static void EDMA3Initialize(void);
static void SetupAINTCInt(void);

/****************************************************************************/
/*                      GLOBAL VARIABLES                                    */
/****************************************************************************/
/* page tables start must be aligned in 16K boundary */
#ifdef __TMS470__
#pragma DATA_ALIGN(pageTable, 16384);
static volatile unsigned int pageTable[4*1024];
#elif defined(__IAR_SYSTEMS_ICC__)
#pragma data_alignment=16384
static volatile unsigned int pageTable[4*1024];
#else
static volatile unsigned int pageTable[4*1024] __attribute__((aligned(16*1024)));
#endif
volatile char buffer[TX_BUFFER_SIZE];
volatile char dummyVal;
volatile unsigned int flag = 0;

/****************************************************************************/
/*                   LOCAL FUNCTION DEFINITIONS                             */
/****************************************************************************/

/*
** Main function.
*/

int main(void)
{

    unsigned int index;
    char i = 'a';

    /* Sets up 'Level 1" page table entries. 
     * The page table entry consists of the base address of the page
     * and the attributes for the page. The following operation is to
     * setup one-to-one mapping page table for DDR memeory range and set
     * the atributes for the same. The DDR memory range is from 0xC0000000
     * to 0xDFFFFFFF. Thus the base of the page table ranges from 0xC00 to 
     * 0xDFF. Cache(C bit) and Write Buffer(B bit) are enabled  only for
     * those page table entries which maps to DDR RAM and internal RAM.
     * All the pages in the DDR range are provided with R/W permissions
     */
    for(index = 0; index < (4*1024); index++)
    {
         if((index >= 0xC00 && index < 0xE00)|| (index == 0x800))
         {             
              pageTable[index] = (index << 20) | 0x00000C1E;
         }
         else
         {
              pageTable[index] = (index << 20) | 0x00000C12;
         }
    }
     
 
    /* Configures translation table base register
     * with pagetable base address.
     */
    CP15TtbSet((unsigned int )pageTable);

    /* Enables MMU */
    CP15MMUEnable();
   
    /* populate the buffer which is used by DMA for data transfer */
    for(index = 0; index < TX_BUFFER_SIZE ; index++)
    {
         buffer[index] = i++;
    }
 
    /* Enable Instruction Cache */
    CP15ICacheEnable();

    /* Enable Data Cache */
    CP15DCacheEnable();

    /* Initialize EDMA3 Controller */
    EDMA3Initialize();

    /* Initialize UART */
    UARTStdioInit();


    /* Request DMA Channel and TCC for UART Transmit*/
    EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA, 
                        EDMA3_CHA_UART2_TX, EDMA3_CHA_UART2_TX,
                        EVT_QUEUE_NUM);

    /* Registering Callback Function for TX*/
    cb_Fxn[EDMA3_CHA_UART2_TX] = &callback; 

    /* Request DMA Channel and TCC for UART Receive */
    EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA,
                        EDMA3_CHA_UART2_RX, EDMA3_CHA_UART2_RX,
                        EVT_QUEUE_NUM);

    /* Registering Callback Function for RX*/
    cb_Fxn[EDMA3_CHA_UART2_RX] = &callback; 


    /* Transmit Data for Enter Message */
    UartTransmitData(EDMA3_CHA_UART2_TX, EDMA3_CHA_UART2_TX,
                     buffer, TX_BUFFER_SIZE);

    /* Enabling UART in DMA Mode*/
    UARTDMAEnable(SOC_UART_2_REGS, UART_RX_TRIG_LEVEL_1 |  \
                                   UART_DMAMODE |          \
                                   UART_FIFO_MODE );
    /* Wait for return from callback */     
    while(0 == flag);
    flag = 0;

    i = 'A';

    /* ARM9 core uses a read allocate on miss policy.Hence 
     * a dummy read is done here so that cache line
     * is allocated to the "buffer" */
    for(index = 0; index < TX_BUFFER_SIZE; index++)
    {
         dummyVal = buffer[index];
    }

    /* populate the buffer which is used by DMA for data transfer */
    for(index = 0; index < TX_BUFFER_SIZE; index++)
    {
         buffer[index] = i++;
    }

    /* Clean cache to achive coherence between cached memory and main memory */
    #ifdef CACHE_FLUSH
    CP15DCacheCleanBuff((unsigned int)buffer, 27);
    #endif
    
    /* Transmit Data for Entered value */
    UartTransmitData(EDMA3_CHA_UART2_TX, EDMA3_CHA_UART2_TX, 
                     buffer, TX_BUFFER_SIZE);

    /* Enabling UART in DMA Mode*/
    UARTDMAEnable(SOC_UART_2_REGS, UART_RX_TRIG_LEVEL_1 |  \
                                   UART_DMAMODE |           \
                                   UART_FIFO_MODE );
    /* Wait for return from callback */     
    while(0 == flag); 
    flag = 0;

    /* Free EDMA3 Channels for TX and RX */
    EDMA3FreeChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA,
                     EDMA3_CHA_UART2_TX, EDMA3_TRIG_MODE_EVENT, 
                     EDMA3_CHA_UART2_TX, EVT_QUEUE_NUM);

    EDMA3FreeChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA,
                     EDMA3_CHA_UART2_RX, EDMA3_TRIG_MODE_EVENT, 
                     EDMA3_CHA_UART2_RX, EVT_QUEUE_NUM);
    
    while(1);
}

/*
** This function is used to set the PaRAM entries in EDMA3 for the Transmit Channel
** of UART. EDMA3 Enable Transfer is also called within this API.
*/

static void UartTransmitData(unsigned int tccNum, unsigned int chNum,
                             volatile char *buffer, unsigned int buffLength)
{
    EDMA3CCPaRAMEntry paramSet;

    /* Fill the PaRAM Set with transfer specific information */
    paramSet.srcAddr = (unsigned int) buffer;
    paramSet.destAddr = UART_RBR_THR_REG;
    paramSet.aCnt = MAX_ACNT;
    paramSet.bCnt = (unsigned short) buffLength;
    paramSet.cCnt = MAX_CCNT;

    /* The src index should increment for every byte being transferred. */
    paramSet.srcBIdx = (short) 1u;

    /* The dst index should not be increment since it is a h/w register*/
    paramSet.destBIdx = (short) 0u;
  
    /* A sync Transfer Mode */
    paramSet.srcCIdx = (short) 0u;
    paramSet.destCIdx = (short) 0u;
    paramSet.linkAddr = (unsigned short)0xFFFFu;
    paramSet.bCntReload = (unsigned short)0u;
    paramSet.opt = 0x00000000u;
    paramSet.opt |= (EDMA3CC_OPT_DAM );
    paramSet.opt |= ((tccNum << EDMA3CC_OPT_TCC_SHIFT) & EDMA3CC_OPT_TCC);
    paramSet.opt |= (1 << EDMA3CC_OPT_TCINTEN_SHIFT);

    /* Now write the PaRAM Set */
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, chNum, &paramSet);

    /* Enable EDMA Transfer */
    EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, chNum, EDMA3_TRIG_MODE_EVENT);
}

/* Function used to Initialize EDMA3 */
static void EDMA3Initialize(void)
{
    /* Enabling the PSC for EDMA3CC_0.*/ 
    PSCModuleControl(SOC_PSC_0_REGS, 0, 0, PSC_MDCTL_NEXT_ENABLE);

    /* Enabling the PSC for EDMA3TC_0.*/
    PSCModuleControl(SOC_PSC_0_REGS, 1, 0, PSC_MDCTL_NEXT_ENABLE);

    /* Initialization of EDMA3 */    
    EDMA3Init(SOC_EDMA30CC_0_REGS, EVT_QUEUE_NUM);
   
    /*
    ** Enable AINTC to handle interuppts. Also enable IRQ interuppt in 
    ** ARM processor.
    */
    SetupAINTCInt();

    /* Register EDMA3 Interrupts */
    ConfigureAINTCIntEDMA3();
}

/* Function used to Setup ARM Interuppt Controller */
static void SetupAINTCInt(void)
{
    /*Initialize the ARM Interrupt Controller(AINTC). */
    IntAINTCInit();

    /* Enable IRQ in CPSR.*/     
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

/* EDMA3 Completion Handler */
static void edma3ComplHandler(unsigned int baseAdd, unsigned int regionNum)
{
    volatile unsigned int pendingIrqs;
    volatile unsigned int isIPR = 0;

    unsigned int indexl;
    unsigned int Cnt = 0;
    indexl = 1;
    
    IntSystemStatusClear(SYS_INT_CCINT0);
    isIPR = HWREG(baseAdd + EDMA3CC_S_IPR(regionNum));
    if(isIPR)
    {
        while ((Cnt < EDMA3CC_COMPL_HANDLER_RETRY_COUNT)&& (indexl != 0u))
        {
            indexl = 0u;
            pendingIrqs = HWREG(baseAdd + EDMA3CC_S_IPR(regionNum));
            while (pendingIrqs)
            {
                if((pendingIrqs & 1u) == TRUE)
                {
                    /**
                    * If the user has not given any callback function
                    * while requesting the TCC, its TCC specific bit
                    * in the IPR register will NOT be cleared.
                    */
                    /* here write to ICR to clear the corresponding IPR bits */
                    HWREG(baseAdd + EDMA3CC_S_ICR(regionNum)) = (1u << indexl);

                    (*cb_Fxn[indexl])(indexl, EDMA3_XFER_COMPLETE);
                }
                ++indexl;
                pendingIrqs >>= 1u;
            }
            Cnt++;
        }
    }
}

static void Edma3ComplHandlerIsr(void)
{
    /* Invoke Completion Handler ISR */
    edma3ComplHandler(SOC_EDMA30CC_0_REGS, 0);
}

/* EDMA3 Error Handler */
static void edma3CCErrHandler(unsigned int baseAdd)
{
    volatile unsigned int pendingIrqs = 0;
    unsigned int regionNum = 0;
    unsigned int evtqueNum = 0;  
    unsigned int index = 1;
    unsigned int Cnt = 0;
    
    IntSystemStatusClear(SYS_INT_CCERRINT);

    if((HWREG(baseAdd + EDMA3CC_EMR) != 0 ) || \
       (HWREG(baseAdd + EDMA3CC_QEMR) != 0) || \
       (HWREG(baseAdd + EDMA3CC_CCERR) != 0))
    {
        /* Loop for EDMA3CC_ERR_HANDLER_RETRY_COUNT number of time, breaks 
           when no pending interrupt is found */
        while ((Cnt < EDMA3CC_ERR_HANDLER_RETRY_COUNT) && (index != 0u))
        {
            index = 0u;
            pendingIrqs = HWREG(baseAdd + EDMA3CC_EMR);
            while (pendingIrqs)
            {
                /*Process all the pending interrupts*/
                if((pendingIrqs & 1u)==TRUE)
                {
                    /* Write to EMCR to clear the corresponding EMR bits.*/
                    HWREG(baseAdd + EDMA3CC_EMCR) = (1u<<index);
                    /*Clear any SER*/
                    HWREG(baseAdd + EDMA3CC_S_SECR(regionNum)) = (1u<<index);
                }
                ++index;
                pendingIrqs >>= 1u;
            }
            index = 0u;
            pendingIrqs = HWREG(baseAdd + EDMA3CC_QEMR);
            while (pendingIrqs)
            {
                /*Process all the pending interrupts*/
                if((pendingIrqs & 1u)==TRUE)
                {
                    /* Here write to QEMCR to clear the corresponding QEMR bits*/
                    HWREG(baseAdd + EDMA3CC_QEMCR) = (1u<<index);
                    /*Clear any QSER*/
                    HWREG(baseAdd + EDMA3CC_S_QSECR(0)) = (1u<<index);
                }
                ++index;
                pendingIrqs >>= 1u;
            }
            index = 0u;
            pendingIrqs = HWREG(baseAdd + EDMA3CC_CCERR);
    if (pendingIrqs != 0u)
    {
        /* Process all the pending CC error interrupts. */
        /* Queue threshold error for different event queues.*/
        for (evtqueNum = 0u; evtqueNum < EDMA3_0_NUM_EVTQUE; evtqueNum++)
        {
            if((pendingIrqs & (1u << evtqueNum)) != 0u)
            {
                /* Clear the error interrupt. */
                HWREG(baseAdd + EDMA3CC_CCERRCLR) = (1u << evtqueNum);
            }
         }

         /* Transfer completion code error. */
         if ((pendingIrqs & (1 << EDMA3CC_CCERR_TCCERR_SHIFT)) != 0u)
         {
             HWREG(baseAdd + EDMA3CC_CCERRCLR) = \
                  (0x01u << EDMA3CC_CCERR_TCCERR_SHIFT);
         }
         ++index;
    }
    Cnt++;
        }
    }
}

static void Edma3CCErrHandlerIsr()
{
    /* Invoke CC Error Handler ISR */
    edma3CCErrHandler(SOC_EDMA30CC_0_REGS);
}

/* Function to register EDMA3 Interuppts */
static void ConfigureAINTCIntEDMA3(void)
{
    /* Register Interrupts Here */

    IntRegister(SYS_INT_CCINT0, Edma3ComplHandlerIsr);

    IntChannelSet(SYS_INT_CCINT0, 2);

    IntSystemEnable(SYS_INT_CCINT0);

    IntRegister(SYS_INT_CCERRINT, Edma3CCErrHandlerIsr);

    IntChannelSet(SYS_INT_CCERRINT, 2);

    IntSystemEnable(SYS_INT_CCERRINT);
}


/*
** This function is used as a callback from EDMA3 Completion Handler. 
** UART in DMA Mode is Disabled over here.
*/
static void callback(unsigned int tccNum, unsigned int status)
{
    UARTDMADisable(SOC_UART_2_REGS, (UART_RX_TRIG_LEVEL_1 | UART_FIFO_MODE));
    flag = 1;
}

/********************************* End of file ******************************/
