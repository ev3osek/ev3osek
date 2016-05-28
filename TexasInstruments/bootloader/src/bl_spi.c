/**
 * \file  bl_spi.c
 *
 * \brief Spi Initialization functions.  And a funciton to copy data from Flash
 *        to the given address.
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

#include "bl.h"
#include "bl_platform.h"

#include "bl_spi.h"

 
/******************************************************************************
**                     Macro Defination 
*******************************************************************************/

/* value to configure SMIO,SOMI,CLK and CS pin as functional pin */
#define SIMO_SOMI_CLK_CS        0x00000E01
#define CHAR_LENGTH             0x8

/* flash data read command */
#define SPI_FLASH_READ          0x03

/******************************************************************************
**                    Local  Declaration 
*******************************************************************************/
static void SPIConfigDataFmtReg(unsigned int dataFormat);
static void SpiTransfer(unsigned char *p_tx,
                         unsigned char *p_rx,
                         unsigned int len);
/*
* \brief - SPI Configures.
* \param - none.
*
* \return  none.
*/
void BL_SPI_Configure(void)
{
    unsigned int val;

    SPIReset(SPI_BASE);

    SPIOutOfReset(SPI_BASE);

    SPIModeConfigure(SPI_BASE, SPI_MASTER_MODE);

    SPIClkConfigure(SPI_BASE, SPI_INPUT_FREQ, SPI_SCLK_FREQ,
					      SPI_DATA_FORMAT0);

    val = SIMO_SOMI_CLK_CS;
    SPIPinControl(SPI_BASE, 0, 0, &val);

    SPIDefaultCSSet(SPI_BASE, SPI_CS_INACTIVE_STATE);

    /* Configures SPI Data Format Register */
    SPIConfigDataFmtReg(SPI_DATA_FORMAT0);

    /* Selects the SPI Data format register to used and Sets CSHOLD
     * to assert CS pin(line)
     */
    SPIDat1Config(SPI_BASE, (SPI_CSHOLD | SPI_DATA_FORMAT0), SPI_CS);

    /* Enable SPI communication */
    SPIEnable(SPI_BASE);
} 

/*
* \brief - Reads bytes from SPI Flash.
* \param - dataFormat - The data format that needs to configured
*
* \return none
*/

static void SPIConfigDataFmtReg(unsigned int dataFormat)
{
    /* Configures the polarity and phase of SPI clock */
    SPIConfigClkFormat(SPI_BASE, (SPI_CLK_POL_HIGH | SPI_CLK_INPHASE),
                       dataFormat);

    /* Configures SPI to transmit MSB bit First during data transfer */
    SPIShiftMsbFirst(SPI_BASE, dataFormat);

    /* Sets the Charcter length */
    SPICharLengthSet(SPI_BASE, CHAR_LENGTH, dataFormat);
}

/*
* \brief - Reads bytes from SPI Flash.
* \param - flashAddr - SPI Flash address.\n.
* \param - size - Indicates the total size needs to be read from flash.\n.
* \param - destAddr - Destination address where data needs to be copy.\n.
*
* \return none
*/
void BL_SPI_ReadFlash ( unsigned int flashAddr,
                        unsigned int size, 
                        unsigned char *destAddr)
{
    unsigned char tx_data;
    unsigned char rx_data;
    unsigned char addr[3];
    unsigned int len;

    /* The process of reading the data from the flash involves asserting
     * proper chipselect line, asserting CSHOLD, selecting correct data format.
     * Then the flash needs a command to indicate start of read and then
     * any number of bytes can be read. After the required number of bytes
     * are read, the CS needs to be de-asserted to indicate the end of transfer
     */
    SPIDat1Config(SPI_BASE, (SPI_CSHOLD | SPI_DATA_FORMAT0), 0x1);

    /* Send read command to the flash (one byte) */
    tx_data =  SPI_FLASH_READ;
    SpiTransfer(&tx_data, &rx_data, 1);

    /* Send the address to start reading from (3 bytes) */
    addr[0] = (unsigned char)(flashAddr >> 16);
    addr[1] = (unsigned char)(flashAddr >> 8);
    addr[2] = (unsigned char)flashAddr;
    len = 0;

    while (len < sizeof(addr))
    {
        SpiTransfer(&addr[len], &rx_data, 1);
        len++;
    }

    /* Read all the bytes */
    len = 0;

    while(len < size)
    {
        SpiTransfer(&tx_data, destAddr, 1);
        destAddr++;
        len++;
    }

    /* De-assert chip select line at the end of transfer */
    SPIDat1Config(SPI_BASE, SPI_DATA_FORMAT0, 0x1);
}

/**
* \brief - Spi Write and Read.
* \param - p_tx - SPI transmit data address.\n.
* \param - p_rx - SPI data reception address.\n.
* \param - len - Indicates the total length the read and write has to do.\n.
*
* \return none
**/

static void  SpiTransfer(unsigned char *p_tx, unsigned char *p_rx,
                         unsigned int len)
{
	int i;

	for (i = 0; i < len; i++)
	{
		while (!SPIIntStatus(SPI_BASE, SPI_TRANSMIT_INT));
		SPITransmitData1(SPI_BASE, p_tx[i]);

		while (!SPIIntStatus(SPI_BASE, SPI_RECV_INT));
		p_rx[i] = SPIDataReceive(SPI_BASE);
	}
}

/******************************************************************************
**                              END OF FILE
*******************************************************************************/
