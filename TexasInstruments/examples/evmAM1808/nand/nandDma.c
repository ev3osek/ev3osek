/**
 *  \file   nandDma.c
 *
 *  \brief  This file contains the NAND DMA related functions definitions.
 *
 */

/*
* Copyright (C) 2010-2012 Texas Instruments Incorporated - http://www.ti.com/
*/
/*
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
*
*/

#include "hw_types.h"
#include "interrupt.h"
#include "emifa.h"
#include "edma.h"
#include "soc_OMAPL138.h"
#include "psc.h"
#include "uartStdio.h"

#include "nandlib.h"
#include "nandDma.h"

/*******************************************************************************
*                       INTERNAL MACRO DEFINITIONS
*******************************************************************************/

/*****************************************************************************/
/*
** Macros which defines the DMA related info like event Q num, TCC num, channel
** num etc.
*/
#define EMIFA_EDMA_CHANNEL_NUM                  (0)
#define EMIFA_EDMA_TCC_NUM                      (0)
#define EMIFA_EDMA_EVENT_Q_NUM                  (0)
#define REGION_NUMBER                           (0)

#define NAND_EDMA_ACNT_VAL                      (8)
#define NAND_EDMA_BCNT_VAL                      (NAND_BYTES_PER_TRNFS / NAND_EDMA_ACNT_VAL)



/******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/

static volatile unsigned int xferCompFlag = 0;


/******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/

/******************************************************************************
*                                                                             *
* \brief   Interrupt ISR for Channel controller error.                        *
*                                                                             *
* \note    This function first disables its own interrupt to make it non-     *
*          entrant.                                                           *
*                                                                             *
* \return  None.                                                              *
*                                                                             *
******************************************************************************/
static void Edma3CCErrorIsr()
{
    volatile unsigned int pendingIrqs;
    unsigned int Cnt = 0u;
    unsigned int index;
    unsigned int evtqueNum = 0;

    pendingIrqs = 0u;
    index = 1u;

#ifdef _TMS320C6X
    IntEventClear(SYS_INT_EDMA3_0_CC0_ERRINT);
#else
    IntSystemStatusClear(SYS_INT_CCERRINT);
#endif

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
                /*Process all the pending interrupts                    */
                if(TRUE == (pendingIrqs & 1u))
                {
                     /* Write to EMCR to clear the corresponding EMR bits. */
                     /* Clear any SER */

                    EDMA3ClrMissEvt(SOC_EDMA30CC_0_REGS, index);
                }
                ++index;
                pendingIrqs >>= 1u;
            }
            index = 0u;
            pendingIrqs = EDMA3QdmaGetErrIntrStatus(SOC_EDMA30CC_0_REGS);
            while (pendingIrqs)
            {
                /* Process all the pending interrupts */
                if(TRUE == (pendingIrqs & 1u))
                {
                    /* Here write to QEMCR to clear the corresponding QEMR bits */
                    /* Clear any QSER */
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

/******************************************************************************
*                                                                             *
* \brief   ISR for successful transfer completion.                            *
*                                                                             *
* \note    This function first disables its own interrupt to make it non-     *
*          entrant.                                                           *
*                                                                             *
* \return  None.                                                              *
*                                                                             *
******************************************************************************/
static void Edma3CompletionIsr(void)
{
    volatile unsigned int pendingIrqs;
    volatile unsigned int isIPR = 0;

    unsigned int indexl;
    unsigned int Cnt = 0;
    indexl = 1u;
#ifdef _TMS320C6X
    IntEventClear(SYS_INT_EDMA3_0_CC0_INT1);
#else
    IntSystemStatusClear(SYS_INT_CCINT0);
#endif
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
                                                                  
                     /* If the user has not given any callback function  *
                      * while requesting the TCC, its TCC specific bit   *
                      * in the IPR register will NOT be cleared.         */
                 
                    /* Here write to ICR to clear the corresponding IPR  *
                     * bits                                              */
                    EDMA3ClrIntr(SOC_EDMA30CC_0_REGS, indexl);

                    /* Transfer completed successfully                           */
                    EDMA3DisableTransfer(SOC_EDMA30CC_0_REGS, EMIFA_EDMA_CHANNEL_NUM,
                                         EDMA3_TRIG_MODE_MANUAL);
                    EDMA3ClrCCErr(SOC_EDMA30CC_0_REGS, EMIFA_EDMA_CHANNEL_NUM);
                    xferCompFlag = 1;       

                }
                ++indexl;
                pendingIrqs >>= 1u;
            }
            Cnt++;
        }
    }
}

/******************************************************************************
*                                                                             *
* \brief  This function configs the DMA for read.\n                           *
*                                                                             *
* \param  csBaseAddr    Chipselect base address                               *
*                                                                             *
* \param  data          Data pointer for read data                            *
*                                                                             *
* \param  len           Byte count to read                                    *
*                                                                             *
* \return Status of EDMA3EnableTransfer.                                      *
*                                                                             *
******************************************************************************/
static unsigned int EMIFANANDRxDmaConfig( unsigned int csBaseAddr, 
                                          unsigned char *data, 
                                          unsigned int len )
{
    unsigned int fifoWidth;
    EDMA3CCPaRAMEntry paramSet;

    fifoWidth  = 0;

    /* *************************************************************
     *                                                             *
     *  NOTE : There are two conditions that require care to be    *
     *         taken when performing NAND reads and writes via the *
     *         EDMA controller, these are ---                      *
     *                                                             *
     *      1. The address lines used to drive CLE and ALE         * 
     *             signals must be driven low.                     *
     *      2. The EMIFA does not support constant addressing mode *
     *                                                             *
     *  FOLLOW THE FOLLOWING WHIE PROGRAMMING EDMA FOR NAND READ   *
     *                                                             *
     *      1. ACNT <= 8 bytes                                     *
     *      2. BCNT = transfer size in bytes/ACNT                  *
     *      3. SIDX (source index) = 0                             *
     *      4. DIDX (destination index) = ACNT                     *
     *      5. Transfer mode = AB synchronized                     *
     *                                                             * 
     *   Refer the section 2.5.6.5 "NAND Data Read and Write via   * 
     *   EDMA Controller" of EMIFA user guide for more info        * 
     *                                                             * 
     * ************************************************************/

    /* Fill the PaRAM Set with transfer specific information    */
    paramSet.aCnt       = NAND_EDMA_ACNT_VAL;
    paramSet.bCnt       = (len/NAND_EDMA_ACNT_VAL);
    paramSet.bCntReload = 0u;
    paramSet.cCnt       = 1u;
    paramSet.destAddr   = (unsigned int )(data);
    paramSet.destBIdx   = NAND_EDMA_ACNT_VAL;
    paramSet.destCIdx   = 0u;
    paramSet.linkAddr   = 0xFFFFu;
    paramSet.srcAddr    = csBaseAddr;
    paramSet.srcBIdx    = 0u;
    paramSet.srcCIdx    = 0u;
    /* FIFO WIDTH is 8                                          */
    fifoWidth           = 0; 
    paramSet.opt        = (0x00100000u | (fifoWidth << 8u)) |
                          (0x01 << 2);

    /* Now, write the PaRAM Set.                                */
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, EMIFA_EDMA_CHANNEL_NUM, &paramSet);

    /* Now enable the transfer                                  */
    return EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, EMIFA_EDMA_CHANNEL_NUM,
                                 EDMA3_TRIG_MODE_MANUAL);
}


/******************************************************************************
*                                                                             *
* \brief  This function configs the DMA for write.\n                          *
*                                                                             *
* \param  csBaseAddr    Chipselect base address                               *
*                                                                             *
* \param  data          Data pointer for write data                           *
*                                                                             *
* \param  len           Byte count to write                                   *
*                                                                             *
* \return Status of EDMA3EnableTransfer.                                      *
*                                                                             *
******************************************************************************/
static unsigned int EMIFANANDTxDmaConfig( unsigned int csBaseAddr, 
                                          unsigned char *data, 
                                          unsigned int len)
{
    unsigned int fifoWidth;
    EDMA3CCPaRAMEntry paramSet;

    fifoWidth = 0;
    /* *************************************************************
     *                                                             *
     *  NOTE : There are two conditions that require care to be    *
     *         taken when performing NAND reads and writes via the *
     *         EDMA controller, these are ---                      *
     *                                                             *
     *      1. The address lines used to drive CLE and ALE         * 
     *             signals must be driven low.                     *
     *      2. The EMIFA does not support constant addressing mode *
     *                                                             *
     *  FOLLOW THE FOLLOWING WHIE PROGRAMMING EDMA FOR NAND WRITE  *
     *                                                             *
     *      1. ACNT <= 8 bytes                                     *
     *      2. BCNT = transfer size in bytes/ACNT                  *
     *      3. SIDX (source index) = 0                             *
     *      4. DIDX (destination index) = ACNT                     *
     *      5. Transfer mode = AB synchronized                     *
     *                                                             * 
     *   Refer the section 2.5.6.5 "NAND Data Read and Write via   * 
     *   EDMA Controller" of EMIFA user guide for more info        * 
     *                                                             * 
     * ************************************************************/
       
    /* Fill the PaRAM Set with transfer specific information    */
    paramSet.aCnt       = NAND_EDMA_ACNT_VAL;
    paramSet.bCnt       = (len/NAND_EDMA_ACNT_VAL);
    paramSet.bCntReload = 0u;
    paramSet.cCnt       = 1u;
    paramSet.destAddr   = csBaseAddr;
    paramSet.destBIdx   = 0;
    paramSet.destCIdx   = 0;
    paramSet.linkAddr   = 0xFFFFu;
    paramSet.srcAddr    = (unsigned int )(data);
    paramSet.srcBIdx    = NAND_EDMA_ACNT_VAL;
    paramSet.srcCIdx    = 0u;
   
    /* FIFO WIDTH is 8                                          */
    fifoWidth           = 0; 
    paramSet.opt        = (0x00100000u | (fifoWidth << 8u)) |
                       (0x01 << 2);

    /* Now, write the PaRAM Set.                                 */
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, EMIFA_EDMA_CHANNEL_NUM, &paramSet);

    /* Now enable the transfer                                  */
    return EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, EMIFA_EDMA_CHANNEL_NUM,
                                 EDMA3_TRIG_MODE_MANUAL);
}

/******************************************************************************
*                                                                             *
* \brief  This function configures the INTC to receive EDMA3 interrupts.      *
*                                                                             *
******************************************************************************/
static void EDMA3INTCConfigure(void)
{
#ifdef _TMS320C6X
    /* Initialize the DSP interrupt controller */
    IntDSPINTCInit();
    
    /* Enable interrupts globally */
    IntGlobalEnable();
    
    /* Register completion interrupt */    
    IntRegister(C674X_MASK_INT4, Edma3CompletionIsr);
    IntEventMap(C674X_MASK_INT4, SYS_INT_EDMA3_0_CC0_INT1);
    IntEnable(C674X_MASK_INT4);
    
    /* Register Error Interrupt */
    IntRegister(C674X_MASK_INT5, Edma3CCErrorIsr);
    IntEventMap(C674X_MASK_INT5, SYS_INT_EDMA3_0_CC0_ERRINT);
    IntEnable(C674X_MASK_INT5);    
#else
    /* Initialize the ARM Interrupt Controller(AINTC) */
    IntAINTCInit();

    /* Enable IRQ in CPSR */
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC */
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC */
    IntIRQEnable();
    
    /* Register completion interrupt */
    IntRegister(SYS_INT_CCINT0, Edma3CompletionIsr);
    IntChannelSet(SYS_INT_CCINT0, 2);
    IntSystemEnable(SYS_INT_CCINT0);

    /* Register Error Interrupt */
    IntRegister(SYS_INT_CCERRINT, Edma3CCErrorIsr);
    IntChannelSet(SYS_INT_CCERRINT, 2);
    IntSystemEnable(SYS_INT_CCERRINT);    
#endif
}


/******************************************************************************
**                       GLOBAL FUNCTION DEFINITIONS
*******************************************************************************/

/******************************************************************************
*                                                                             *
* \brief  This function setup the DMA for read/write                          *
*                                                                             *
* \param  nandInfo      Pointer to the strucure containing controller and     *
*                       device info.                                          *
*                                                                             *
* \param  data          Data pointer                                          *
*                                                                             *
* \param  dir           Direction which specifies the direction of transfer   *
*                       i.e read/write.                                       *
*                                                                             *
* \param  len           Byte count                                            *
*                                                                             *
* \return none.                                                               *
*                                                                             *
******************************************************************************/
void EMIFANANDXferSetup(NandInfo_t *nandInfo, unsigned char *data,
                       unsigned int len, NandDmaDir_t dir)
{
    unsigned int retVal = 0;

    xferCompFlag  = 0;
    if(dir == NAND_DMA_DIR_READ)
    {
        retVal = EMIFANANDRxDmaConfig(nandInfo->dataRegAddr, data, len);
    }
    else
    {
        retVal = EMIFANANDTxDmaConfig(nandInfo->dataRegAddr, data, len);
    }

    if (!retVal)
    {
        UARTPuts ("NAND : EDMA3EnableTransfer Failed.\r\n", -1);
    }
}

/******************************************************************************
*                                                                             *
* \brief  This function returns the status of the DMA transfer.               *
*                                                                             *
* \param  none.                                                               *
*                                                                             *
* \return DMA Xfer status.                                                    *
*                                                                             *
******************************************************************************/
unsigned int EMIFANANDXferStatusGet()
{
    return(xferCompFlag);
}

/******************************************************************************
*                                                                             *
* \brief  This function Initializs the DMA for read/write.                    *
*                                                                             *
* \note unused argument is added for future use.                              *
*                                                                             *
******************************************************************************/
void EMIFANANDEdmaInit(void *unused)
{

    /* Enabling the PSC for EDMA3CC_0). */
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_CC0, PSC_POWERDOMAIN_ALWAYS_ON,
                     PSC_MDCTL_NEXT_ENABLE);

    /* Enabling the PSC for EDMA3TC_0.  */
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_TC0, PSC_POWERDOMAIN_ALWAYS_ON,
                     PSC_MDCTL_NEXT_ENABLE);

    /* Configuring the INTC to receive EDMA3 interrupts. */    
    EDMA3INTCConfigure();
    
    /* Initialization of EDMA3  */
    EDMA3Init(SOC_EDMA30CC_0_REGS, EMIFA_EDMA_EVENT_Q_NUM);    
    
    /* Request DMA Channel and TCC for NAND data movement. */
    EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA,
                        EMIFA_EDMA_CHANNEL_NUM, EMIFA_EDMA_TCC_NUM,
                        EMIFA_EDMA_EVENT_Q_NUM);
}

/******************************************************************************
**                              END OF FILE
*******************************************************************************/
