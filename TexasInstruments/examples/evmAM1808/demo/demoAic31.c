/**
 * \file  aic31.c
 *
 * \brief APIs to configure the AIC31 codec.
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

#include "demoI2C.h"
#include "demoAic31.h"
#include "demoCfg.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define AIC31_RESET                 (0x80)

#define AIC31_SLOT_WIDTH_16         (0u << 4u)
#define AIC31_SLOT_WIDTH_20         (1u << 4u)
#define AIC31_SLOT_WIDTH_24         (2u << 4u)
#define AIC31_SLOT_WIDTH_32         (3u << 4u)

/******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
/**
 * Initializes the AIC31 Codec
 *
 * @param   None.
 *
 * @return  None.
 *
 **/
void AIC31Init(void)
{
    I2C0IfConfig(I2C_SLAVE_AIC31_ADDR, 100000);

    /* Select Page 0 */
    I2C0SlaveRegWrite(0, 0);    

    /* Reset the codec */
    I2C0SlaveRegWrite(1, AIC31_RESET);    

    /* Configure the Codec in I2S mode */
    AIC31I2SConfig(TONE_SLOT_SIZE, TONE_SAMPLE_RATE);
}

/**
 * Configures the data format and slot width
 *
 * @param   slotWidth    slotWidth to be configured
 * @param   sampleRate   Sample rate in samples per second
 * @return  None.
 *
 **/
void AIC31I2SConfig(unsigned int slotWidth, unsigned int sampleRate)
{
    unsigned char fs;
    unsigned char ref = 0x0Au;
    unsigned char temp;
    unsigned char pllPval = 4u;
    unsigned char pllRval = 1u;
    unsigned char pllJval = 16u; 
    unsigned short pllDval = 0u;
    unsigned char slot;

    switch(slotWidth)
    {
        case 16:
            slot = AIC31_SLOT_WIDTH_16;
        break;

        case 20:
            slot = AIC31_SLOT_WIDTH_20;
        break;

        case 24:
            slot = AIC31_SLOT_WIDTH_24;
        break;

        case 32:
            slot = AIC31_SLOT_WIDTH_32;
        break;

        default:
            slot = AIC31_SLOT_WIDTH_16;
        break;
    }


    /* Write the data type and  slot width */
    I2C0SlaveRegWrite(9, slot);

    /* valid data after dataOff number of clock cycles */
    I2C0SlaveRegWrite(10, 0);

    /* Select the configuration for the given sampling rate */
    switch(sampleRate)
    {
        case 8000:
            fs = 0xAAu;
        break;

        case 11025:
            fs = 0x66u;
            ref = 0x8Au;
            pllJval = 14u;
            pllDval = 7000u;
        break;

        case 16000:
            fs = 0x44u;
        break;

        case 22050:
            fs = 0x22u;
            ref = 0x8Au;
            pllJval = 14u;
            pllDval = 7000u;
        break;

        case 24000:
            fs = 0x22u;
        break;
    
        case 32000:
            fs = 0x11u;
        break;

        case 44100:
            ref = 0x8Au;
            fs = 0x00u;
            pllJval = 14u;
            pllDval = 7000u;
        break;

        case 48000:
            fs = 0x00u;
        break;

        case 96000:
            ref = 0x6Au;
            fs = 0x00u;
        break;

        default:
            fs = 0x00u;
        break;
    }
    
    temp = fs;
   
    /* Set the sample Rate */
    I2C0SlaveRegWrite(2, temp);
  
    I2C0SlaveRegWrite(3, 0x80 | pllPval);

    /* use PLL_CLK_IN as MCLK */
    I2C0SlaveRegWrite(102, 0x08);

    /* Use PLL DIV OUT as codec CLK IN */
    I2C0SlaveRegBitClr(101, 0x01);

    /* Select GPIO to output the divided PLL IN */
    I2C0SlaveRegWrite(98, 0x20);

    temp = (pllJval << 2);
    I2C0SlaveRegWrite(4, temp);

    /* Configure the PLL divide registers */
    I2C0SlaveRegWrite(5, (pllDval >> 6) & 0xFF); 
    I2C0SlaveRegWrite(6, (pllDval & 0x3F) << 2); 

    temp = pllRval;
    I2C0SlaveRegWrite(11, temp);

    /* Enable the codec to be master for fs and bclk */
    I2C0SlaveRegWrite(8, 0xD0);

    I2C0SlaveRegWrite(7, ref);

    /* enable the programmable PGA for left and right ADC  */
    I2C0SlaveRegWrite(15, 0x00);
    I2C0SlaveRegWrite(16, 0x00);

    /* MIC3L/R is not connected to the left ADC PGA */
    I2C0SlaveRegWrite(17, 0xFF);

    /* MIC3L/R is not connected to the right ADC PGA */
    I2C0SlaveRegWrite(18, 0xFF);

    /* power on the Line L1R */
    I2C0SlaveRegWrite(19, 0x04);

    /* power on the Line LIL */
    I2C0SlaveRegWrite(22, 0x04);

    /* power up the left and right DACs */
    I2C0SlaveRegWrite(37, 0xE0);

    /* select the DAC L1 R1 Paths */
    I2C0SlaveRegWrite(41, 0x02);
    I2C0SlaveRegWrite(42, 0x6C);


    /* DAC L to HPLOUT Is connected */
    I2C0SlaveRegWrite(47, 0x80);
    I2C0SlaveRegWrite(51, 0x09);

    /* DAC R to HPROUT is connected */
    I2C0SlaveRegWrite(64, 0x80);
    I2C0SlaveRegWrite(65, 0x09);

    /* DACL1 connected to LINE1 LOUT */
    I2C0SlaveRegWrite(82, 0x80);
    I2C0SlaveRegWrite(86, 0x09);

    /* DACR1 connected to LINE1 ROUT */
    I2C0SlaveRegWrite(92, 0x80);
    I2C0SlaveRegWrite(93, 0x09);

    /* unmute the DAC */
    I2C0SlaveRegWrite(43, 0x00);
    I2C0SlaveRegWrite(44, 0x00);
}

/***************************** End Of File ***********************************/
