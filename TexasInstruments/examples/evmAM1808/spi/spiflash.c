/**
 * \file spi.c
 *
 * \brief  This is a sample application file which invokes some APIs
 *         from the SPI device abstraction layer to perform configuration,
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

#include <string.h>
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "uart.h"
#include "spi.h"
#include "psc.h"
#include "interrupt.h"
#include "uartStdio.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
/* value to configure SMIO,SOMI,CLK and CS pin as functional pin */
#define SIMO_SOMI_CLK_CS        0x00000E01
#define CHAR_LENGTH             0x8

/* flash address where data will be written and read */
#define SPI_FLASH_ADDR_MSB1     0x0A
#define SPI_FLASH_ADDR_MSB0     0x00
#define SPI_FLASH_ADDR_LSB      0x00

/* sector erase command */
#define SPI_FLASH_SECTOR_ERASE  0xD8

/* page program command */
#define SPI_FLASH_PAGE_WRITE    0x02

/* status register read command */
#define SPI_FLASH_STATUS_RX     0x05

/* write enable command */
#define SPI_FLASH_WRITE_EN      0x06

/* flash data read command */
#define SPI_FLASH_READ          0x03

/* flash data read */
#define WRITE_IN_PROGRESS       0x01

/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void SPIConfigDataFmtReg(unsigned long dataFormat);
static void ReadFromFlash(void);
static void IsFlashBusy(void);
static void WritetoFlash(void);
static void WriteEnable(void);
static void SpiTransfer(void);
static void SectorErase(void);
static void VerifyData(void);
static void StatusGet(void);
static void SetUpInt(void);
static void SetUpSPI(void);
void SPIIsr(void);

/******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
volatile unsigned int flag = 1;
unsigned int len;
char vrf_data[260];
char tx_data[260];
char rx_data[260];
char *p_tx;
char *p_rx;

/******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/
int main(void)
{
    unsigned char choice = 0;

    /* Waking up the SPI1 instance. */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_SPI1, PSC_POWERDOMAIN_ALWAYS_ON,
                     PSC_MDCTL_NEXT_ENABLE);

    /* Initializing the UART instance for serial communication. */
    UARTStdioInit();
    
    UARTPuts("StarterWare AM1808 SPI application.\r\n\r\n", -1);
    UARTPuts("Here the SPI controller on the SoC communicates with", -1);
    UARTPuts(" the SPI Flash present on the SoM.\r\n\r\n", -1);
    /* Performing the Pin Multiplexing for SPI1. */
    SPIPinMuxSetup(1);

    /* 
    ** Using the Chip Select(CS) 0 pin of SPI1 to communicate with SPI Flash.
    ** AM1808 EVM mandates us to do so.
    */
    SPI1CSPinMuxSetup(0);

    /* Enable use of SPI1 interrupts. */
    SetUpInt();

    /* Configuring and enabling the SPI1 instance. */
    SetUpSPI();

    /* Preparing the Flash for a Write. */
    WriteEnable();

    UARTPuts("Do you want to erase a sector of the flash before writing to it ?.", -1);
    UARTPuts("\r\nInput y(Y)/n(N) to proceed.\r\n", -1);

    choice = UARTGetc();
    UARTPutc(choice); 

    if(('y' == choice) || ('Y' == choice))
    {
        /* Erasing a Sector of the Flash. */
        SectorErase();
    }
    WriteEnable();

    /* Programming the necessary data to Flash. */
    WritetoFlash();

    /* Reading from the required location from Flash. */
    ReadFromFlash();

    /* Comparing the written and read data. */
    VerifyData();

    while(1);
}

/*
** Reads the status register of m25p80 flash 
**
*/
static void StatusGet(void)
{
    tx_data[0] = SPI_FLASH_STATUS_RX;
    len = 2;
    SPIDat1Config(SOC_SPI_1_REGS, (SPI_CSHOLD | SPI_DATA_FORMAT0), 0x1);
    SpiTransfer();
}

/* 
** Enables write to m25p80 flash 
**
*/
static void WriteEnable(void)
{
    tx_data[0] = SPI_FLASH_WRITE_EN;
    len = 1;
    SPIDat1Config(SOC_SPI_1_REGS, (SPI_CSHOLD | SPI_DATA_FORMAT0), 0x1);
    SpiTransfer();
} 

/* 
** It polls for write in progress bit(wip)in status register of m25p80 flash 
**
*/
static void IsFlashBusy(void)
{
    do{
         StatusGet();

      }while(rx_data[1] & WRITE_IN_PROGRESS);
}

/* 
** Set the all bits to 1 in chosen sector 
**
*/
static void SectorErase(void)
{
    tx_data[0] =  SPI_FLASH_SECTOR_ERASE;
    tx_data[1] =  SPI_FLASH_ADDR_MSB1;
    tx_data[2] =  SPI_FLASH_ADDR_MSB0;
    tx_data[3] =  SPI_FLASH_ADDR_LSB;

    len = 4;
    SPIDat1Config(SOC_SPI_1_REGS, (SPI_CSHOLD | SPI_DATA_FORMAT0), 0x1);
    SpiTransfer(); 
    
    IsFlashBusy();
}

/* 
** Writes 256 bytes of data to desired memory address 
**
*/
static void WritetoFlash(void)
{
    unsigned int index;

    tx_data[0] =  SPI_FLASH_PAGE_WRITE;
    tx_data[1] =  SPI_FLASH_ADDR_MSB1;
    tx_data[2] =  SPI_FLASH_ADDR_MSB0;
    tx_data[3] =  SPI_FLASH_ADDR_LSB;

    /* Populate the data to be written to the flash */
    for (index = 4; index < 260; index++)
    {
        tx_data[index] =  index;
    }
 
    for(index = 4; index < 260; index++)
    { 
         vrf_data[index] = index;
    }

    len = index;
    SPIDat1Config(SOC_SPI_1_REGS, (SPI_CSHOLD | SPI_DATA_FORMAT0), 0x1);
    SpiTransfer();

    IsFlashBusy();
}

/* 
** Reads the data from addressed memory of flash 
**
*/
static void ReadFromFlash(void)
{
    unsigned int index;

    tx_data[0] =  SPI_FLASH_READ;
    tx_data[1] =  SPI_FLASH_ADDR_MSB1;
    tx_data[2] =  SPI_FLASH_ADDR_MSB0;
    tx_data[3] =  SPI_FLASH_ADDR_LSB;

    /* Reset the data in the tx buffer */
    for (index = 4; index < 260; index++)
    {
        tx_data[index] =  0;
    }

    len = index;
    SPIDat1Config(SOC_SPI_1_REGS, (SPI_CSHOLD | SPI_DATA_FORMAT0), 0x1);
    SpiTransfer();
}

/* 
** Verfies the data written to flash and read from the flash of same address 
**
*/
static void VerifyData(void)
{
    unsigned int index;

    for(index = 4; index < 260; index++)
    { 
        if(vrf_data[index] != rx_data[index])
        {
            UARTPuts("\r\n", -1);
            UARTPuts("VerifyData: Comparing the data written to and read", -1);
            UARTPuts(" from Flash.\r\nThe two data blocks are unequal.", -1);
            UARTPuts(" Mismatch found at index ", -1);
            UARTPutNum((int)index - 3);
            UARTPuts("\r\n", -1);
            break;
        }
    }

    if (index == 260)
    {
        UARTPuts("\r\nThe data in the Flash and the one written ", -1);
        UARTPuts("to it are equal.\r\n", -1);
    }

}

/*
** Configures ARM interrupt controller to generate SPI interrupt
**
*/
static void SetUpInt(void)
{
   /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

   /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_SPINT1, SPIIsr);

    /* Set the channnel number 2 of AINTC for system interrupt 56.
     * Channel 2 is mapped to IRQ interrupt of ARM9.
     */
    IntChannelSet(SYS_INT_SPINT1, 2);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_SPINT1);

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

/*
** Configures SPI Controller
**
*/
static void SetUpSPI(void)
{
    unsigned char cs  = 0x01;
    unsigned char dcs = 0x01;
    unsigned int  val = SIMO_SOMI_CLK_CS;
    
    SPIReset(SOC_SPI_1_REGS);

    SPIOutOfReset(SOC_SPI_1_REGS);

    SPIModeConfigure(SOC_SPI_1_REGS, SPI_MASTER_MODE);

    SPIClkConfigure(SOC_SPI_1_REGS, 150000000, 20000000, SPI_DATA_FORMAT0);

    SPIPinControl(SOC_SPI_1_REGS, 0, 0, &val);

    SPIDefaultCSSet(SOC_SPI_1_REGS, dcs);

    /* Configures SPI Data Format Register */
    SPIConfigDataFmtReg(SPI_DATA_FORMAT0);
  
     /* Selects the SPI Data format register to used and Sets CSHOLD 
      * to assert CS pin(line)  
      */
    SPIDat1Config(SOC_SPI_1_REGS, (SPI_CSHOLD | SPI_DATA_FORMAT0), cs);

     /* map interrupts to interrupt line INT1 */
    SPIIntLevelSet(SOC_SPI_1_REGS, SPI_RECV_INTLVL | SPI_TRANSMIT_INTLVL);
    
    /* Enable SPI communication */
    SPIEnable(SOC_SPI_1_REGS);
}
/*
** Configures Data Format register of SPI
**
*/
static void SPIConfigDataFmtReg(unsigned long dataFormat)
{
    /* Configures the polarity and phase of SPI clock */
    SPIConfigClkFormat(SOC_SPI_1_REGS,
                       (SPI_CLK_POL_HIGH | SPI_CLK_INPHASE),
                       dataFormat);

    /* Configures SPI to transmit MSB bit First during data transfer */
    SPIShiftMsbFirst(SOC_SPI_1_REGS, dataFormat);

    /* Sets the Charcter length */
    SPICharLengthSet(SOC_SPI_1_REGS, CHAR_LENGTH, dataFormat);
}

/*
** Enables SPI Transmit and Receive interrupt.
** Deasserts Chip Select line.
*/
static void  SpiTransfer(void)
{
    p_tx = &tx_data[0];
    p_rx = &rx_data[0];
    SPIIntEnable(SOC_SPI_1_REGS, (SPI_RECV_INT | SPI_TRANSMIT_INT));
    while(flag);
    flag = 1;
    /* Deasserts the CS pin(line) */
    SPIDat1Config(SOC_SPI_1_REGS, SPI_DATA_FORMAT0, 0x1);
}

/*
** Data transmission and receiption SPIIsr
**
*/
void SPIIsr(void)
{
    unsigned long intCode = 0;

    IntSystemStatusClear(56);

    intCode = SPIInterruptVectorGet(SOC_SPI_1_REGS);

    while (intCode)
    {
        if(intCode == SPI_TX_BUF_EMPTY)
        {
            len--;
            SPITransmitData1(SOC_SPI_1_REGS, *p_tx);
            p_tx++;
            if (!len)
            {
                SPIIntDisable(SOC_SPI_1_REGS, SPI_TRANSMIT_INT);
            }
        }

        if(intCode == SPI_RECV_FULL)
        {
            *p_rx = (char)SPIDataReceive(SOC_SPI_1_REGS);
            p_rx++;
            if (!len)
            {
                flag = 0;
                SPIIntDisable(SOC_SPI_1_REGS, SPI_RECV_INT);
            }
        }

        intCode = SPIInterruptVectorGet(SOC_SPI_1_REGS);
    }
}

/******************************* End of file *********************************/
