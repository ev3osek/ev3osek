/**
 * \file   demoRaster.c 
 *
 * \brief  This file contains Raster related functions.
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

#include "raster.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "demoRaster.h"
#include "demoMain.h"
#include "demoCfg.h"

/*******************************************************************************
**                     INTERNAL FUNCTION DECLARATIONS
*******************************************************************************/
static void Raster0Isr(void);

/*******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/
/*
** Configures raster to display image 
*/
void Raster0Init(void)
{
    /* disable raster */
    RasterDisable(SOC_LCDC_0_REGS);
    
    /* configure the pclk */
    RasterClkConfig(SOC_LCDC_0_REGS, 7833600, 150000000);

    /* configuring DMA of LCD controller */ 
    RasterDMAConfig(SOC_LCDC_0_REGS, RASTER_DOUBLE_FRAME_BUFFER,
                    RASTER_BURST_SIZE_16, RASTER_FIFO_THRESHOLD_8,
                    RASTER_BIG_ENDIAN_DISABLE);

    /* configuring modes(ex:tft or stn,color or monochrome etc) for raster controller */
    RasterModeConfig(SOC_LCDC_0_REGS, RASTER_DISPLAY_MODE_TFT,
                     RASTER_PALETTE_DATA, RASTER_COLOR, RASTER_RIGHT_ALIGNED);

    /* frame buffer data is ordered from least to Most significant bye */
    RasterLSBDataOrderSelect(SOC_LCDC_0_REGS);
    
    /* disable nibble mode */
    RasterNibbleModeDisable(SOC_LCDC_0_REGS);
   
     /* configuring the polarity of timing parameters of raster controller */
    RasterTiming2Configure(SOC_LCDC_0_REGS, RASTER_FRAME_CLOCK_LOW |
                                            RASTER_LINE_CLOCK_LOW  |
                                            RASTER_PIXEL_CLOCK_LOW |
                                            RASTER_SYNC_EDGE_RISING|
                                            RASTER_SYNC_CTRL_ACTIVE|
                                            RASTER_AC_BIAS_HIGH     , 0, 255);

    /* configuring horizontal timing parameter */
    RasterHparamConfig(SOC_LCDC_0_REGS, 480, 41, 2, 2);

    /* configuring vertical timing parameters */
    RasterVparamConfig(SOC_LCDC_0_REGS, 272, 10, 4, 4);

    /* configuring fifo delay to */
    RasterFIFODMADelayConfig(SOC_LCDC_0_REGS, 2);
}

/*
** Displays the banner image. 
*/
void Raster0Start(void)
{
     /* Configuring the base and ceiling value. */
     RasterDMAFBConfig(SOC_LCDC_0_REGS, 
                      (unsigned int)contextInfo[0].pImageAddr,
                      (unsigned int)contextInfo[0].pImageAddr + 261152 - 2,
                      0);

     RasterDMAFBConfig(SOC_LCDC_0_REGS, 
                      (unsigned int)contextInfo[0].pImageAddr,
                      (unsigned int)contextInfo[0].pImageAddr + 261152 - 2,
                      1);

     /* enable raster */
     RasterEnable(SOC_LCDC_0_REGS);

     /* Enable display panel backlight and power */
     ConfigRasterDisplayEnable();
}

/*
**  A wrapper function which enables the End-Of-Frame interrupt of Raster.
*/
void Raster0EOFIntEnable(void)
{
     /* enable End of frame interrupt */
     RasterEndOfFrameIntEnable(SOC_LCDC_0_REGS);
}

/*
** A wrapper function which disables the End-Of-Frame interrupt of Raster.
*/
void Raster0EOFIntDisable(void)
{
     RasterEndOfFrameIntDisable(SOC_LCDC_0_REGS);
}

/*
**  This function registers the ISR, maps a channel and enables the
**  respective interrupt in AINTC for the Raster.
*/
#ifdef _TMS320C6X
void Raster0IntRegister(unsigned int cpuINT)
{
    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(cpuINT, Raster0Isr);

    IntEventMap(cpuINT, SYS_INT_LCDC_INT);
}
#else
void Raster0IntRegister(unsigned int channel)
{
    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_LCDINT, Raster0Isr);

    /* Set the channnel number 2 of AINTC for system interrupt 52.
     */
    IntChannelSet(SYS_INT_LCDINT, channel);
}
#endif

/*
** Interrupt Service Routine(ISR) for Raster. This function displays an image 
** on the LCD.
*/
static void Raster0Isr(void)
{
    unsigned int  status;

#ifdef _TMS320C6X
    IntEventClear(SYS_INT_LCDC_INT);
#else
    IntSystemStatusClear(SYS_INT_LCDINT);
#endif

    status = RasterClearGetIntStatus(SOC_LCDC_0_REGS, 
                                     RASTER_END_OF_FRAME0_INT_STAT |  \
                                     RASTER_END_OF_FRAME1_INT_STAT );   
    if (status & RASTER_END_OF_FRAME0_INT_STAT)
    {
        RasterDMAFBConfig(SOC_LCDC_0_REGS, 
                          (unsigned int)contextInfo[imageCount].pImageAddr,
                          (unsigned int)contextInfo[imageCount].pImageAddr +  \
                                                              SIZEOF_IMAGE - 2,
                          0);
    }

    if(status & RASTER_END_OF_FRAME1_INT_STAT)
    {
        RasterDMAFBConfig(SOC_LCDC_0_REGS, 
                          (unsigned int)contextInfo[imageCount].pImageAddr,
                          (unsigned int)contextInfo[imageCount].pImageAddr +  \
                                                              SIZEOF_IMAGE - 2,
                          1);
    }
}

/***************************** End Of File ************************************/
