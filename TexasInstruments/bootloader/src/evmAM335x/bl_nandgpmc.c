/**
 *  \file   bl_nandgpmc.c
 *
 *  \brief  Bootloader NAND access code using GPMC.
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

#include "hw_gpmc.h"
#include "hw_types.h"
#include "gpmc.h"
#include "nandlib.h"
#include "nand_gpmc.h"
#include "bl_config.h"

/*******************************************************************************
*                       INTERNAL MACRO DEFINITIONS
*******************************************************************************/

/******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/

/**
* \brief  Function to initalize the GPMC NAND timing and base addr info.
*
* \param  nandTimimgInfo : Pointer to structure containing 
*                                         NAND timing info. 
*
* \return none.
*/

void GPMCNANDTimingInfoInit(void *TimingInfo)
{
    GPMCNANDTimingAndBaseAddrInfo *nandTimingInfo;
    nandTimingInfo = (GPMCNANDTimingAndBaseAddrInfo * )TimingInfo;

    nandTimingInfo->CSWrOffTime = NAND_CSWROFFTIME;
    nandTimingInfo->CSRdOffTime = NAND_CSRDOFFTIME;
    nandTimingInfo->CSExtDelayFlag = GPMC_CS_EXTRA_NODELAY;
    nandTimingInfo->CSOnTime = NAND_CSONTIME;

    nandTimingInfo->ADVAADMuxWrOffTime = NAND_ADVAADMUXWROFFTIME;
    nandTimingInfo->ADVAADMuxRdOffTime = NAND_ADVAADMUXRDOFFTIME;
    nandTimingInfo->ADVWrOffTime = NAND_ADVWROFFTIME;
    nandTimingInfo->ADVRdOffTime = NAND_ADVRDOFFTIME;
    nandTimingInfo->ADVExtDelayFlag = GPMC_ADV_EXTRA_NODELAY;
    nandTimingInfo->ADVAADMuxOnTime = NAND_ADVAADMUXONTIME;
    nandTimingInfo->ADVOnTime = NAND_ADVONTIME;

    nandTimingInfo->WEOffTime = NAND_WEOFFTIME;
    nandTimingInfo->WEExtDelayFlag = GPMC_WE_EXTRA_NODELAY;
    nandTimingInfo->WEOnTime = NAND_WEONTIME;
    nandTimingInfo->OEAADMuxOffTime = NAND_OEAADMUXOFFTIME;
    nandTimingInfo->OEOffTime = NAND_OEOFFTIME;
    nandTimingInfo->OEExtDelayFlag = GPMC_OE_EXTRA_NODELAY;
    nandTimingInfo->OEAADMuxOnTime = NAND_OEAADMUXONTIME;
    nandTimingInfo->OEOnTime = NAND_OEONTIME;

    nandTimingInfo->rdCycleTime = NAND_RDCYCLETIME;
    nandTimingInfo->wrCycleTime = NAND_WRCYCLETIME;
    nandTimingInfo->rdAccessTime = NAND_RDACCESSTIME;
    nandTimingInfo->pageBurstAccessTime = NAND_PAGEBURSTACCESSTIME;

    nandTimingInfo->cycle2CycleDelay = NAND_CYCLE2CYCLEDELAY;
    nandTimingInfo->cycle2CycleDelaySameCSCfg = NAND_CYCLE2CYCLESAMECSEN;
    nandTimingInfo->cycle2CycleDelayDiffCSCfg = NAND_CYCLE2CYCLEDIFFCSEN;
    nandTimingInfo->busTAtime = NAND_BUSTURNAROUND;
}

/**
* \brief  Function to initialize the NAND device info.
*         This function initializes the NAND device  related information.
*         depeding on chip select.
*
* \param  nandDevInfo   : Pointer to device info structure where device info 
*                         has to get.
*
* \param  csNum         : Chip select where device is interfaced.
*
* \return none.
*/
void NANDDevInfoInit( NANDDevInfo *nandDevInfo, unsigned int csNum)
{
    switch(csNum)
    {
        case GPMC_CHIP_SELECT_0 :
             nandDevInfo->busWidth      = NAND_BUS_WIDTH;
             nandDevInfo->devId         = NAND_DEVICE_ID;
             nandDevInfo->eccType       = NAND_ECC_ALGO;
             nandDevInfo->eccOffSet     = NAND_ECC_OFFSET;
             nandDevInfo->eccByteCnt    = NAND_ECC_BYTECNT;
             nandDevInfo->dataRegAddr   = NAND_DATA_REG;
             nandDevInfo->addrRegAddr   = NAND_ADDR_REG;
             nandDevInfo->cmdRegAddr    = NAND_CMD_REG;
             nandDevInfo->waitPin       = NAND_WAITPIN;
             nandDevInfo->waitPinPol    = NAND_WAITPIN_POL;
             nandDevInfo->wpPinPol      = NAND_WPPIN_POL;
             nandDevInfo->chipSelect    = csNum;
             nandDevInfo->csBaseAddr    = NAND_CSBASEADDR;
             nandDevInfo->csRegionSize  = NAND_CSREGIONSIZE;
        break;
        default :
        break;
    }
}

/**
* \brief  Function to get/initialize the controller info.
*         This function initializes the controller related information
*         depeding on chip select passed.

* \param  nandInfo      : Pointer to structure containing controller and 
*                         device information.
*
* \param  csNum         : Chip select where device is interfaced.
*
* \return none.
*/

void NANDCtrlInfoInit(NandInfo_t *nandInfo, unsigned int cs)
{

    nandInfo->nandCtrlInfo.curCS        = cs;
    nandInfo->nandCtrlInfo.baseAddr     = NAND_CTRLBASEADDR;
    nandInfo->nandCtrlInfo.elmBaseAddr  = NAND_ELMBASEADDR;
    nandInfo->nandCtrlInfo.eccSupported = NAND_ECCSUPPORTED;
    nandInfo->nandCtrlInfo.opMode       = NAND_OPMODE;

    nandInfo->TimingInfoInit            = GPMCNANDTimingInfoInit;
    nandInfo->CtrlInit                  = GPMCNANDInit;
    nandInfo->WaitPinStatusGet          = GPMCNANDWaitPinStatusGet;
    nandInfo->ECCInit                   = GPMCNANDECCInit;
    nandInfo->ECCEnable                 = GPMCNANDECCEnable;
    nandInfo->ECCDisable                = GPMCNANDECCDisable;
    nandInfo->ECCWriteSet               = GPMCNANDECCWriteSet;
    nandInfo->ECCReadSet                = GPMCNANDECCReadSet;
    nandInfo->ECCCalculate              = GPMCNANDECCCalculate;
    nandInfo->ECCCheckAndCorrect        = GPMCNANDECCCheckAndCorrect;
    /* Used polled mode in Bootloader */
    nandInfo->DMAInit                   = NULL;
    nandInfo->DMAXfer                   = NULL;
    nandInfo->DMAXferSetup              = NULL;
    nandInfo->DMAXferStatusGet          = NULL;
}

/**
* \brief  Function to initialize the device and controller info.
*
* \param  nandInfo      : Pointer to structure containing controller and 
*                         device information.
*
* \param  csNum         : Chip select where device is interfaced.
*
* \return none.
*/
void NANDInfoInit(NandInfo_t *nandInfo, unsigned int cs)
{
    unsigned int i;
    NANDCtrlInfoInit(nandInfo, cs);
    for(i = 0; i < NAND_MAX_NAND_DEVICES; i++)
        if(nandInfo->nandDevInfo[i].chipSelect == -1)
        {
            NANDDevInfoInit(&(nandInfo->nandDevInfo[i]), cs);
            break;
        }
}

/**
* \brief  Function to get the Chipselect used by the NAND.
*
* \return Chip select of the NAND.
*
*/
unsigned int NANDCSGet()
{
    return(NAND_CHIPSELECT);
}

