/**
 * \file bl_am335x_13x13.h
 *
 * \brief Setting values to the macros depending on 
 *        Operating frequencies and DDR frequenc
 *        for 13x13 Soc.
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

#ifndef __AM335X__H__
#define __AM335X__H__

/******************************************************************************
**                 Configuration Options for Boot Loader
*******************************************************************************/

/* Set of config parameters for AM335x */

    /* Fix the offset, where the boot image lies in the flash */
    /* TODO : Verify size */
#if defined(SPI)

    #define IMAGE_OFFSET                   128 * 1024 /* Will start from 3rd block */
    #define SPI_CHAN                       0x0
    #define SPI_BASE                       SOC_SPI_0_REGS

#elif defined(NAND)

    #define IMAGE_OFFSET                   512 * 1024 /* Will start from 3rd block */
    /* NAND related */
    #define NAND_CTRLBASEADDR              (SOC_GPMC_0_REGS)
    #define NAND_ELMBASEADDR               (SOC_ELM_0_REGS)
    #define NAND_CHIPSELECT                (0)
    #define NAND_BUS_WIDTH                 (NAND_BUSWIDTH_8BIT)
    #define NAND_DEVICE_ID                 (0xDA)
    #define NAND_WAITPIN                   (GPMC_WAIT_PIN0)
    #define NAND_WAITPIN_POL               (GPMC_WAIT_PIN_POLARITY_LOW)
    #define NAND_WPPIN_POL                 (GPMC_WP_PIN_LEVEL_HIGH)
    #define NAND_OPMODE                    (NAND_XFER_MODE_CPU)
    #define NAND_DATA_REG                  (SOC_GPMC_0_REGS + \
                                           GPMC_NAND_DATA(NAND_CHIPSELECT));
    #define NAND_ADDR_REG                  (SOC_GPMC_0_REGS + \
                                           GPMC_NAND_ADDRESS(NAND_CHIPSELECT));
    #define NAND_CMD_REG                   (SOC_GPMC_0_REGS + \
                                           GPMC_NAND_COMMAND(NAND_CHIPSELECT));
    #define NAND_ECCSUPPORTED              (NAND_ECC_ALGO_HAMMING_1BIT | \
                                           NAND_ECC_ALGO_BCH_4BIT | \
                                           NAND_ECC_ALGO_BCH_8BIT | \
                                           NAND_ECC_ALGO_BCH_16BIT );
    #define NAND_ECC_ALGO                  NAND_ECC_ALGO_BCH_8BIT
    #define NAND_ECC_OFFSET                (NAND_ECC_BCH_8BIT_OOB_OFFSET)
    #define NAND_ECC_BYTECNT               (NAND_ECC_BCH_8BIT_BYTECNT)
    #define NAND_CSBASEADDR                (0x10000000)
    #define NAND_CSREGIONSIZE              (GPMC_CS_SIZE_256MB)

    /* NAND timing values */
    #define NAND_CSWROFFTIME               (30)
    #define NAND_CSRDOFFTIME               (31)
    #define NAND_CSONTIME                  (0)

    #define NAND_ADVONTIME                 (0)
    #define NAND_ADVAADMUXONTIME           (0)
    #define NAND_ADVRDOFFTIME              (31)
    #define NAND_ADVWROFFTIME              (31)
    #define NAND_ADVAADMUXRDOFFTIME        (0)
    #define NAND_ADVAADMUXWROFFTIME        (0)

    #define NAND_WEOFFTIME                 (22)
    #define NAND_WEONTIME                  (5)
    #define NAND_OEAADMUXOFFTIME           (0)
    #define NAND_OEOFFTIME                 (28)
    #define NAND_OEAADMUXONTIME            (0)
    #define NAND_OEONTIME                  (4)

    #define NAND_RDCYCLETIME               (31)
    #define NAND_WRCYCLETIME               (31)
    #define NAND_RDACCESSTIME              (28)
    #define NAND_PAGEBURSTACCESSTIME       (0)

    #define NAND_BUSTURNAROUND             (0)
    #define NAND_CYCLE2CYCLEDIFFCSEN       (0)
    #define NAND_CYCLE2CYCLESAMECSEN       (1)
    #define NAND_CYCLE2CYCLEDELAY          (0)
    #define NAND_WRDATAONADMUXBUS          (15)
    #define NAND_WRACCESSTIME              (22)

#elif defined(MMCSD)

    #define MMCSD_BASE               SOC_MMCHS_0_REGS
    #define MMCSD_DMA_BASE           SOC_EDMA30CC_0_REGS

    #define MMCSD_IN_FREQ            96000000 /* 96MHz */
    #define MMCSD_INIT_FREQ          400000   /* 400kHz */

    #define MMCSD_DMA_CHA_TX         24
    #define MMCSD_DMA_CHA_RX         25
    #define MMCSD_DMA_QUE_NUM        0
    #define MMCSD_DMA_REGION_NUM     0
    #define MMCSD_BLK_SIZE           512
    #define MMCSD_OCR                (SD_OCR_VDD_3P0_3P1 | SD_OCR_VDD_3P1_3P2)

#endif

    #define IMAGE_SIZE               50 * 1024 /* Max size */
    #define DDR_START_ADDR           0x80000000

    #define UART_BASE                SOC_UART_0_REGS


    #define  MPUPLL_M_720    720
#endif

