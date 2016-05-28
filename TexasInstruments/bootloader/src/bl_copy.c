/**
 * \file  bl_copy.c
 *
 * \brief Initializes the Spi. Copies the application from SPI flash to DDR.
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


#include "uartStdio.h"

#include "bl.h"

#if defined(SPI)
    #include "bl_spi.h"
#elif defined(MMCSD)
    //#include "bl_mmcsd.h"
#elif defined(NAND)
    #include "bl_nand.h"    
#endif

#include "bl_platform.h"

#include "bl_copy.h"


/******************************************************************************
**                          Extern Declarations 
*******************************************************************************/


/******************************************************************************
**                     Local Function Declarations 
*******************************************************************************/
#if defined(SPI)
    static unsigned int SPIBootCopy(void);
#elif defined(MMCSD)
    static unsigned int MMCSDBootCopy(void);
    extern int HSMMCSDInit(void);
    extern unsigned int HSMMCSDImageCopy(void);
#elif defined(NAND)
    static unsigned int NANDBootCopy(void);
#else
    #error Unsupported boot mode !!
#endif


/******************************************************************************
**                      Global Variable Declarations 
*******************************************************************************/


/******************************************************************************
**                       Global Function Definitions 
*******************************************************************************/
/*
 * \brief This function copies Image 
 *
 * \param  none
 *
 * \return none 
*/
void ImageCopy(void)
{
#if defined(SPI)
    if (SPIBootCopy( ) != E_PASS)
        BootAbort();
#elif defined(MMCSD)

    MMCSDBootCopy();
#elif defined(NAND)
    if (NANDBootCopy() != E_PASS)
        BootAbort();
#else
    #error Unsupported boot mode !!
#endif
}


/******************************************************************************
**                       Local Function Definitions 
*******************************************************************************/

/*
 * \brief This function Initializes and configures SPI and copies 
 *                                           data from SPI FLASH 
 *
 * \param  none
 *
 * \return unsigned int: Status (Success or Failure) 
*/
#ifdef SPI
static unsigned int SPIBootCopy(void)
{
    /* SPI Initialization */ 
    BL_PLATFORFM_SPISetup();  
    BL_SPI_Configure();
   
    UARTPuts("Copying application image from SPI to RAM\r\n", -1);

#if defined(am1808) || defined(omapl138) || defined(c6748)
    {
        BL_SPI_Header header;
 
        /* Spi read function to read the header */
        BL_SPI_ReadFlash(IMAGE_OFFSET, sizeof(header), (unsigned char*)&header); 
        
        if ((header.magicNum != MAGIC_NUM_SF) && 
            (header.magicNum != MAGIC_NUM_GF))
        {
            UARTPuts("Invalid Image Found \r\n", -1);
            UARTPuts("Aborting Boot\r\n", -1);
            BootAbort();
        }
       
        /* Copies application from SPI flash to DDR RAM */
        BL_SPI_ReadFlash( header.memAddress, 
                          header.appSize,
                          (unsigned char *)(header.ldAddress) );

        entryPoint = (unsigned int) header.ldAddress;
    }
#elif (defined am335x_15x15) || (defined am335x_13x13)
    {
        ti_header header;

        /* Spi read function to read the header */
        BL_SPI_ReadFlash(IMAGE_OFFSET, sizeof(header), (unsigned char *)&header);

        /* Copies application from SPI flash to DDR RAM */        
        BL_SPI_ReadFlash( IMAGE_OFFSET + 8, 
                          header.image_size,
                          (unsigned char *)(header.load_addr) );
                      
        entryPoint = (unsigned int)header.load_addr;
    }
#endif
    return E_PASS;
}
#endif

#ifdef MMCSD
static unsigned int MMCSDBootCopy(void)
{
#if  (defined am335x_15x15) || (defined am335x_13x13)
    HSMMCSDInit();
    HSMMCSDImageCopy();
#endif
    return E_PASS;
}
#endif

/*
 * \brief This function Initializes and configures NAND and copies
 *        data from NAND
 *
 * \param  none
 *
 * \return unsigned int: Status (Success or Failure)
*/
#ifdef NAND
static unsigned int NANDBootCopy(void)
{
    NandInfo_t *hNandInfo;

    /* Platform/Device specific NAND setup */
    BL_PLATFORM_NANDSetup();
    
    /* Open NAND device (uses platform specific functions) */
    hNandInfo = BL_NAND_Configure();

    UARTPuts("Copying application image from NAND to RAM\r\n", -1);

#if defined(am1808) || defined(omapl138) || defined(c6748)
    {
        BL_NAND_Header nandBootHeader;
        unsigned int size, offset;
        unsigned char *loadAddr;
               
        /* Read the flash image header */
        BL_NAND_ReadFlash(hNandInfo, IMAGE_OFFSET, sizeof(nandBootHeader),(unsigned char*)&nandBootHeader);
        
        if ((nandBootHeader.magicNum != MAGIC_NUM_SF) && 
            (nandBootHeader.magicNum != MAGIC_NUM_GF))
        {
            UARTPuts("Invalid Image Found \r\n", -1);
            UARTPuts("Aborting Boot\r\n", -1);
            BootAbort();
        }
        
        offset = nandBootHeader.block * hNandInfo->blkSize + nandBootHeader.page * hNandInfo->pageSize;
        size = nandBootHeader.numPage * hNandInfo->pageSize;
        loadAddr = (unsigned char *)nandBootHeader.ldAddress;
        
        /* Read the flash image data */
        BL_NAND_ReadFlash(hNandInfo, offset, size, loadAddr);

        /* Set the image entrypoint */
        entryPoint = nandBootHeader.entryPoint;
    }
#elif (defined am335x_15x15) || (defined am335x_13x13)
    {
        ti_header header;

        /* Spi read function to read the header */
        BL_NAND_ReadFlash(hNandInfo, IMAGE_OFFSET, sizeof(header), (unsigned char *)&header);

        /* Copies application from SPI flash to DDR RAM */        
        BL_NAND_ReadFlash( hNandInfo,
                           IMAGE_OFFSET + sizeof(header), 
                           header.image_size,
                           (unsigned char *)(header.load_addr) );
                      
        entryPoint = (unsigned int)header.load_addr;
    }
#endif
    
    return E_PASS;
}
#endif

/******************************************************************************
**                              END OF FILE
*******************************************************************************/

