/**
 * \file   edmaTest.c
 *
 * \brief  This is a sample application file which invokes some APIs
 *         from the EDMA device abstraction layer to perform configuration,
 *         transmission and reception operations.
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
#include "uartStdio.h"
#include "evmAM1808.h"
#include "hw_types.h"
#include "edma.h"
#include "psc.h"

/****************************************************************************/
/*                      LOCAL FUNCTION PROTOTYPES.                          */
/****************************************************************************/
static void registerEdma3Interrupts(void);
static void SetupAINTCInt(void);
static void edma3CCComplIsr(void);
static void edma3CCErrIsr(void);

/* Callback Function                                                        */
void (*cb_Fxn[EDMA3_NUM_TCC])(unsigned int tcc, 
                               unsigned int status, void *appData);

/****************************************************************************/
/*                      GLOBAL VARIABLES                                    */
/****************************************************************************/

/* MAX ACOUNT */
#define MAX_ACOUNT        (512u)

/* MAX BCOUNT */
#define MAX_BCOUNT        (5u)

/* MAX CCOUNT */
#define MAX_CCOUNT        (1u)

#define MAX_BUFFER_SIZE     (MAX_ACOUNT * MAX_BCOUNT * MAX_CCOUNT)

volatile int irqRaised;

/* Callback function */
void callback(unsigned int tccNum, unsigned int status, void *appData)
{
    (void)tccNum;
    (void)appData;
    
    if(EDMA3_XFER_COMPLETE == status)
    {
            /* Transfer completed successfully */
            irqRaised = 1;
    }
    
    else if(EDMA3_CC_DMA_EVT_MISS == status)
    {
            /* Transfer resulted in DMA event miss error. */
            irqRaised = -1;
    }
     
    else if(EDMA3_CC_QDMA_EVT_MISS == status)
    {
            /* Transfer resulted in QDMA event miss error. */
            irqRaised = -2;
    }
}

/* Comment this if testing QDMA Application */
#define CHTYPE_DMA

/* DATA PARAMETERS PROVIDED BY APPLICATION */
#ifdef CHTYPE_DMA
    unsigned int chType     = EDMA3_CHANNEL_TYPE_DMA;
    unsigned int chNum      = 0;
    unsigned int tccNum     = 0;
    unsigned int edmaTC     = 0;
    unsigned int syncType     = EDMA3_SYNC_A;
    unsigned int trigMode     = EDMA3_TRIG_MODE_MANUAL;
    unsigned int evtQ           = 0;/* Event Queue used                     */ 
#else
    unsigned int chType     = EDMA3_CHANNEL_TYPE_QDMA;
    unsigned int chNum      = 0;
    unsigned int tccNum     = 0;
    unsigned int edmaTC     = 0;
    unsigned int syncType     = EDMA3_SYNC_A;
    unsigned int trigMode     = EDMA3_TRIG_MODE_QDMA;
    unsigned int paRAMId        = 32u;
    unsigned int evtQ           = 0;/* Event Queue used                     */
    unsigned int opt            = 0;
#endif
/****************************************************************************/
/*                      LOCAL FUNCTION DEFINITIONS                          */
/****************************************************************************/

volatile char   _srcBuff[MAX_BUFFER_SIZE];
volatile char   _dstBuff[MAX_BUFFER_SIZE];

volatile char *srcBuff;
volatile char *dstBuff;

#ifdef CHTYPE_DMA
unsigned int edma3Test();
#else
unsigned int Qdma3Test();
#endif

int main(void)
{
    volatile unsigned int status = FALSE;

    /* Enabling the PSC for EDMA3CC_0.*/
    PSCModuleControl(SOC_PSC_0_REGS, 0, 0, PSC_MDCTL_NEXT_ENABLE);

    /* Enabling the PSC for EDMA3TC_0.*/
    PSCModuleControl(SOC_PSC_0_REGS, 1, 0, PSC_MDCTL_NEXT_ENABLE);

    /* Configuring UART2 instance for serial communication. */
    UARTStdioInit();

    /*
    ** Enable AINTC to handle interrupts. Also enable IRQ interrupt in ARM 
    ** processor.
    */
    SetupAINTCInt();

    UARTPuts("Welcome to EDMA/QDMA example application.\r\n\r\n", -1);

    EDMA3Init(SOC_EDMA30CC_0_REGS, evtQ);

    registerEdma3Interrupts();
#ifdef CHTYPE_DMA
    status = edma3Test();
#else
    status = Qdma3Test();
#endif

    EDMA3Deinit(SOC_EDMA30CC_0_REGS, evtQ);

    if (TRUE == status)
    {
        UARTPuts("\r\nEDMA/QDMA application is successfully completed.\r\n", -1);
    }
    else
    {
        UARTPuts("\r\nEDMA/QDMA application is unsuccessful.\r\n", -1);
    }

    while(1);
}


#ifdef CHTYPE_DMA

unsigned int edma3Test()
{
    volatile unsigned int index = 0;
    volatile unsigned int count = 0;
    EDMA3CCPaRAMEntry paramSet;
    unsigned char data = 0u;
    unsigned int retVal = 0u;
    unsigned int Istestpassed = 0u;
    unsigned int numenabled = 0u;
    unsigned int acnt = MAX_ACOUNT;
    unsigned int bcnt = MAX_BCOUNT;
    unsigned int ccnt = MAX_CCOUNT;

    srcBuff = (char *)_srcBuff;
    dstBuff = (char *)_dstBuff;

    /* Initalize source and destination buffers */
    for (count = 0u; count < (acnt*bcnt*ccnt); count++)
    {
    srcBuff[count] = data++;
    /*
     * No need to initialize the destination buffer as it is 
         * being invalidated.
     */
    }

    /* Request DMA channel and TCC */
    retVal = EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, chType, 
                                                      chNum, tccNum, evtQ);

    /* ************* REGISTER THE CALL BACK FUNCTION HERE ***************** */
    cb_Fxn[tccNum] = &callback; /* Registering Callback Function    */

    if (TRUE == retVal)
    {
        /* Fill the PaRAM Set with transfer specific information */
        paramSet.srcAddr    = (unsigned int)(srcBuff);
        paramSet.destAddr   = (unsigned int)(dstBuff);
    
            paramSet.aCnt = (unsigned short)acnt;
        paramSet.bCnt = (unsigned short)bcnt;
        paramSet.cCnt = (unsigned short)ccnt;
        /* Setting up the SRC/DES Index */
        paramSet.srcBIdx = (short)acnt;
        paramSet.destBIdx = (short)acnt;
        if (syncType == EDMA3_SYNC_A)
        {
            /* A Sync Transfer Mode */
        paramSet.srcCIdx = (short)acnt;
        paramSet.destCIdx = (short)acnt;
        }
        else
        {
        /* AB Sync Transfer Mode */
        paramSet.srcCIdx = ((short)acnt * (short)bcnt);
            paramSet.destCIdx = ((short)acnt * (short)bcnt);
        }
        paramSet.linkAddr = (unsigned short)0xFFFFu;
        paramSet.bCntReload = (unsigned short)0u;
            paramSet.opt = 0u;
        /* Src & Dest are in INCR modes */
        paramSet.opt &= 0xFFFFFFFCu;
        /* Program the TCC */
        paramSet.opt |= ((tccNum << EDMA3CC_OPT_TCC_SHIFT) & EDMA3CC_OPT_TCC);

        /* Enable Intermediate & Final transfer completion interrupt */
        paramSet.opt |= (1 << EDMA3CC_OPT_ITCINTEN_SHIFT);
        paramSet.opt |= (1 << EDMA3CC_OPT_TCINTEN_SHIFT);

        if (syncType == EDMA3_SYNC_A)
            {
            paramSet.opt &= 0xFFFFFFFBu;
            }
        else
            {
               /* AB Sync Transfer Mode */
            paramSet.opt |= (1 << EDMA3CC_OPT_SYNCDIM_SHIFT);
            }

        /* Now, write the PaRAM Set. */
        EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, chNum, &paramSet);
    }

    /*
     * Since the transfer is going to happen in Manual mode of EDMA3
     * operation, we have to 'Enable the Transfer' multiple times.
     * Number of times depends upon the Mode (A/AB Sync)
     * and the different counts.
     */
    if (TRUE == retVal)
    {
        /*Need to activate next param*/
        if (syncType == EDMA3_SYNC_A)
            {
            numenabled = bcnt * ccnt;
            }
        else
            {
            /* AB Sync Transfer Mode */
            numenabled = ccnt;
            }
    
        for (index = 0; index < numenabled; index++)
            {
            irqRaised = 0;
    
            /*
             * Now enable the transfer as many times as calculated above.
             */
            retVal = EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, chNum, 
                                                     EDMA3_TRIG_MODE_MANUAL);
            if (TRUE != retVal)
                {
                    UARTPuts ("edma3Test: EDMA3EnableTransfer Failed.\r\n", -1); 
                    break;
                }
    
            /* Wait for the Completion ISR. */
            while (irqRaised == 0u)
                {
                    /** Wait for the Completion ISR on Master Channel.
                     * You can insert your code here to do something
                     * meaningful. 
                    */
                }
    
            /* Check the status of the completed transfer */
            if (irqRaised < 0)
                {
                    /* Some error occured, break from the FOR loop. */
                    UARTPuts("\r\nedma3Test: Event Miss Occured!!!\r\n", -1);

                    /* Clear the error bits first */
                    EDMA3ClearErrorBits(SOC_EDMA30CC_0_REGS, chNum, evtQ);
                    break;
                }
            }   
    }

    /* Match the Source and Destination Buffers. */
    if (TRUE == retVal)
    {
        for (index = 0; index < (acnt*bcnt*ccnt); index++)
            {
            if (srcBuff[index] != dstBuff[index])
            {
                Istestpassed = 0u;
                UARTPuts("edma3Test: Data write-read matching FAILED.\r\n", -1);
                    UARTPuts("The mismatch happened at index : ", -1);
                    UARTPutNum((int)index + 1);
                UARTPuts("\r\n", -1);
                    break;
            }
            }
        if (index == (acnt*bcnt*ccnt))
            {
            Istestpassed = 1u;
                UARTPuts("edma3Test: Data write-read matching PASSED.\r\n", -1);
            }
    
    
        /* Free the previously allocated channel. */
        retVal = EDMA3FreeChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA, 
                        chNum, EDMA3_TRIG_MODE_MANUAL, tccNum, 
                              evtQ);
        
            cb_Fxn[tccNum] = NULL; /* Unregister Callback Function */

        if (TRUE != retVal)
            {
            UARTPuts("edma3Test: EDMA3_DRV_freeChannel() FAILED.\r\n", -1); 
            }
    }

    if(Istestpassed == 1u)
    {
        UARTPuts("edma3Test PASSED.\r\n", -1);
        retVal = TRUE;
    }
    else
    {
        UARTPuts("edma3Test FAILED\r\n", -1);
        retVal = FALSE;
    }

    return retVal;
}

#else
/* *********************************** QDMA APPLICATION ********************* */

unsigned int Qdma3Test()
{
    volatile unsigned int index = 0u;
    volatile unsigned int count = 0u;
    EDMA3CCPaRAMEntry paramSet;
    unsigned char data = 0u;
    unsigned int retVal = 0u;
    unsigned int Istestpassed = 0u;
    unsigned int numenabled = 0u;
    unsigned int acnt = MAX_ACOUNT;
    unsigned int bcnt = MAX_BCOUNT;
    unsigned int ccnt = MAX_CCOUNT;
    unsigned int dstBuffAddr = 0;

    srcBuff = (char *)_srcBuff;
    dstBuff = (char *)_dstBuff;

    /* Initalize source and destination buffers */
    for (count = 0u; count < (acnt*bcnt*ccnt); count++)
    {
    srcBuff[count] = data++;
    /*
     * No need to initialize the destination buffer as it is being invalidated.
     */
    }

    /* Request DMA channel and TCC */
    retVal = EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, chType, chNum, tccNum, evtQ);

    EDMA3MapQdmaChToPaRAM(SOC_EDMA30CC_0_REGS, chNum, &paRAMId);
    
    EDMA3SetQdmaTrigWord(SOC_EDMA30CC_0_REGS, chNum, EDMA3CC_PARAM_ENTRY_DST);
    
    /* ************* REGISTER THE CALL BACK FUNCTION HERE ******************* */
    cb_Fxn[tccNum] = &callback; /* Registering Callback Function      */

    if (TRUE == retVal)
    {
        /* Fill the PaRAM Set with transfer specific information */
        paramSet.srcAddr    = (unsigned int)(srcBuff);
        paramSet.destAddr   = (unsigned int)(dstBuff);
    
            paramSet.aCnt = (unsigned short)acnt;
        paramSet.bCnt = (unsigned short)bcnt;
        paramSet.cCnt = (unsigned short)ccnt;
        /* Setting up the SRC/DES Index */
        paramSet.srcBIdx = (short)acnt;
        paramSet.destBIdx = (short)acnt;
        if (syncType == EDMA3_SYNC_A)
        {
            /* A Sync Transfer Mode */
        paramSet.srcCIdx = (short)acnt;
        paramSet.destCIdx = (short)acnt;
        }
        else
        {
            /* AB Sync Transfer Mode */
            paramSet.srcCIdx = ((short)acnt * (short)bcnt);
                paramSet.destCIdx = ((short)acnt * (short)bcnt);
        }
        paramSet.linkAddr = (unsigned short)0xFFFFu;
        paramSet.bCntReload = (unsigned short)0u;
            paramSet.opt = 0u;
        /* Src & Dest are in INCR modes */
        paramSet.opt &= 0xFFFFFFFCu;
        /* Program the TCC */
        paramSet.opt |= ((tccNum << EDMA3CC_OPT_TCC_SHIFT) & EDMA3CC_OPT_TCC);

        /* Enable Intermediate & Final transfer completion interrupt */
        paramSet.opt |= (1 << EDMA3CC_OPT_ITCINTEN_SHIFT);
        paramSet.opt |= (1 << EDMA3CC_OPT_TCINTEN_SHIFT);

        if (syncType == EDMA3_SYNC_A)
            {
            paramSet.opt &= 0xFFFFFFFBu;
            }
        else
            {
               /* AB Sync Transfer Mode */
            paramSet.opt |= (1 << EDMA3CC_OPT_SYNCDIM_SHIFT);
            }

            opt = paramSet.opt;
        /* Now, write the PaRAM Set. */
        EDMA3QdmaSetPaRAM(SOC_EDMA30CC_0_REGS, chNum, paRAMId, &paramSet);
    }

    retVal = EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, chNum, EDMA3_TRIG_MODE_QDMA);
    /*
     * Since the transfer is going to happen in Manual mode of EDMA3
     * operation, we have to 'Enable the Transfer' multiple times.
     * Number of times depends upon the Mode (A/AB Sync)
     * and the different counts.
     */
    if (TRUE == retVal)
    {
        /*Need to activate next param*/
        if (syncType == EDMA3_SYNC_A)
        {
            numenabled = bcnt * ccnt;
        }
        else
        {
            /* AB Sync Transfer Mode */
            numenabled = ccnt;
        }
    
        for (index = 0; index < numenabled; index++)
        {
            irqRaised = 0u;
    
            if (index == (numenabled-1u))
            {
                /**
                 * Since OPT.STATIC field should be SET for isolated QDMA
                 * transfers or for the final transfer in a linked list of QDMA
                 * transfers, do the needful for the last request.
                 */ 
                opt |= EDMA3CC_OPT_STATIC;
                EDMA3QdmaSetPaRAMEntry(SOC_EDMA30CC_0_REGS, paRAMId, 
                                                  EDMA3CC_PARAM_ENTRY_OPT, opt);
            }

            opt |= EDMA3CC_OPT_FWID_8BIT;
            EDMA3QdmaSetPaRAMEntry(SOC_EDMA30CC_0_REGS, paRAMId, 
                                                  EDMA3CC_PARAM_ENTRY_OPT, opt);
            
            /*
             * Now trigger the QDMA channel by writing to the Trigger
             * Word which is set as Destination Address.
             */
            dstBuffAddr = (unsigned int)EDMA3QdmaGetPaRAMEntry(
                         SOC_EDMA30CC_0_REGS, paRAMId, EDMA3CC_PARAM_ENTRY_DST);
            EDMA3QdmaSetPaRAMEntry(SOC_EDMA30CC_0_REGS, paRAMId, 
                                          EDMA3CC_PARAM_ENTRY_DST, dstBuffAddr);
                
            /* Wait for the Completion ISR. */
        while (irqRaised == 0u)
            {
                /** Wait for the Completion ISR on Master Channel.
                  * You can insert your code here to do something
                  * meaningful. 
                 */
            }

            /* Check the status of the completed transfer */
        if (irqRaised < 0)
            {
                /* Some error occured, break from the FOR loop. */
                UARTPuts("\r\nQdma3Test: Event Miss Occured!!!\r\n", -1);

                /* Clear the error bits first */
               EDMA3ClearErrorBits(SOC_EDMA30CC_0_REGS, chNum, evtQ);
               break;
            }
        }
    }

    /* Match the Source and Destination Buffers. */
    if (TRUE == retVal)
    {
        for (index = 0; index < (MAX_ACOUNT * MAX_BCOUNT * MAX_CCOUNT ); index++)
            {
            if (srcBuff[index] != dstBuff[index])
            {
                Istestpassed = 0u;
                UARTPuts("Qdma3Test: Data write-read matching FAILED.\r\n", -1); 
                    UARTPuts("The mismatch happened at index : ", -1);
                    UARTPutNum((int)index + 1);
                UARTPuts("\r\n", -1);
                break;
            }
            }
        if ((MAX_ACOUNT * MAX_BCOUNT * MAX_CCOUNT ) ==  index)
            {
            Istestpassed = 1u;
                UARTPuts("Qdma3Test: Data write-read matching PASSED.\r\n", -1);
            }
    
    
        /* Free the previously allocated channel. */
        retVal = EDMA3FreeChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_QDMA, 
                          chNum, EDMA3_TRIG_MODE_QDMA, tccNum, 
                                evtQ);
        
            cb_Fxn[tccNum] = NULL; /* Unregister Callback Function */

        if (TRUE != retVal)
            {
            UARTPuts("Qdma3Test: EDMA3_DRV_freeChannel() FAILED.\r\n", -1);
            }
    }

    if(1u == Istestpassed)
    {
        UARTPuts("Qdma3Test PASSED.\r\n", -1);
        retVal = TRUE;
    }
    else
    {
        UARTPuts("Qdma3Test FAILED.\r\n", -1);
        retVal = FALSE;
    }

    return retVal;
}

#endif


void registerEdma3Interrupts()
{
    /* Register Interrupts Here */
    
    /******************** Completion Interrupt ********************************/

    /* Registers Edma3ComplHandler0 Isr in Interrupt Vector Table of AINTC.   */
    IntRegister(SYS_INT_CCINT0, edma3CCComplIsr);

    /*
    ** Map the channel number 2 of AINTC to EDMA CC0 system interrupt.
    ** Channel number 2 of AINTC is mapped to IRQ interrupt of ARM9 processor.
    */
    IntChannelSet(SYS_INT_CCINT0, 2);

    /* Enable the EDMA CC0 system interrupt in AINTC.*/
    IntSystemEnable(SYS_INT_CCINT0);

    /********************** CC Error Interrupt ********************************/

    /* Registers the EDMA3_0 Channel Controller 0 Error Interrupt Isr in the
    ** Interrupt Vector Table of AINTC.
    */
    IntRegister(SYS_INT_CCERRINT, edma3CCErrIsr);

    /*
    ** Map the channel number 2 of AINTC to EDMA CCERR system interrupt.
    */
    IntChannelSet(SYS_INT_CCERRINT, 2);

    /* Enable the EDMA CCERR system interrupt AINTC.*/
    IntSystemEnable(SYS_INT_CCERRINT);
}


/**
 * edma3CCComplIsr
 * \brief   ISR for successful transfer completion.
 *
 * \note    This function first disables its own interrupt to make it non-
 *          entrant.
 *
 * \return  None.
 */
void edma3CCComplIsr()
{
    volatile unsigned int pendingIrqs;
    volatile unsigned int isIPR = 0;

    unsigned int indexl;
    unsigned int Cnt = 0;
    indexl = 1u;
    IntSystemStatusClear(SYS_INT_CCINT0);
    isIPR = EDMA3GetIntrStatus(SOC_EDMA30CC_0_REGS);
    if(isIPR)
    {
        while ((Cnt < EDMA3CC_COMPL_HANDLER_RETRY_COUNT)&& (indexl != 0u))
    {
        indexl = 0u;
        pendingIrqs = EDMA3GetIntrStatus(SOC_EDMA30CC_0_REGS);
        while (pendingIrqs)
        {
        if(TRUE == (pendingIrqs & 1u))
                {
                /**
                 * If the user has not given any callback function
                 * while requesting the TCC, its TCC specific bit
                 * in the IPR register will NOT be cleared.
                 */
                /* Here write to ICR to clear the corresponding IPR bits */
                EDMA3ClrIntr(SOC_EDMA30CC_0_REGS, indexl);
                      (*cb_Fxn[indexl])(indexl, EDMA3_XFER_COMPLETE, NULL);
                }
                ++indexl;
                pendingIrqs >>= 1u;
        }
            Cnt++;
    }
    }
}

/**
 * edma3CCErrIsr
 * \brief   Interrupt ISR for Channel controller error.
 *
 * \note    This function first disables its own interrupt to make it non-
 *          entrant.
 *
 * \return  None.
 */
void edma3CCErrIsr()
{
    volatile unsigned int pendingIrqs;
    unsigned int Cnt = 0u;
    unsigned int index;
    unsigned int evtqueNum = 0;  /* Event Queue Num */

    pendingIrqs = 0u;
    index = 1u;

    IntSystemStatusClear(SYS_INT_CCERRINT);

    if((EDMA3GetErrIntrStatus(SOC_EDMA30CC_0_REGS) != 0 )
        || (EDMA3QdmaGetErrIntrStatus(SOC_EDMA30CC_0_REGS) != 0)
        || (EDMA3GetCCErrStatus(SOC_EDMA30CC_0_REGS) != 0))
    {
        /* Loop for EDMA3CC_ERR_HANDLER_RETRY_COUNT number of time,
         * breaks when no pending interrupt is found 
         */
        while ((Cnt < EDMA3CC_ERR_HANDLER_RETRY_COUNT)
                    && (index != 0u))
        {
            index = 0u;
            pendingIrqs = EDMA3GetErrIntrStatus(SOC_EDMA30CC_0_REGS);
            while (pendingIrqs)
            {
            /*Process all the pending interrupts*/
            if(TRUE == (pendingIrqs & 1u))
            {
                    /* Write to EMCR to clear the corresponding EMR bits.
                     */
                    /*Clear any SER*/
                EDMA3ClrMissEvt(SOC_EDMA30CC_0_REGS, index);
                }
                ++index;
                pendingIrqs >>= 1u;
            }
            index = 0u;
            pendingIrqs = EDMA3QdmaGetErrIntrStatus(SOC_EDMA30CC_0_REGS);
            while (pendingIrqs)
            {
                /*Process all the pending interrupts*/
                if(TRUE == (pendingIrqs & 1u))
                {
            /* Here write to QEMCR to clear the corresponding QEMR bits*/
                    /*Clear any QSER*/
                    EDMA3QdmaClrMissEvt(SOC_EDMA30CC_0_REGS, index);
                }
                ++index;
                pendingIrqs >>= 1u;
            }
        index = 0u;
            pendingIrqs = EDMA3GetCCErrStatus(SOC_EDMA30CC_0_REGS);
            if (pendingIrqs != 0u)
            {
            /* Process all the pending CC error interrupts. */
            /* Queue threshold error for different event queues.*/
            for (evtqueNum = 0u; evtqueNum < SOC_EDMA3_NUM_EVQUE; evtqueNum++)
                {
                if((pendingIrqs & (1u << evtqueNum)) != 0u)
                {
                        /* Clear the error interrupt. */
                        EDMA3ClrCCErr(SOC_EDMA30CC_0_REGS, (1u << evtqueNum));
                    }
                }

            /* Transfer completion code error. */
            if ((pendingIrqs & (1 << EDMA3CC_CCERR_TCCERR_SHIFT)) != 0u)
            {
                EDMA3ClrCCErr(SOC_EDMA30CC_0_REGS, 
                                      (0x01u << EDMA3CC_CCERR_TCCERR_SHIFT));
            }
                ++index;
            }
            Cnt++;       
        }
    }    
}

/*  This function invokes necessary functions to configure the ARM
**  processor and ARM Interrupt Controller(AINTC) to receive and
**  handle interrupts.
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

/********************************** End of file *****************************/     
