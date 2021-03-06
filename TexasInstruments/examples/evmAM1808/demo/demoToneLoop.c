/**
 * \file  DemoToneLoop.c
 * 
 * \brief Functions for looping a tone infinitely. The tone shall be given in raw
 *        data format. 
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

#include "interrupt.h"
#include "edma_event.h"
#include "soc_AM1808.h"
#include "hw_syscfg0_AM1808.h"
#include "evmAM1808.h"
#include "demoAic31.h"
#include "mcasp.h"
#include "edma.h"
#include "psc.h"
#include "toneRaw.h"
#include "demoCfg.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
******************************************************************************/
#define I2S_SLOTS_L_R                 (0x03u)

/* Definitions for sample tone */
#define TONE_START_ADDR               ((unsigned int)toneRaw)
#define TONE_NUM_BYTES                (sizeof(toneRaw))
#define TONE_END_ADDR                 (TONE_START_ADDR + TONE_NUM_BYTES - 1) 
#define PARAM1_NUM_SAMPLES_L          ((unsigned int)(TONE_NUM_BYTES  \
                                       / (TONE_WORD_SIZE >> 3)))
#define PARAM1_BCNT                   (65000)
#define PARAM1_CCNT                   ((unsigned int) \
                                       (PARAM1_NUM_SAMPLES_L / PARAM1_BCNT))
#define PARAM2_START_ADDR             (TONE_START_ADDR + (PARAM1_CCNT * \
                                       (TONE_WORD_SIZE >> 3) * PARAM1_BCNT))
#define PARAM2_BCNT                   (((TONE_END_ADDR - PARAM2_START_ADDR) \
                                        / (TONE_WORD_SIZE >> 3)) + 1)
#define PARAM1_INTCODE                (0)
#define PARAM2_INTCODE                (1)

/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
******************************************************************************/
static void McASPI2STwoChanConfig(void);

/******************************************************************************
**                      INTERNAL CONSTANT DEFINITIONS
******************************************************************************/
static struct EDMA3CCPaRAMEntry dmaPar[3] = {
       {
           (unsigned int)(EDMA3CC_OPT_DAM  | (0x02 << 8u)),
           (unsigned int)TONE_START_ADDR,
           (unsigned short)(TONE_WORD_SIZE >> 3),
           (unsigned short)PARAM1_BCNT,
           (unsigned int) SOC_MCASP_0_DATA_REGS,
           (short) (TONE_WORD_SIZE >> 3),
           (short)0x00,
           (unsigned short)(32u * 40u),
           (unsigned short)PARAM1_BCNT,
           (short)(TONE_WORD_SIZE >> 3),
           (short)0x00,
           (unsigned short)PARAM1_CCNT
       },
       {
           (unsigned int)(EDMA3CC_OPT_DAM  | (0x02 << 8u)),
           (unsigned int)(PARAM2_START_ADDR),
           (unsigned short)(TONE_WORD_SIZE >> 3),
           0,
           (unsigned int) SOC_MCASP_0_DATA_REGS,
           (short)(TONE_WORD_SIZE >> 3),
           (short)0x00,
           (unsigned short)(32u * 41u),
           (unsigned short)0,
           (short)0x00,
           (short)0x00,
           (unsigned short)(1u)
       },
       {
           (unsigned int)(EDMA3CC_OPT_DAM  | (0x02 << 8u)),
           (unsigned int)TONE_START_ADDR,
           (unsigned short)(TONE_WORD_SIZE >> 3),
           (unsigned short)PARAM1_BCNT,
           (unsigned int) SOC_MCASP_0_DATA_REGS,
           (short) (TONE_WORD_SIZE >> 3),
           (short)0x00,
           (unsigned short)(32u * 40u),
           (unsigned short)PARAM1_BCNT,
           (short)(TONE_WORD_SIZE >> 3),
           (short)0x00,
           (unsigned short)PARAM1_CCNT
       }
};

/******************************************************************************
**                          FUNCTION DEFINITIONS
******************************************************************************/
/*
** Configures the McASP Transmit Section for 2 channels in I2S mode.
*/
static void McASPI2STwoChanConfig(void)
{
    McASPTxReset(SOC_MCASP_0_CTRL_REGS);

    /* Enable the FIFOs for DMA transfer */
    McASPWriteFifoEnable(SOC_MCASP_0_FIFO_REGS, 1, 1);

    /* Set I2S format in the transmitter/receiver format units */
    McASPTxFmtI2SSet(SOC_MCASP_0_CTRL_REGS, TONE_WORD_SIZE, TONE_SLOT_SIZE,
                     MCASP_TX_MODE_DMA);

    McASPTxFrameSyncCfg(SOC_MCASP_0_CTRL_REGS, 2, MCASP_TX_FS_WIDTH_WORD, 
                        MCASP_TX_FS_EXT_BEGIN_ON_RIS_EDGE);

    /* configure the clock for transmitter */
    McASPTxClkCfg(SOC_MCASP_0_CTRL_REGS, MCASP_TX_CLK_EXTERNAL, 0, 0);
    McASPTxClkPolaritySet(SOC_MCASP_0_CTRL_REGS, MCASP_TX_CLK_POL_FALL_EDGE); 
    McASPTxClkCheckConfig(SOC_MCASP_0_CTRL_REGS, MCASP_TX_CLKCHCK_DIV32,
                          0x00, 0xFF);
 
    /* Enable the transmitter/receiver slots. I2S uses 2 slots */
    McASPTxTimeSlotSet(SOC_MCASP_0_CTRL_REGS, I2S_SLOTS_L_R);

    /* Set the serializer 11 as transmitter */
    McASPSerializerTxSet(SOC_MCASP_0_CTRL_REGS, 11);

    /*
    ** Configure the McASP pins 
    ** Input - Frame Sync, Clock and Serializer 12
    ** Output - Serializer 11 is connected to the input of the codec 
    */
    McASPPinMcASPSet(SOC_MCASP_0_CTRL_REGS, 0xFFFFFFFF);
    McASPPinDirOutputSet(SOC_MCASP_0_CTRL_REGS, MCASP_PIN_AXR(11));
    McASPPinDirInputSet(SOC_MCASP_0_CTRL_REGS, MCASP_PIN_AFSX 
                                               | MCASP_PIN_ACLKX);
}

/*
** Activates the data transmission/reception
** The DMA parameters shall be ready before calling this function.
*/
void ToneLoopStart(void)
{
    /* Start the clocks */
    McASPTxClkStart(SOC_MCASP_0_CTRL_REGS, MCASP_TX_CLK_EXTERNAL);

    /* Enable EDMA for the transfer */
    EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, EDMA3_CHA_MCASP0_TX,
                        EDMA3_TRIG_MODE_EVENT);

    /* Activate the  serializers */
    McASPTxSerActivate(SOC_MCASP_0_CTRL_REGS);

    /* Activate the state machines */
    McASPTxEnable(SOC_MCASP_0_CTRL_REGS);
}

/*
** Function to initialize the looping of tone.
*/
void ToneLoopInit(void)
{
    EDMA3Init(SOC_EDMA30CC_0_REGS, 0);

    /*
    ** Request EDMA channel. Channel 1 is used for transmission
    */
    EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA,
                        EDMA3_CHA_MCASP0_TX, EDMA3_CHA_MCASP0_TX, 0);

    /*
    ** To maintain portability, between GCC and TMS470, we initialize the
    ** BCNT for dmaPar[1] here. Else if the initialization is done above,
    ** TMS470 throws up error: expression must have a constant value
    */
    dmaPar[1].bCnt = PARAM2_BCNT;

    /* Initialize the DMA parameters */
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, EDMA3_CHA_MCASP0_TX, 
                 (struct EDMA3CCPaRAMEntry *)(&(dmaPar[0])));
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, 40, 
                 (struct EDMA3CCPaRAMEntry *)(&(dmaPar[1])));
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, 41, 
                 (struct EDMA3CCPaRAMEntry *)(&(dmaPar[2])));

    /* Configure the McASP for I2S with two channels */
    McASPI2STwoChanConfig();
}

/***************************** End Of File ***********************************/
