/**
 * \file spiEdma.c
 *
 * \brief  This is a sample application file which invokes 
 *         some APIs from the SPI device abstraction layer 
 *         and EDMA3 device abstraction layer to perform 
 *         configuration, transmission and reception 
 *         operations between OnChip RAM and SPI Flash.
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

#include "spi.h"
#include "psc.h"
#include "uart.h"
#include "edma.h"
#include "string.h"
#include "hw_types.h"
#include "interrupt.h"
#include "edma_event.h"
#include "evmAM1808.h"
#include "uartStdio.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"

/******************************************************************/
/*                 MACRO DEFINITIONS                              */
/******************************************************************/
#define SIMO_SOMI_CLK_CS               (0x00000E01)
#define CHAR_LENGTH                    (0x08)

/* Flash address where data will be written and read. */
#define SPI_FLASH_ADDR_MSB1	       (0x0A)
#define SPI_FLASH_ADDR_MSB0            (0x00)
#define SPI_FLASH_ADDR_LSB             (0x00)

/* Sector erase command. */
#define SPI_FLASH_SECTOR_ERASE         (0xD8)

/* Page program command. */
#define SPI_FLASH_PAGE_WRITE           (0x02)

/* Status register read command. */
#define SPI_FLASH_STATUS_RX            (0x05)

/* Write enable command. */
#define SPI_FLASH_WRITE_EN             (0x06)

/* Flash data read command. */
#define SPI_FLASH_READ                 (0x03)

/* Check status of SPI Flash. */
#define WRITE_IN_PROGRESS              (0x01)
#define WRITE_ENABLE_LATCH             (0x02)

/******************************************************************/
/*              LOCAL FUNCTION PROTOTYPES                         */
/******************************************************************/
static void SPIInitialize(void);
static void SPISetUp(void);
static void SPIConfigDataFmtReg(unsigned long dataFormat);
static void SpiTxEdmaParamSet(unsigned int tccNum, 
                              unsigned int chNum,
                              volatile char *buffer, 
                              unsigned int buffLength);
static void SpiRxEdmaParamSet(unsigned int tccNum, 
                              unsigned int chNum,
                              volatile char *buffer, 
                              unsigned int length, 
                              unsigned int destBIdxFlag);

static void callback(unsigned int tccNum, 
                     unsigned int status);
static void Edma3CCErrHandlerIsr(void); 
static void Edma3ComplHandlerIsr(void);
static void RequestEDMA3Channels(void);
static void EDMA3Initialize(void);

static unsigned char FlashStatusRead(void);
static void IsWriteInProgress(void);
static unsigned int IsWriteEnabled(void);
static void CSHoldDeassert(void);
static void FlashSectorErase(void);
static void FlashPageProgram(volatile char *originalData);
static void ReadFromFlash(volatile char *readFlash);
static void WriteEnable(void);
static void CSHoldAssert(void);

static unsigned int verifyData(volatile char *string1,
                               volatile char *string2, 
                               unsigned int length);
static void ConfigureAINTCIntEDMA3(void);
static void SetupAINTCInt(void);

/******************************************************************/
/*                   GLOBAL VARIABLES                             */
/******************************************************************/
static void (*cb_Fxn[EDMA3_NUM_TCC]) (unsigned int tcc, 
                                      unsigned int status);
volatile unsigned int flagTx = 0;
volatile unsigned int flagRx = 0;
unsigned int evtQ = 0;

/******************************************************************/
/*              LOCAL FUNCTION DEFINITIONS                        */
/******************************************************************/

/*
** Main function.
*/
int main(void)
{
    volatile char originalData[260] = {0}; 
    volatile char readFlash[260] = {0};
    unsigned int retVal = 0;
    unsigned char choice;

    /* Initializes the UART Instance for serial communication. */
    UARTStdioInit(); 

    UARTPuts("Welcome to SPI EDMA application.\r\n", -1);
    UARTPuts("Here the SPI controller on the SoC communicates with", -1);
    UARTPuts(" the SPI Flash present on the SoM.\r\n\r\n", -1);

    /* Initializes the EDMA3 Instance. */
    EDMA3Initialize();

    /* Initializes the SPI1 Instance. */
    SPIInitialize();

    /* Request EDMA3CC for Tx and Rx channels for SPI1. */
    RequestEDMA3Channels();

    /* Enable SPI communication. */
    SPIEnable(SOC_SPI_1_REGS);

    /* Enable the SPI Flash for writing to it. */
    WriteEnable();

    UARTPuts("Do you want to erase a sector of the flash before writing to it ?.", -1);
    UARTPuts("\r\nInput y(Y)/n(N) to proceed.\r\n", -1);

    choice = UARTGetc();
    UARTPutc(choice); 

    if(('y' == choice) || ('Y' == choice))
    {
        /* Erasing the specified sector of SPI Flash. */
        FlashSectorErase();
    }
    
    WriteEnable(); 

    /* Program a specified Page of the SPI Flash. */
    FlashPageProgram(originalData); 

    /* Read the contents of the page that was previously written to. */
    ReadFromFlash(readFlash);

    /* Verify whether the written and the read contents are equal. */
    retVal = verifyData(&originalData[4], &readFlash[4], 256); 

    if(TRUE == retVal)
    {
        UARTPuts("\r\nThe data in the Flash and the one written ", -1); 
        UARTPuts("to it are equal.\r\n", -1);
    }
    else
    {
        UARTPuts("\r\n\r\nThe data in the Flash and the one written to it", -1);
        UARTPuts(" are not equal.\r\n", -1);
    } 
    
    while(1);
}

/*
** This function is used to set the PaRAM entries of EDMA3 for the Transmit 
** Channel of SPI1. The corresponding EDMA3 channel is also enabled for 
** transmission.
*/
static void SpiTxEdmaParamSet(unsigned int tccNum, unsigned int chNum,
                              volatile char *buffer, unsigned int buffLength)
{
    EDMA3CCPaRAMEntry paramSet;
    unsigned char *p = (unsigned char *)&paramSet;
    unsigned int i = 0;

    /* Clean-up the contents of structure variable. */
    for (i = 0; i < sizeof(paramSet); i++)
    {
        p[i] = 0;
    }
    /* Fill the PaRAM Set with transfer specific information. */

    /* srcAddr holds address of memory location buffer. */
    paramSet.srcAddr = (unsigned int) buffer;

    /* destAddr holds address of SPIDAT1 register. */
    paramSet.destAddr = (unsigned int) (SOC_SPI_1_REGS + SPI_SPIDAT1);

    /* aCnt holds the number of bytes in an array. */
    paramSet.aCnt = (unsigned short) 1;

    /* bCnt holds the number of such arrays to be transferred. */
    paramSet.bCnt = (unsigned short) buffLength;

    /* cCnt holds the number of frames of aCnt*bBcnt bytes to be transferred. */
    paramSet.cCnt = (unsigned short) 1;

    /*
    ** The srcBidx should be incremented by aCnt number of bytes since the 
    ** source used here is  memory. 
    */
    paramSet.srcBIdx = (short) 1;

    /* A sync Transfer Mode is set in OPT.*/
    /* srCIdx and destCIdx set to zero since ASYNC Mode is used. */
    paramSet.srcCIdx = (short) 0;

    /* Linking transfers in EDMA3 are not used. */
    paramSet.linkAddr = (unsigned short)0xFFFF;
    paramSet.bCntReload = (unsigned short)0;

    paramSet.opt = 0x00000000;
    
    /* SAM field in OPT is set to zero since source is memory and memory 
       pointer needs to be incremented. DAM field in OPT is set to zero 
       since destination is not a FIFO. */ 
   
    /* Set TCC field in OPT with the tccNum. */
    paramSet.opt |= ((tccNum << EDMA3CC_OPT_TCC_SHIFT) & EDMA3CC_OPT_TCC);

    /* EDMA3 Interrupt is enabled and Intermediate Interrupt Disabled.*/
    paramSet.opt |= (1 << EDMA3CC_OPT_TCINTEN_SHIFT);

    /* Now write the PaRam Set to EDMA3.*/
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, chNum, &paramSet);

    /* EDMA3 Transfer is Enabled. */
    EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, chNum, EDMA3_TRIG_MODE_EVENT);
}

/*
** This function is used to set the PaRAM entries of EDMA3 for the Receive 
** Channel of SPI1. The corresponding EDMA3 channel is also enabled for 
** reception.
*/

static void SpiRxEdmaParamSet(unsigned int tccNum, unsigned int chNum,
                              volatile char *buffer, unsigned int length,
                              unsigned int destBidxFlag)
{
    EDMA3CCPaRAMEntry paramSet;
    unsigned char *p = (unsigned char *)&paramSet;
    unsigned int i = 0;

    /* Clean-up the contents of structure variable. */
    for (i = 0; i < sizeof(paramSet); i++)
    {
        p[i] = 0;
    }

    /* Fill the PaRAM Set with Receive specific information. */

    /* srcAddr holds address of SPI Rx FIFO. */
    paramSet.srcAddr = (unsigned int) (SOC_SPI_1_REGS + SPI_SPIBUF);

    /* destAddr is address of memory location named buffer. */
    paramSet.destAddr = (unsigned int) buffer;

    /* aCnt holds the number of bytes in an array. */
    paramSet.aCnt = (unsigned short) 1;

    /* bCnt holds the number of such arrays to be transferred. */
    paramSet.bCnt = (unsigned short) length;

    /* cCnt holds the number of frames of aCnt*bBcnt bytes to be transferred. */
    paramSet.cCnt = (unsigned short) 1;

    /* The srcBidx should not be incremented since it is a h/w register. */
    paramSet.srcBIdx = 0;

    if(TRUE == destBidxFlag)
    {
        /* The destBidx should be incremented for every byte. */
        paramSet.destBIdx = 1;
    }
    else
    {
        /* The destBidx should not be incremented. */
        paramSet.destBIdx = 0;
    }

    /* A sync Transfer Mode. */
    /* srCIdx and destCIdx set to zero since ASYNC Mode is used. */
    paramSet.srcCIdx = 0;
    paramSet.destCIdx = 0;

    /* Linking transfers in EDMA3 are not used. */
    paramSet.linkAddr = (unsigned short)0xFFFF;
    paramSet.bCntReload = 0;

    paramSet.opt = 0x00000000;    

    /* Set TCC field in OPT with the tccNum. */
    paramSet.opt |= ((tccNum << EDMA3CC_OPT_TCC_SHIFT) & EDMA3CC_OPT_TCC);

    /* EDMA3 Interrupt is enabled and Intermediate Interrupt Disabled.*/
    paramSet.opt |= (1 << EDMA3CC_OPT_TCINTEN_SHIFT);
    
    /* Now write the PaRam Set to EDMA3.*/
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, chNum, &paramSet);

    /* EDMA3 Transfer is Enabled. */
    EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, chNum, EDMA3_TRIG_MODE_EVENT);
}

/*
** EDMA3 completion Interrupt Service Routine(ISR).
*/

static void Edma3ComplHandlerIsr(void)
{
    volatile unsigned int pendingIrqs;
    volatile unsigned int isIPR = 0;

    volatile unsigned int indexl;
    volatile unsigned int Cnt = 0;
    indexl = 1;
    IntSystemStatusClear(SYS_INT_CCINT0);
    isIPR = EDMA3GetIntrStatus(SOC_EDMA30CC_0_REGS);
    if(isIPR)
    {
        while ((Cnt < EDMA3CC_COMPL_HANDLER_RETRY_COUNT)&& (indexl != 0))
        {
            indexl = 0;
            pendingIrqs = EDMA3GetIntrStatus(SOC_EDMA30CC_0_REGS);
            while (pendingIrqs)
            {
                if((pendingIrqs & 1) == TRUE)
                {
                    /**
                     * If the user has not given any callback function
                     * while requesting the TCC, its TCC specific bit
                     * in the IPR register will NOT be cleared.
                     */
                    /* Here write to ICR to clear the corresponding IPR bits. */
                    EDMA3ClrIntr(SOC_EDMA30CC_0_REGS, indexl);
                    (*cb_Fxn[indexl])(indexl, EDMA3_XFER_COMPLETE);
                }
                ++indexl;
                pendingIrqs >>= 1;
            }
            Cnt++;
        }
    }

}


/*
** EDMA3 Error Interrupt Service Routine(ISR).
*/

static void Edma3CCErrHandlerIsr(void)
{
    volatile unsigned int pendingIrqs = 0;
    unsigned int Cnt = 0;
    unsigned int index = 1;
    unsigned int regionNum = 0;  
    unsigned int evtqueNum = 0;

    IntSystemStatusClear(SYS_INT_CCERRINT);

    if((HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_EMR) != 0 )
        || (HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_QEMR) != 0)
        || (HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_CCERR) != 0))
    {
        /* Loop for EDMA3CC_ERR_HANDLER_RETRY_COUNT number of time, breaks 
           when no pending interrupt is found. */
        while ((Cnt < EDMA3CC_ERR_HANDLER_RETRY_COUNT) && (index != 0))
        {
            index = 0;
            pendingIrqs = HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_EMR);
            while (pendingIrqs)
            {
                /*Process all the pending interrupts.*/
                if((pendingIrqs & 1)==TRUE)
                {
                    /* Write to EMCR to clear the corresponding EMR bits.*/
                    HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_EMCR) = (1<<index);
                    /*Clear any SER*/
                    HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_S_SECR(regionNum)) = (1<<index);
                }
                ++index;
                pendingIrqs >>= 1;
            }
            index = 0;
            pendingIrqs = HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_QEMR);
            while (pendingIrqs)
            {
                /*Process all the pending interrupts.*/
                if((pendingIrqs & 1)==TRUE)
                {
                    /* Here write to QEMCR to clear the corresponding QEMR bits.*/
                    HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_QEMCR) = (1<<index);
                    /*Clear any QSER*/
                    HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_S_QSECR(0)) = (1<<index);
                }
                ++index;
                pendingIrqs >>= 1;
            }
            index = 0;
            pendingIrqs = HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_CCERR);
            if(pendingIrqs != 0)
            {
                /* Process all the pending CC error interrupts. */
                /* Queue threshold error for different event queues.*/
                for (evtqueNum = 0; evtqueNum < EDMA3_0_NUM_EVTQUE; evtqueNum++)
                {
                    if((pendingIrqs & (1 << evtqueNum)) != 0)
                    {
                        /* Clear the error interrupt. */
                        HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_CCERRCLR) = (1 << evtqueNum);
                    }
                }

                /* Transfer completion code error. */
                if ((pendingIrqs & (1 << EDMA3CC_CCERR_TCCERR_SHIFT)) != 0)
                {
                    HWREG(SOC_EDMA30CC_0_REGS + EDMA3CC_CCERRCLR) = \
                         (0x01 << EDMA3CC_CCERR_TCCERR_SHIFT);
                }
                ++index;
            }
            Cnt++;
        }
    }
}

/*
** This function is used as a callback from EDMA3 Completion Handler. 
** The DMA Mode operation of SPI1 is disabled over here.
*/
static void callback(unsigned int tccNum, unsigned int status)
{
    if(tccNum == 19)
    {
        flagTx = 1;
        /* Disable SPI-EDMA Communication. */ 
        SPIIntDisable(SOC_SPI_1_REGS, SPI_DMA_REQUEST_ENA_INT);
    }
    else if(tccNum == 18)
    {
        flagRx = 1;
        /* Disable SPI-EDMA Communication. */ 
        SPIIntDisable(SOC_SPI_1_REGS, SPI_DMA_REQUEST_ENA_INT);
    }
}

/*
** This function enables the SPI Flash for writing.
*/

static void WriteEnable(void)
{
    unsigned int buffLength = 1;
    volatile char writeEn;
    volatile char dummy;

    writeEn = SPI_FLASH_WRITE_EN;

    /* Configure the PaRAM registers in EDMA for Transmission. */
    SpiTxEdmaParamSet(EDMA3_CHA_SPI1_TX, EDMA3_CHA_SPI1_TX, &writeEn, buffLength);

    /* Registering Callback Function for Transmission. */
    cb_Fxn[EDMA3_CHA_SPI1_TX] = &callback; 

    /* Configure the PaRAM registers in EDMA for Reception. */
    SpiRxEdmaParamSet(EDMA3_CHA_SPI1_RX, EDMA3_CHA_SPI1_RX, &dummy, buffLength, FALSE);

    /* Registering Callback Function for Reception. */
    cb_Fxn[EDMA3_CHA_SPI1_RX] = &callback;

    /* Assert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldAssert();

    /* Enable SPI controller to generate DMA events */
    SPIIntEnable(SOC_SPI_1_REGS, SPI_DMA_REQUEST_ENA_INT);

    /* Wait until both the flags are set to 1 in the callback function. */
    while((0 == flagTx) || (0 == flagRx));

    flagTx = 0;
    flagRx = 0;

    /* Deassert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldDeassert();

    /* Wait until SPI Flash is enabled for writing. */
    while (IsWriteEnabled() != TRUE);
}

/*
** This function sends a command to erase a specified sector of the SPI Flash.
*/

static void FlashSectorErase(void)
{
    volatile char sectorErase[4] = {0};
    unsigned int buffLength = 4;
    volatile char dummy;

    sectorErase[0] = SPI_FLASH_SECTOR_ERASE;
    sectorErase[1] = SPI_FLASH_ADDR_MSB1;
    sectorErase[2] = SPI_FLASH_ADDR_MSB0;
    sectorErase[3] = SPI_FLASH_ADDR_LSB;
 
    /* Configure the PaRAM registers in EDMA for Transmission. */
    SpiTxEdmaParamSet(EDMA3_CHA_SPI1_TX, EDMA3_CHA_SPI1_TX, sectorErase, buffLength);

    /* Registering Callback Function for Transmission. */
    cb_Fxn[EDMA3_CHA_SPI1_TX] = &callback;
  
    /* Configure the PaRAM registers in EDMA for Reception. */
    SpiRxEdmaParamSet(EDMA3_CHA_SPI1_RX, EDMA3_CHA_SPI1_RX, &dummy, buffLength, FALSE);

    /* Registering Callback Function for Reception. */
    cb_Fxn[EDMA3_CHA_SPI1_RX] = &callback;
   
    /* Assert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldAssert();

    /* Enable SPI controller to generate DMA events */
    SPIIntEnable(SOC_SPI_1_REGS, SPI_DMA_REQUEST_ENA_INT);

    /* Wait until both the flags are set to 1 in the callback function. */
    while((0 == flagTx) || (0 == flagRx));

    flagTx = 0;
    flagRx = 0;

    /* Deassert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldDeassert();

    /* Wait until the previous write to the SPI Flash if completed. */
    IsWriteInProgress(); 
}

/*
** This function programs a specified page of the SPI Flash.
** The specified bytes get programmed in the SPI Flash.
*/

static void FlashPageProgram(volatile char *pVrf_Data)
{
    volatile char pageProgram[260] = {0};
    unsigned int buffLength = 0;
    unsigned int index = 0;
    volatile char dummy;

    /* Set the first 4 bytes of pageProgram with SPI Flash Page 
    ** Program Sequence instructions 
    */
    pageProgram[0] = SPI_FLASH_PAGE_WRITE;
    pageProgram[1] = SPI_FLASH_ADDR_MSB1;
    pageProgram[2] = SPI_FLASH_ADDR_MSB0;
    pageProgram[3] = SPI_FLASH_ADDR_LSB;
    
    /* Set the remaining bytes of pageProgram with 256 bytes of data */
    for(index = 4; index < 260; index++)
    {
        pageProgram[index] = 259 - index;
        pVrf_Data[index] = 259 - index;
    }

    buffLength = index;

    /* Configure the PaRAM registers in EDMA for Transmission.*/
    SpiTxEdmaParamSet(EDMA3_CHA_SPI1_TX, EDMA3_CHA_SPI1_TX, pageProgram, buffLength);

    /* Registering Callback Function for Transmission. */
    cb_Fxn[EDMA3_CHA_SPI1_TX] = &callback;

    /* Configure the PaRAM registers in EDMA for Reception.*/
    SpiRxEdmaParamSet(EDMA3_CHA_SPI1_RX, EDMA3_CHA_SPI1_RX, &dummy, buffLength, FALSE);

    /* Registering Callback Function for Reception. */
    cb_Fxn[EDMA3_CHA_SPI1_RX] = &callback;

    /* Assert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldAssert();

    /* Enable SPI controller to generate DMA events */
    SPIIntEnable(SOC_SPI_1_REGS, SPI_DMA_REQUEST_ENA_INT);

    /* Wait until both the flags are set to 1 in the callback function. */
    while((0 == flagTx) || (0 == flagRx));

    flagTx = 0;
    flagRx = 0;

    /* Deassert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldDeassert();
    
    /* Wait until the previous write to the SPI Flash if completed. */
    IsWriteInProgress(); 
}

/*
** This function reads data bytes from SPI Flash.
*/

static void ReadFromFlash(volatile char *pReadFlash)
{
    volatile char writeFlash[260] = {0};
    unsigned int buffLength = 0;
    unsigned int index = 0;
 
    /* Set the first 4 bytes of writeFlash with SPI Flash Read 
    ** Instruction Sequence. 
    */
    writeFlash[0] = SPI_FLASH_READ;
    writeFlash[1] = SPI_FLASH_ADDR_MSB1;
    writeFlash[2] = SPI_FLASH_ADDR_MSB0;
    writeFlash[3] = SPI_FLASH_ADDR_LSB;

    /*
    ** Initializing the remaining bytes of transmit array to zero.
    ** These are dummy bytes and are transmitted at times when the 
    ** focus will be on receiving data.
    */
    for(index = 4; index < 260; index++)
    {
        writeFlash[index] = 0;
    }

    buffLength = index;

    /* Configure the PaRAM registers in EDMA for Transmission.*/
    SpiTxEdmaParamSet(EDMA3_CHA_SPI1_TX, EDMA3_CHA_SPI1_TX, writeFlash, buffLength);     
   
    /* Registering Callback Function for Transmission. */
    cb_Fxn[EDMA3_CHA_SPI1_TX] = &callback;
    
    /* Configure the PaRAM registers in EDMA for Reception.*/
    SpiRxEdmaParamSet(EDMA3_CHA_SPI1_RX, EDMA3_CHA_SPI1_RX, pReadFlash, buffLength, TRUE);
    
    /* Registering Callback Function for Reception. */
    cb_Fxn[EDMA3_CHA_SPI1_RX] = &callback;
    
    /* Assert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldAssert();
    
    /* Enable SPI controller to generate DMA events */
    SPIIntEnable(SOC_SPI_1_REGS, SPI_DMA_REQUEST_ENA_INT);
    
    /* Wait until both the flags are set to 1 in the callback function. */
    while((0 == flagTx) || (0 == flagRx));

    flagTx = 0;
    flagRx = 0;

    /* Deassert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldDeassert();
}

/*
** This function asserts the CSHOLD line.
*/

static void CSHoldAssert(void)
{
    SPIDat1Config(SOC_SPI_1_REGS, (SPI_CSHOLD | SPI_DATA_FORMAT0), 0x01);
}


/*
** This function deasserts the CSHOLD line.
*/

static void CSHoldDeassert(void)
{
    SPIDat1Config(SOC_SPI_1_REGS, SPI_DATA_FORMAT0, 0x01);
}


/*
** This function checks whether the SPI Flash write is enabled.
** Return TRUE if enabled and FALSE if not enabled.
*/

static unsigned int IsWriteEnabled(void)
{
    volatile unsigned char temp = 0;
    unsigned int retVal = FALSE;

    /* Reading the Status Register of SPI Flash. */
    temp = FlashStatusRead();

    if (temp & WRITE_ENABLE_LATCH)
    { 
	retVal = TRUE;
    }

    return retVal;
}

/*
** This function checks whether a write to the SPI Flash is in progress 
** or not. It loops until the previous write to SPI Flash is completed.
*/

static void IsWriteInProgress(void)
{
    volatile unsigned char temp = 0;
    do
    {
        temp = FlashStatusRead();
    }while(temp & WRITE_IN_PROGRESS);
}

/*
** This function returns the value of the Status Register of SPI Flash.
*/ 

static unsigned char FlashStatusRead(void)
{
    volatile char writeFlash[2] = {0};
    volatile char readFlash[2] = {0};
    unsigned int buffLength = 0;
   
    writeFlash[0] = SPI_FLASH_STATUS_RX;
    writeFlash[1] = 0;

    buffLength = 2;
    
    /* Configure the PaRAM registers in EDMA for Transmission.*/
    SpiTxEdmaParamSet(EDMA3_CHA_SPI1_TX, EDMA3_CHA_SPI1_TX, writeFlash, buffLength);     

    /* Registering Callback Function for Transmission. */
    cb_Fxn[EDMA3_CHA_SPI1_TX] = &callback;
       
    /* Configure the PaRAM registers in EDMA for Reception. */
    SpiRxEdmaParamSet(EDMA3_CHA_SPI1_RX, EDMA3_CHA_SPI1_RX, readFlash, buffLength, TRUE);

    /* Registering Callback Function for Reception. */
    cb_Fxn[EDMA3_CHA_SPI1_RX] = &callback;

    /* Assert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldAssert();

    /* Enable SPI controller to generate DMA events */
    SPIIntEnable(SOC_SPI_1_REGS, SPI_DMA_REQUEST_ENA_INT);
    
    /* Wait until both the flags are set to 1 in the callback function. */
    while((0 == flagTx) || (0 == flagRx));

    flagTx = 0;
    flagRx = 0;

    /* Deassert the CSHOLD line corresponding to the SPI Flash. */
    CSHoldDeassert();

    return ((unsigned char)readFlash[1]);
}

/*
** This function takes two addresses and checks if the bytes in that 
** and in the following addresses are equal or not. Further, number of 
** bytes to be checked is also passed.
*/

static unsigned int verifyData(volatile char *string1, 
                               volatile char *string2, 
                               unsigned int length)
{
    unsigned int index = 0;
    unsigned int retVal = TRUE;
    for(index = 0; index < length; index++)
    {
        if(*string1++ != *string2++)
        {
	    retVal = FALSE;
            UARTPuts("\r\n\r\n", -1);
            UARTPuts("VerifyData: Comparing the data written to and read", -1);
            UARTPuts(" from flash.\r\nThe two data blocks are unequal.", -1);
            UARTPuts(" Mismatch found at index ", -1);
            UARTPutNum((int)index + 1);          
             
	    break;
        }
    }

    return retVal;
}

/*
** Initialization of SPI1 Instance is done here. 
*/
static void SPIInitialize(void)
{
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_SPI1, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    /* Using SPI1 instance. */   
    SPIPinMuxSetup(1);

    /* Select CS0 of SPI1. The SPI Flash is connected to SPI1_SCS[0]. */
    SPI1CSPinMuxSetup(0); 

    SPISetUp();
}    

/*
** Configures the SPI1 instance for communication. 
*/
static void SPISetUp(void)
{
    unsigned char dcs = 0x01;
    unsigned int val = SIMO_SOMI_CLK_CS;

    /* Resets the SPI */
    SPIReset(SOC_SPI_1_REGS);
  
    /* Brings SPI Out-of-Reset */
    SPIOutOfReset(SOC_SPI_1_REGS);

    /* Configures SPI in Master Mode */
    SPIModeConfigure(SOC_SPI_1_REGS, SPI_MASTER_MODE);

    /* Sets SPI Controller for 4-pin Mode with Chip Select */
    SPIPinControl(SOC_SPI_1_REGS, 0, 0, &val);

    /* Configures the Prescale bit in Data Format register. */
    SPIClkConfigure(SOC_SPI_1_REGS, 150000000, 10000000, 
                   SPI_DATA_FORMAT0); 

    /* Chip Select Default Pattern is Set To 1 in SPIDEF Register*/
    SPIDefaultCSSet(SOC_SPI_1_REGS, dcs);

    /* Configures SPI Data Format Register */
    SPIConfigDataFmtReg(SPI_DATA_FORMAT0);
}


/*
** Configuration of SPI1 Data Format Register is done here. 
*/
static void SPIConfigDataFmtReg(unsigned long dataFormat)
{
    /* Configures the polarity and phase of SPI 1lock */
    SPIConfigClkFormat(SOC_SPI_1_REGS,
                      (SPI_CLK_POL_HIGH | SPI_CLK_INPHASE),
                       dataFormat);

    /* Configures SPI to transmit MSB bit First during data transfer */
    SPIShiftMsbFirst(SOC_SPI_1_REGS, dataFormat);

    /* Sets the Charcter length */
    SPICharLengthSet(SOC_SPI_1_REGS, CHAR_LENGTH, dataFormat);
}


/*
** This function configures the power supply for EDMA3 Channel Controller 0
** and Transfer Controller 0, registers the EDMA interrupts in AINTC.
*/
static void EDMA3Initialize(void)
{
    /* Enabling the PSC for EDMA3CC_0).*/ 
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_CC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    /* Enabling the PSC for EDMA3TC_0.*/
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_TC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    /* Initialization of EDMA3 */    
    EDMA3Init(SOC_EDMA30CC_0_REGS, evtQ);
   
    /*
    ** Enable AINTC to handle interuppts. Also enable IRQ interuppt in 
    ** ARM processor.
    */
    SetupAINTCInt();

    /* Register EDMA3 Interrupts */
    ConfigureAINTCIntEDMA3();
}

/*
** This function invokes necessary functions to configure the ARM
** processor and ARM Interrupt Controller(AINTC) to receive and
** handle interrupts.
*/

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

/*
** This function configures the AINTC to receive EDMA3 interrupts. 
*/
static void ConfigureAINTCIntEDMA3(void)
{

    IntRegister(SYS_INT_CCINT0, Edma3ComplHandlerIsr);

    IntChannelSet(SYS_INT_CCINT0, 2);

    IntSystemEnable(SYS_INT_CCINT0);

    IntRegister(SYS_INT_CCERRINT, Edma3CCErrHandlerIsr);

    IntChannelSet(SYS_INT_CCERRINT, 2);

    IntSystemEnable(SYS_INT_CCERRINT);
}


/*
** This function allocates EDMA3 channels to SPI1 for trasmisssion and
** reception purposes.
*/
static void RequestEDMA3Channels(void)
{
    /* Request DMA Channel and TCC for SPI Transmit*/
    EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA, \
                        EDMA3_CHA_SPI1_TX, EDMA3_CHA_SPI1_TX, evtQ);

    /* Request DMA Channel and TCC for SPI Receive*/
    EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA, \
                        EDMA3_CHA_SPI1_RX, EDMA3_CHA_SPI1_RX, evtQ); 
}


/******************************** End of file ********************************/
