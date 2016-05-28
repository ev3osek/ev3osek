/**
 *  \file  vpifLoopbackSD.c
 *
 *  \brief Sample application for vpif SD loopback. Simple pingpong buffering is
 *         supported through interrupt.
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

#include "psc.h"
#include "vpif.h"
#include "interrupt.h"

#include "evmAM1808.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"

#include "uartStdio.h"

#include "adv7343.h"
#include "tvp5147.h"
#include "cdce913.h"
#include "codecif.h"
#include "i2cgpio.h"

/******************************************************************************
**                      INTERNAL MACROS
*******************************************************************************/
#define I2C_SLAVE_CODEC_ADV7343                 (0x2Au)
#define I2C_SLAVE_CODEC_TVP5147_1_SVIDEO        (0x5Cu)
#define I2C_SLAVE_CODEC_TVP5147_2_COMPOSITE     (0x5Du)
#define I2C_SLAVE_CDCE913                       (0x65u)
#define I2C_SLAVE_UI_EXPANDER                   (0x20u)

#define INT_CHANNEL_I2C                         (0x2u)

#define VBUF_SIZE                               (720 * 245)
#define VBUF_ALIGN                              (8)

/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void SetupIntc(void);
static void SetUpVPIFTx(void);
static void SetUpVPIFRx(void);
static void VPIFIsr(void);
/******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
unsigned int pingpong;
volatile int error_flag = 0;

#if defined(__IAR_SYSTEMS_ICC__)
#pragma data_alignment=(VBUF_ALIGN)
unsigned char chromaTop[VBUF_SIZE], chromaBottom[VBUF_SIZE],
              lumaTop[VBUF_SIZE], lumaBottom[VBUF_SIZE];
unsigned char chromaTop2[VBUF_SIZE], chromaBottom2[VBUF_SIZE],
              lumaTop2[VBUF_SIZE], lumaBottom2[VBUF_SIZE];
#elif defined(__TMS470__) || defined(_TMS320C6X)
#pragma DATA_ALIGN(chromaTop, VBUF_ALIGN);
#pragma DATA_ALIGN(chromaBottom, VBUF_ALIGN);
#pragma DATA_ALIGN(lumaTop, VBUF_ALIGN);
#pragma DATA_ALIGN(lumaBottom, VBUF_ALIGN);
#pragma DATA_ALIGN(chromaTop2, VBUF_ALIGN);
#pragma DATA_ALIGN(chromaBottom2, VBUF_ALIGN);
#pragma DATA_ALIGN(lumaTop2, VBUF_ALIGN);
#pragma DATA_ALIGN(lumaBottom2, VBUF_ALIGN);
unsigned char chromaTop[VBUF_SIZE], chromaBottom[VBUF_SIZE],
              lumaTop[VBUF_SIZE], lumaBottom[VBUF_SIZE];
unsigned char chromaTop2[VBUF_SIZE], chromaBottom2[VBUF_SIZE],
              lumaTop2[VBUF_SIZE], lumaBottom2[VBUF_SIZE];
#else
unsigned char chromaTop[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN))),
              chromaBottom[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN))),
              lumaTop[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN))),
              lumaBottom[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN)));
unsigned char chromaTop2[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN))),
              chromaBottom2[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN))),
              lumaTop2[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN))),
              lumaBottom2[VBUF_SIZE]__attribute__((aligned(VBUF_ALIGN)));
#endif

/******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/
int main(void)
{
    /* Enable the UART */
    UARTStdioInit();
    UARTprintf("\n\nVPIF loopback (SD) example\n");

    /* Power on VPIF */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_VPIF, PSC_POWERDOMAIN_ALWAYS_ON, PSC_MDCTL_NEXT_ENABLE);

    /* Initializing ARM/DSP INTC */
    SetupIntc();

    /* Initialize I2C and program UI GPIO expander, TVP5147, and ADV7343 via I2C */
    I2CPinMuxSetup(0);

    /* enable video via gpio expander to ensure we have exclusive access to the bus */
    I2CCodecIfInit(SOC_I2C_0_REGS, INT_CHANNEL_I2C, I2C_SLAVE_UI_EXPANDER);
    I2CGPIOInit(SOC_I2C_0_REGS);
    I2CGPIOSetOutput(SOC_I2C_0_REGS);

    I2CCodecIfInit(SOC_I2C_0_REGS, INT_CHANNEL_I2C, I2C_SLAVE_CODEC_TVP5147_2_COMPOSITE);
    TVP5147CompositeInit(SOC_I2C_0_REGS);

    I2CCodecIfInit(SOC_I2C_0_REGS, INT_CHANNEL_I2C, I2C_SLAVE_CODEC_ADV7343);
    ADV7343CompositeInit(SOC_I2C_0_REGS);

    /* Setup VPIF pinmux & Initialize VPIF */
    VPIFPinMuxSetup();

    SetUpVPIFRx();
    SetUpVPIFTx();

    VPIFDMARequestSizeConfig(SOC_VPIF_0_REGS, VPIF_REQSIZE_ONE_TWENTY_EIGHT);
    VPIFEmulationControlSet(SOC_VPIF_0_REGS, VPIF_FREE);

    /* Initialize buffer address for 1st frame*/
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD, VPIF_LUMA, (unsigned int)&lumaTop[0], 720);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD, VPIF_CHROMA, (unsigned int)&chromaTop[0], 720);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD, VPIF_LUMA, (unsigned int)&lumaBottom[0], 720);
    VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD, VPIF_CHROMA, (unsigned int)&chromaBottom[0], 720);

    VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_TOP_FIELD, VPIF_LUMA, (unsigned int)&lumaTop2[0], 720);
    VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_TOP_FIELD, VPIF_CHROMA, (unsigned int)&chromaTop2[0], 720);
    VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_BOTTOM_FIELD, VPIF_LUMA, (unsigned int)&lumaBottom2[0], 720);
    VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_BOTTOM_FIELD, VPIF_CHROMA, (unsigned int)&chromaBottom2[0], 720);

    pingpong=0;

    /* Enable capture */
    VPIFCaptureChanenEnable(SOC_VPIF_0_REGS, VPIF_CHANNEL_0);

    /* Synchronizing the capture & display interrupts.
     * After the 1st frame is captured, clear the status, enable interrupts, then enable display.
     * There will be 1 frame delay between capture and display because of this synchronization. */

    while(!VPIFInterruptStatus(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0));
    VPIFInterruptStatusClear(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);
    while(VPIFInterruptStatus(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0));
    VPIFInterruptEnable(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);
    VPIFInterruptEnableSet(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);
    VPIFDisplayChanenEnable(SOC_VPIF_0_REGS, VPIF_CHANNEL_2);

    /* Run forever */
    while(1)
    {
        if (error_flag)
        {
            UARTprintf("Unexpected error occured during VPIF loopback\n");
            error_flag = 0;
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
    VPIFCaptureModeConfig(SOC_VPIF_0_REGS, VPIF_480I, VPIF_CHANNEL_0, 0, (VPIFVbufParam*) 0);
}

/*
 * Initialize display
 */
static void SetUpVPIFTx(void)
{
    /* Disable interrupts */
    VPIFInterruptDisable(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH3);
    VPIFInterruptDisable(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH2);
    /* Disable display ports */
    VPIFDisplayChanenDisable(SOC_VPIF_0_REGS, VPIF_CHANNEL_3);
    VPIFDisplayChanenDisable(SOC_VPIF_0_REGS, VPIF_CHANNEL_2);
    /* Enable pixel */
    VPIFDisplayPixelEnable(SOC_VPIF_0_REGS, VPIF_CHANNEL_2);
    /* Interrupt after displaying the bottom field of every frame */
    VPIFDisplayIntframeConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_FRAME_INTERRUPT_BOTTOM);
    /* Y/C interleaved display over 8-bit bus */
    VPIFDisplayYcmuxModeSelect(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_YC_MUXED);
    /* Enable pixel clock */
    VPIFDisplayClkenEnable(SOC_VPIF_0_REGS, VPIF_CHANNEL_2);
    /* Displaying 480I (SD NTSC) */
    VPIFDisplayModeConfig(SOC_VPIF_0_REGS, VPIF_480I, VPIF_CHANNEL_2, (VPIFVbufParam*) 0);
}

/*
** Configures arm/dsp interrupt controller to generate frame interrupt
*/
static void SetupIntc(void)
{
    /* Setup DSP or ARM interrupt controller */

#ifdef _TMS320C6X
    /* Initialize the DSP interrupt controller */
    IntDSPINTCInit();

    /* Register ISR to vector table */
    IntRegister(C674X_MASK_INT5, VPIFIsr);

    /* Map system interrupt to DSP maskable interrupt */
    IntEventMap(C674X_MASK_INT5, SYS_INT_VPIF_INT);

    /* Enable DSP maskable interrupt */
    IntEnable(C674X_MASK_INT5);

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

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
#endif
}

/*
** Interrupt service routine.
** Perform pingpong buffering and error checking.
*/
static void VPIFIsr(void)
{
    unsigned int temp;
#ifdef _TMS320C6X
    IntEventClear(SYS_INT_VPIF_INT);
#else
    IntSystemStatusClear(SYS_INT_VPIF);
#endif

    temp = VPIFInterruptStatus(SOC_VPIF_0_REGS, VPIF_ERROR_INT|VPIF_FRAMEINT_CH3|VPIF_FRAMEINT_CH2|VPIF_FRAMEINT_CH1|VPIF_FRAMEINT_CH0);

    /* pingpong the buffers */
    if(pingpong == 0)
    {
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD, VPIF_LUMA, (unsigned int)&lumaTop2[0], 720);
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD, VPIF_CHROMA, (unsigned int)&chromaTop2[0], 720);
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD, VPIF_LUMA, (unsigned int)&lumaBottom2[0], 720);
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD, VPIF_CHROMA, (unsigned int)&chromaBottom2[0], 720);

        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_TOP_FIELD, VPIF_LUMA, (unsigned int)&lumaTop[0], 720);
        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_TOP_FIELD, VPIF_CHROMA, (unsigned int)&chromaTop[0], 720);
        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_BOTTOM_FIELD, VPIF_LUMA, (unsigned int)&lumaBottom[0], 720);
        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_BOTTOM_FIELD, VPIF_CHROMA, (unsigned int)&chromaBottom[0], 720);

        temp = 1;
    }
    else
    {
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD, VPIF_LUMA, (unsigned int)&lumaTop[0], 720);
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_TOP_FIELD, VPIF_CHROMA, (unsigned int)&chromaTop[0], 720);
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD, VPIF_LUMA, (unsigned int)&lumaBottom[0], 720);
        VPIFCaptureFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_0, VPIF_BOTTOM_FIELD, VPIF_CHROMA, (unsigned int)&chromaBottom[0], 720);

        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_TOP_FIELD, VPIF_LUMA, (unsigned int)&lumaTop2[0], 720);
        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_TOP_FIELD, VPIF_CHROMA, (unsigned int)&chromaTop2[0], 720);
        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_BOTTOM_FIELD, VPIF_LUMA, (unsigned int)&lumaBottom2[0], 720);
        VPIFDisplayFBConfig(SOC_VPIF_0_REGS, VPIF_CHANNEL_2, VPIF_BOTTOM_FIELD, VPIF_CHROMA, (unsigned int)&chromaBottom2[0], 720);

        temp = 0;
    }

    pingpong = temp;

    /* clear interrupt */
    VPIFInterruptStatusClear(SOC_VPIF_0_REGS, VPIF_FRAMEINT_CH0);

    /* if error interrupt occurs, report error */
    if ((temp & VPIF_ERROR_INT))
    {
        error_flag = 1;
    }
}

/***************************** End Of File ************************************/
