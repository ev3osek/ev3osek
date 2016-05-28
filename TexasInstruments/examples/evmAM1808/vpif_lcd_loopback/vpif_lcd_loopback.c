/**
 * \file  vpiflcd_loopback.c
 *
 * \brief Sample application for capture from VPIF and display over LCD.
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

#include <stdio.h>
#include <stdint.h>

#include "psc.h"
#include "vpif.h"
#include "raster.h"
#include "interrupt.h"

#include "evmAM1808.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "hw_syscfg0_AM1808.h"
#include "hw_types.h"

#include "adv7343.h"
#include "tvp5147.h"
#include "cdce913.h"
#include "codecif.h"
#include "i2cgpio.h"

#ifdef _TMS320C6X
#include "dspcache.h"
#else
#include "cp15.h"
#ifdef gcc
#define restrict
#endif
#endif

/******************************************************************************
**                      INTERNAL MACROS
*******************************************************************************/
#define I2C_SLAVE_CODEC_ADV7343             (0x2Au)
#define I2C_SLAVE_CODEC_TVP5147_1_SVIDEO    (0x5Cu)
#define I2C_SLAVE_CODEC_TVP5147_2_COMPOSITE (0x5Du)
#define I2C_SLAVE_CDCE913                   (0x65u)
#define I2C_SLAVE_UI_EXPANDER               (0x20u)

#define INT_CHANNEL_I2C                     (0x2u)

#define CAPTURE_IMAGE_WIDTH                 (720)
#define CAPTURE_IMAGE_HEIGHT                (488)

#define DISPLAY_IMAGE_WIDTH                 (480)
#define DISPLAY_IMAGE_HEIGHT                (272)

#define OFFSET1                             ((CAPTURE_IMAGE_HEIGHT - DISPLAY_IMAGE_HEIGHT)/2)
#define OFFSET2                             ((CAPTURE_IMAGE_WIDTH - DISPLAY_IMAGE_WIDTH)/2)
#define OFFSET                              (CAPTURE_IMAGE_WIDTH * OFFSET1 + OFFSET2)

/******************************************************************************
**                      GLOBAL FUNCTION PROTOTYPES
*******************************************************************************/

extern void cbcr422sp_to_rgb565_c(const unsigned char * restrict, unsigned int,
        unsigned int, const short*, const unsigned char *restrict,
        unsigned int, unsigned short *restrict, unsigned int, unsigned);

/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void SetupIntc(void);
static void SetUpVPIFRx(void);
static void SetUpLCD(void);
static void VPIFIsr(void);
static void LCDIsr(void);

/******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
unsigned int            i, pingpong=1, buffcount=0, buffcount2, display_buff_1=0;
volatile unsigned int   captured=0, changed=0, updated=3, processed=1;
unsigned char           buff_luma1[CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT];
unsigned char           buff_luma2[CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT];
unsigned char           buff_chroma1[CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT];
unsigned char           buff_chroma2[CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT];
unsigned char           *buff_luma[2], *buff_chroma[2];
unsigned char           *videoTopY, *videoTopC;
unsigned short          *videoTopRgb1, *videoTopRgb2;
unsigned short          Rgb_buffer1[DISPLAY_IMAGE_WIDTH*DISPLAY_IMAGE_HEIGHT + 16];
unsigned short          Rgb_buffer2[DISPLAY_IMAGE_WIDTH*DISPLAY_IMAGE_HEIGHT + 16];
const short             ccCoeff[5] = {0x2000, 0x2BDD, -0x0AC5, -0x1658, 0x3770};

/* page tables start must be aligned in 16K boundary */
#ifdef __TMS470__
#pragma DATA_ALIGN(pageTable, 16384);
static volatile unsigned int pageTable[4*1024];
#elif defined(__IAR_SYSTEMS_ICC__)
#pragma data_alignment=16384
static volatile unsigned int pageTable[4*1024];
#elif _TMS320C6X
#else
static volatile unsigned int pageTable[4*1024] __attribute__((aligned(16*1024)));
#endif

/******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/
int main(void)
 {
#ifndef _TMS320C6X
    unsigned int index;
#endif

    /* Setting the Master priority for the VPIF and LCD DMA controllers to highest level */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_MSTPRI1) &= 0x00FFFFFF;
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_MSTPRI2) &= 0x0FFFFFFF;

#ifdef _TMS320C6X
    /* Set MAR bits and configure L1 cache */
    CacheEnableMAR((unsigned int)0xC0000000, (unsigned int)0x10000000);
    CacheEnable(L1PCFG_L1PMODE_32K | L1DCFG_L1DMODE_32K );
#else
    /* Sets up 'Level 1" page table entries.
     * The page table entry consists of the base address of the page
     * and the attributes for the page. The following operation is to
     * setup one-to-one mapping page table for DDR memeory range and set
     * the atributes for the same. The DDR memory range is from 0xC0000000
     * to 0xCFFFFFFF. Thus the base of the page table ranges from 0xC00 to
     * 0xCFF. Cache(C bit) and Write Buffer(B bit) are enabled  only for
     * those page table entries which maps to DDR RAM and internal RAM.
     * All the pages in the DDR range are provided with R/W permissions */
    for(index = 0; index < (4*1024); index++)
    {
         if((index >= 0xC00 && index < 0xD00)|| (index == 0x800))
         {
              pageTable[index] = (index << 20) | 0x00000C1E;
         }
         else
         {
              pageTable[index] = (index << 20) | 0x00000C12;
         }
    }

    /* Configures translation table base register
     * with pagetable base address. */
    CP15TtbSet((unsigned int )pageTable);

    /* Enables MMU */
    CP15MMUEnable();

    /* Enable Instruction Cache */
    CP15ICacheEnable();

    /* Enable Data Cache */
    CP15DCacheEnable();
#endif

    /* Allocate pointers to buffers */
    buff_luma[0] = buff_luma1;
    buff_luma[1] = buff_luma2;
    buff_chroma[0] = buff_chroma1;
    buff_chroma[1] = buff_chroma2;

    /* Initializing palette for first buffer */
    Rgb_buffer1[0] = 0x4000;
    for (i = 1; i < 16; i++)
        Rgb_buffer1[i] = 0x0000;
    videoTopRgb1 = Rgb_buffer1 + i;

    /* Initializing palette for second buffer */
    Rgb_buffer2[0] = 0x4000;
    for (i = 1; i < 16; i++)
        Rgb_buffer2[i] = 0x0000;
    videoTopRgb2 = Rgb_buffer2 + i;

    /* Power on VPIF */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_VPIF, PSC_POWERDOMAIN_ALWAYS_ON,
            PSC_MDCTL_NEXT_ENABLE);

    /* Initializing ARM/DSP INTC */
    SetupIntc();

    /* Initialize I2C and program UI GPIO expander, TVP5147, and ADV7343 via I2C */
    I2CPinMuxSetup(0);

    /* enable video via gpio expander to ensure we have exclusive access to the bus */
    I2CCodecIfInit(SOC_I2C_0_REGS, INT_CHANNEL_I2C, I2C_SLAVE_UI_EXPANDER);
    I2CGPIOInit(SOC_I2C_0_REGS);
    I2CGPIOSetOutput(SOC_I2C_0_REGS);

    /*Initialize the TVP5147 to accept composite video */
    I2CCodecIfInit(SOC_I2C_0_REGS, INT_CHANNEL_I2C,
            I2C_SLAVE_CODEC_TVP5147_2_COMPOSITE);
    TVP5147CompositeInit(SOC_I2C_0_REGS);

    /* Setup VPIF pinmux */
    VPIFPinMuxSetup();

    /* Setup LCD */
    SetUpLCD();

    /* Initialize VPIF */
    SetUpVPIFRx();
    VPIFDMARequestSizeConfig(SOC_VPIF_0_REGS, VPIF_REQSIZE_ONE_TWENTY_EIGHT);
    VPIFEmulationControlSet(SOC_VPIF_0_REGS, VPIF_HALT);

    /* Initialize buffer addresses for 1st frame*/
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD,
            VPIF_LUMA, (unsigned int) buff_luma[0], CAPTURE_IMAGE_WIDTH*2);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD,
            VPIF_CHROMA, (unsigned int) buff_chroma[0], CAPTURE_IMAGE_WIDTH*2);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD,
            VPIF_LUMA, (unsigned int) (buff_luma[0] + CAPTURE_IMAGE_WIDTH), CAPTURE_IMAGE_WIDTH*2);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD,
            VPIF_CHROMA, (unsigned int) (buff_chroma[0] + CAPTURE_IMAGE_WIDTH), CAPTURE_IMAGE_WIDTH*2);

    /* configuring the base ceiling */
    RasterDMAFBConfig(SOC_LCDC_0_REGS, (unsigned int) Rgb_buffer2,
            (unsigned int) (Rgb_buffer2 + DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT + 15), 0);
    RasterDMAFBConfig(SOC_LCDC_0_REGS, (unsigned int) Rgb_buffer2,
            (unsigned int) (Rgb_buffer2 + DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT + 15), 1);

    /* Enable capture */
    VPIFCaptureChanenEnable(SOC_VPIF_0_REGS, VPIF_CHANNEL_0);

    /* Enable VPIF interrupt */
    VPIFInterruptEnable(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);
    VPIFInterruptEnableSet(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);

    /* enable End of frame interrupt */
    RasterEndOfFrameIntEnable(SOC_LCDC_0_REGS);

    /* enable raster */
    RasterEnable(SOC_LCDC_0_REGS);

    buffcount++;
    buffcount2 = buffcount - 1;

    /* Run forever */
    while (1)
    {
        /* Wait here till a new frame is not captured */
        while (!captured);

        /* Process the next buffer only when both the raster buffers
         * are pointing to the current buffer to avoid jitter effect */
        if (updated == 3)
        {
            processed = 0;
            changed = 0;
            updated = 0;

         /* Convert the buffer from CBCR422 semi-planar to RGB565,
          *  Flush and invalidate the processed buffer so that the DMA reads the processed data,
          *  set the flag for the buffer to be displayed on the LCD (which would be the processed buffer)
          *  and notify the LCD of availability of a processed buffer.
          *  The output buffers are ping-ponged each time. */
            if (pingpong)
            {
                cbcr422sp_to_rgb565_c(
                        (const unsigned char *) (videoTopC + OFFSET),
                        DISPLAY_IMAGE_HEIGHT, CAPTURE_IMAGE_WIDTH, ccCoeff,
                        (const unsigned char *) (videoTopY + OFFSET),
                        CAPTURE_IMAGE_WIDTH, videoTopRgb1, DISPLAY_IMAGE_WIDTH, DISPLAY_IMAGE_WIDTH);
            #ifdef _TMS320C6X
                CacheWBInv((unsigned int) videoTopRgb1, DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT * 2);
            #else
                CP15DCacheCleanBuff((unsigned int) videoTopRgb1,DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT * 2);
            #endif
                display_buff_1 = 1;
                changed = 1;
            }
            else
            {
                cbcr422sp_to_rgb565_c(
                        (const unsigned char *) (videoTopC + OFFSET),
                        DISPLAY_IMAGE_HEIGHT, CAPTURE_IMAGE_WIDTH, ccCoeff,
                        (const unsigned char *) (videoTopY + OFFSET),
                        CAPTURE_IMAGE_WIDTH, videoTopRgb2, DISPLAY_IMAGE_WIDTH, DISPLAY_IMAGE_WIDTH);
            #ifdef _TMS320C6X
                CacheWBInv((unsigned int) videoTopRgb2, DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT * 2);
            #else
                CP15DCacheCleanBuff((unsigned int) videoTopRgb2, DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT * 2);
            #endif
                display_buff_1 = 0;
                changed = 1;
            }

            pingpong = !pingpong;
            captured = 0;
            processed = 1;
        }
    }
}

/*
 * Initialize capture
 */
static void SetUpVPIFRx(void)
{
    /* Disable interrupts */
    VPIFInterruptDisable(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH1);
    VPIFInterruptDisable(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);

    /* Disable capture ports */
    VPIFCaptureChanenDisable(SOC_VPIF_0_REGS, VPIF_CHANNEL_1);
    VPIFCaptureChanenDisable(SOC_VPIF_0_REGS, VPIF_CHANNEL_0);

    /* Interrupt after capturing the bottom field of every frame */
    VPIFCaptureIntframeConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_FRAME_INTERRUPT_BOTTOM);

    /* Y/C interleaved capture over 8-bit bus */
    VPIFCaptureYcmuxModeSelect(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_YC_MUXED);

    /* Capturing 480I (SD NTSC) */
    VPIFCaptureModeConfig(SOC_VPIF_0_REGS, VPIF_480I, VPIF_CHANNEL_0, 0, (struct vbufParam *) 0);
}

/*
 * Configures raster to display image
 */
static void SetUpLCD(void)
{
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_LCDC, PSC_POWERDOMAIN_ALWAYS_ON,
            PSC_MDCTL_NEXT_ENABLE);

    LCDPinMuxSetup();

    /* Configure backlight/power control pins */
    ConfigRasterDisplayEnable();

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
    RasterHparamConfig(SOC_LCDC_0_REGS, DISPLAY_IMAGE_WIDTH, 41, 2, 2);

    /* configuring vertical timing parameters */
    RasterVparamConfig(SOC_LCDC_0_REGS, DISPLAY_IMAGE_HEIGHT, 10, 3, 3);

    /* configuring fifo delay to */
    RasterFIFODMADelayConfig(SOC_LCDC_0_REGS, 2);
}

/*
** Configures arm/dsp interrupt controller to generate frame interrupt
*/
static void SetupIntc(void)
{
#ifdef _TMS320C6X
    /* Initialize the DSP interrupt controller */
    IntDSPINTCInit();

    /* Register VPIF ISR to vector table */
    IntRegister(C674X_MASK_INT5, VPIFIsr);

    /* Map system interrupt to DSP maskable interrupt for VPIF */
    IntEventMap(C674X_MASK_INT5, SYS_INT_VPIF_INT);

    /* Enable DSP maskable interrupt for VPIF */
    IntEnable(C674X_MASK_INT5);

    /* Register LCD ISR to vector table */
    IntRegister(C674X_MASK_INT6, LCDIsr);

    /* Map system interrupt to DSP maskable interrupt for LCD */
    IntEventMap(C674X_MASK_INT6, SYS_INT_LCDC_INT);

    /* Enable DSP maskable interrupt for LCD */
    IntEnable(C674X_MASK_INT6);

    /* Enable DSP interrupts */
    IntGlobalEnable();

#else
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_VPIF, VPIFIsr);

    /* Set the channel number 2 of AINTC for LCD system interrupt.  */
    IntChannelSet(SYS_INT_VPIF, 2);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_VPIF);

    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_LCDINT, LCDIsr);

    /* Set the channnel number 2 of AINTC for LCD system interrupt.  */
    IntChannelSet(SYS_INT_LCDINT, 3);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_LCDINT);

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
#endif
}

/*
** VPIF Interrupt service routine.
*/
static void VPIFIsr(void)
{
#ifdef _TMS320C6X
    IntEventClear(SYS_INT_VPIF_INT);
#else
    IntSystemStatusClear(SYS_INT_VPIF);
#endif

    /* If previously captured frame not processed, clear this interrupt and return */
    if (!processed)
    {
        VPIFInterruptStatusClear(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);
        return;
    }

    /* buffcount represents buffer to be given to capture driver and
     * buffcount2 represents the newly captured buffer to be processed */
    processed = 0;
    captured = 0;
    buffcount++;
    buffcount2 = buffcount - 1;
    /* Currently only two buffers are being used for capture */
    if (buffcount == 2)
        buffcount = 0;

     /* Invalidate the buffers before giving to capture driver*/
#ifdef _TMS320C6X
    CacheInv((unsigned int) buff_luma[buffcount],
            CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT * 2);
    CacheInv((unsigned int) buff_chroma[buffcount],
            CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT * 2);
#else
    CP15ICacheFlushBuff((unsigned int) buff_luma[buffcount],
            CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT * 2);
    CP15ICacheFlushBuff((unsigned int) buff_chroma[buffcount],
            CAPTURE_IMAGE_WIDTH * CAPTURE_IMAGE_HEIGHT * 2);
#endif

    /* Initialize buffer addresses for a new frame*/
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD,
            VPIF_LUMA, (unsigned int) buff_luma[buffcount], CAPTURE_IMAGE_WIDTH*2);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD,
            VPIF_CHROMA, (unsigned int) buff_chroma[buffcount], CAPTURE_IMAGE_WIDTH*2);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD,
            VPIF_LUMA, (unsigned int) (buff_luma[buffcount] + CAPTURE_IMAGE_WIDTH), CAPTURE_IMAGE_WIDTH*2);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD,
            VPIF_CHROMA, (unsigned int) (buff_chroma[buffcount] + CAPTURE_IMAGE_WIDTH), CAPTURE_IMAGE_WIDTH*2);

    /* Initialize buffer addresses with the captured frame ready to be processed */
    videoTopC = buff_chroma[buffcount2];
    videoTopY = buff_luma[buffcount2];
    captured = 1;

    /* clear interrupt */
    VPIFInterruptStatusClear(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);
}

/*
** For each end of frame interrupt base and ceiling is reconfigured
*/
static void LCDIsr(void)
{
    unsigned int status;
#ifdef _TMS320C6X
    IntEventClear(SYS_INT_LCDC_INT);
#else
    IntSystemStatusClear(SYS_INT_LCDINT);
#endif

    /* Find which interrupt occurred and clear it */
    status = RasterIntStatus(SOC_LCDC_0_REGS,
            RASTER_END_OF_FRAME0_INT_STAT | RASTER_END_OF_FRAME1_INT_STAT);
    status = RasterClearGetIntStatus(SOC_LCDC_0_REGS, status);

    /* Display the appropriate output buffer on the appropriate raster buffer
     * and if a new processed buffer is available, let the DSP know that
     * it has configured the raster buffer to point to the new output buffer
     * by updating the 'updated' flag */
    if (display_buff_1)
    {
        if (status & RASTER_END_OF_FRAME0_INT_STAT)
        {
            RasterDMAFBConfig(SOC_LCDC_0_REGS, (unsigned int) Rgb_buffer1,
                    (unsigned int) (Rgb_buffer1 + DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT + 15), 0);
            if (changed)
                updated = updated | 0x1;
        }
        if (status & RASTER_END_OF_FRAME1_INT_STAT)
        {
            RasterDMAFBConfig(SOC_LCDC_0_REGS, (unsigned int) Rgb_buffer1,
                    (unsigned int) (Rgb_buffer1 + DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT + 15), 1);
            if (changed)
                updated = updated | 0x2;
        }
    }
    else
    {
        if (status & RASTER_END_OF_FRAME0_INT_STAT)
        {
            RasterDMAFBConfig(SOC_LCDC_0_REGS, (unsigned int) Rgb_buffer2,
                    (unsigned int) (Rgb_buffer2 + DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT + 15), 0);
            if (changed)
                updated = updated | 0x1;
        }
        if (status & RASTER_END_OF_FRAME1_INT_STAT)
        {
            RasterDMAFBConfig(SOC_LCDC_0_REGS, (unsigned int) Rgb_buffer2,
                    (unsigned int) (Rgb_buffer2 + DISPLAY_IMAGE_WIDTH * DISPLAY_IMAGE_HEIGHT + 15), 1);
            if (changed)
                updated = updated | 0x2;
        }
    }
}

/***************************** End Of File ************************************/
