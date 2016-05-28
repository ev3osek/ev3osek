/**
 * \file bl_platform.h
 *
 * \brief This file exports the APIs used for configuring devices
 *        required during boot
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
 

#ifndef _BL_PLATFORM_H__
#define _BL_PLATFORM_H__

#include "soc_C6748.h"


#if defined(SPI)
#elif defined(MMCSD)
#elif defined(NAND)
  #include "nandlib.h"
#endif


/******************************************************************************
**                        Macro Definitions 
*******************************************************************************/

#define ARM_300MHZ
#define DDR_132MHZ

#ifdef DDR_132MHZ
  /* Fix DDR timing values/refresh rates */
  #define DDR2_SDTIMR1               0x1C912A08
  #define DDR2_SDTIMR2               0x3811C700
  #define DDR2_SDRCR                 0xC0000459
  #define DDR2_SDRCR_CLEAR           0xC0000000
  #define DDR2_SDCR                  0x0A03C622
  #define VTPIO_CTL_HIGH             0x00080000
#else
  #error Only 132Mhz support is given for DDR
#endif

#ifdef ARM_300MHZ
 /* Fixing PLL0 register values */
 #define PLL_CLK_SRC             0
 #define PLL0_MUL                24
 #define PLL0_PREDIV             0
 #define PLL0_POSTDIV            1
 #define PLL0_DIV1               0
 #define PLL0_DIV3               2
 #define PLL0_DIV7               5

 /* Fixing PLL1 register values */
 #define PLL1_MUL                21
 #define PLL1_POSTDIV            1
 #define PLL1_DIV1               0
 #define PLL1_DIV2               1
 #define PLL1_DIV3               2
#else
    #error Unsupported frequency !!
#endif

#define UART_BASE                SOC_UART_2_REGS


#if defined(SPI)
  /* Fix the offset, where the boot image lies in the flash */
  #define IMAGE_OFFSET             64*1024

  #define SPI_INPUT_FREQ           (150000000)
  #define SPI_SCLK_FREQ             (20000000)

  #define SPI_BASE                 SOC_SPI_1_REGS
  #define SPI_CS                   0x01
  #define SPI_CS_INACTIVE_STATE    0x01

#elif defined (MMCSD)

#elif defined(NAND)

    /* Default image location is based on sfh tool and is page 0 of block 6 */
    #define IMAGE_OFFSET                   (6*NAND_BLOCKSIZE_128KB)

    /*****************************************************************************/
    /*
    ** Macros which defines attached device info like num of pages per block, 
    ** number of blocks, device ID and manufacturer ID.
    **
    */
    #define NAND_DATA_XFER_MODE                     (NAND_XFER_MODE_CPU)
    #define NAND_BUSWIDTH                           (NAND_BUSWIDTH_8BIT)
    #define NAND_CHIP_SELECT                        (EMIFA_CHIP_SELECT_3)
    #define NAND_PAGE_SIZE_IN_BYTES                 (NAND_PAGESIZE_2048BYTES)
    #define NAND_BLOCK_SIZE_IN_BYTES                (NAND_BLOCKSIZE_128KB)
    #define NAND_NUMOF_BLK                          (4096)
    #define NAND_MANUFATURER_MICRON_ID              (0x2C)
    #define NAND_DEVICE_ID                          (0xDC)

    /*****************************************************************************/
    /*
    ** Macros which defines the NAND timing info.
    **
    */
    /* Maximum extended wait time                                       */
    #define NAND_MAX_EXT_WAIT                       (0xFF)

    /* Setup,strobe,hold times for read/write for the dev MT29F4G08AAA  */
    #define NAND_WRITE_SETUP_TIME_IN_NS             (0u)
    #define NAND_WRITE_STROBE_TIME_IN_NS            (30u)
    #define NAND_WRITE_HOLD_TIME_IN_NS              (30u)
    #define NAND_READ_SETUP_TIME_IN_NS              (20u)
    #define NAND_READ_STROBE_TIME_IN_NS             (40u)
    #define NAND_READ_HOLD_TIME_IN_NS               (0u)
    #define NAND_TURN_ARND_TIME_IN_NS               (0u)

    /* Setup,strobe,hold times reset values                             */
    #define EMIFA_WRITE_SETUP_RESETVAL              (0x0F)
    #define EMIFA_WRITE_STROBE_RESETVAL             (0x3F)
    #define EMIFA_WRITE_HOLD_RESETVAL               (0x07)
    #define EMIFA_READ_SETUP_RESETVAL               (0x0F)
    #define EMIFA_READ_STROBE_RESETVAL              (0x3F)
    #define EMIFA_READ_HOLD_RESETVAL                (0x07)
    #define EMIFA_TA_RESETVAL                       (0x03)

    /* NAND Module clk frequency                                        */
    #define NAND_MODULE_CLK                         ((100u)*(1000u)*(1000u))
    #define NAND_MODULE_CLK_IN_MHZ                  (NAND_MODULE_CLK / 1000000)
#endif

/******************************************************************************
**                    External Function Declararions 
*******************************************************************************/

extern void BL_PLATFORM_Config(void);
extern void BL_PLATFORM_ConfigPostBoot(void);

#if defined(SPI)
    extern void BL_PLATFORM_SPISetup(void);
#elif defined(MMCSD)

#elif defined(NAND)
    extern void BL_PLATFORM_NANDSetup(void);
    extern void BL_PLATFORM_NANDInfoInit(NandInfo_t *nandInfo);
#endif

#endif /* _BL_PLATFORM_H__ */

