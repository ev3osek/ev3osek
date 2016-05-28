/**
 * \file    demoTouch.c
 *
 * \brief   This file contains Touch Screen related functions.
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

#include "hw_types.h"
#include "i2c.h"
#include "psc.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "demoTouch.h"
#include "demoCfg.h"
#include "demoI2C.h"
#include "demoMain.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define INPUT_CHANNEL_MASK                (0x0F)

/* address of the PMIC */
#define I2C_SLAVE_ADDR                    (0x48)
#define DEFAULT_XSCALE                    (0.5096)
#define DEFAULT_YSCALE                    (0.3166)
#define TOUCH_DETECTED                    (0x08)
#define TSC_ADC_INPUT                     (0x0E)
#define TOUCH_ENABLE                      (0x40)
#define TSC_STANDBY                       (0x05)
#define LCD_HEIGHT                        (272)

/* address of ADCRESULT_1 register */
#define ADCRESULT1                        (0x09)

/* address of ADCRESULT_2 register */
#define ADCRESULT2                        (0x0A)
#define ADC_ENABLE                        (0x80)
#define ADC_START                         (0x40)
#define XOFFSET                           (-20)
#define YOFFSET                           (-20)

/* address of TSCMODE register */
#define TSC_MODE                          (8)

/* address of ADCONFIG register */
#define ADCONFIG                          (7)

/* address of INT register */
#define INT                               (2)

/*******************************************************************************
**                   INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
void ReadAxis(char mode, char*p1, char*p2);

/*******************************************************************************
**                     FUNCTION DEFINITIONS
*******************************************************************************/
/*
** Initializes the touch screen 
*/
void TouchInit(void)
{
    volatile unsigned int delay = 0xffff;

    I2C0IfConfig(I2C_SLAVE_PMIC_ADDR, 50000);
    
    I2C0SlaveRegWrite(INT, TOUCH_ENABLE);
   
    I2C0SlaveRegWrite(TSC_MODE, TSC_STANDBY); 

    while((I2C0SlaveRegRead(INT) & TOUCH_DETECTED) != 0)
    {
          while(--delay);
          delay = 0xffff;
    }

    I2C0SlaveRegWrite(TSC_MODE, TSC_STANDBY);
    I2C0SlaveRegRead(INT);
}

/*
** Configures the I2C interface for Touch
*/
void TouchIfConfig(void)
{
    I2C0IfConfig(I2C_SLAVE_PMIC_ADDR, 50000);
}

/*
** Reads the x or y cordinates based on mode value 
*/
void ReadAxis(char mode, char*p1, char*p2)
{
    char result1;
    char result2;

    /* configures touch screen in to different modes,based on mode value */
    I2C0SlaveRegWrite(TSC_MODE, (unsigned char)mode);

    /* enables the analog to digital convertor */
    I2C0SlaveRegBitSet(ADCONFIG, ADC_ENABLE);

    /* selects the input channel to be used */
    I2C0SlaveRegBitClr(ADCONFIG, INPUT_CHANNEL_MASK);
    I2C0SlaveRegBitSet(ADCONFIG, TSC_ADC_INPUT);

    /* converts analog value received on surface to digital value */
    I2C0SlaveRegBitSet(ADCONFIG, ADC_START);

    while((I2C0SlaveRegRead(ADCONFIG) & ADC_START) != 0);

    result1 = I2C0SlaveRegRead(ADCRESULT1);
    result2 = I2C0SlaveRegRead(ADCRESULT2);

    *p1 = (unsigned char)result1;

    *p2 = (unsigned char)result2;
   
    I2C0SlaveRegRead(INT); 
	
	/* put touch screen in stand by mode.So that next
     * can be detected 
     */          
    I2C0SlaveRegWrite(TSC_MODE, TSC_STANDBY);
}

/*
** This function tells if a touch is detected. 
*/
unsigned int TouchDetect(void)
{
    return ((0 == (I2C0SlaveRegRead(INT) & TOUCH_DETECTED)) ? FALSE : TRUE);
}

/*
** This function resolves the coordinates of the location on the 
** touch screen being touched.
*/
void TouchCoOrdGet(int *pX, int *pY)
{
    unsigned short xpos, ypos;
    char x = 0, y =1;
    char rx1 = 0, rx2 = 0;
    char ry1 = 0, ry2 = 0;
    unsigned int xDpos = 0;
    int yDpos = 0;

    /* read x-cordinates */
    ReadAxis(x, &rx1, &rx2);
          
    /* read y cordinates */
    ReadAxis(y, &ry1, &ry2);

    /*To collect the 10 bits of digital data, 8 present in rx1 and 2 in rx2.*/
    xpos = (unsigned char)rx1 + ((unsigned short)rx2 << 8);

    /*To collect the 10 bits of digital data, 8 present in ry1 and 2 in ry2.*/
    ypos = (unsigned char)ry1 + ((unsigned short)ry2 << 8);

    xDpos = xpos * DEFAULT_XSCALE + XOFFSET; 
    yDpos = ypos * DEFAULT_YSCALE + YOFFSET;

    yDpos = LCD_HEIGHT - yDpos;

    if(yDpos < 0)
    {
        yDpos = 0;
    }

    /* put touch screen in stand by mode.So that next
     * can be detected 
     */          
    I2C0SlaveRegWrite(TSC_MODE, TSC_STANDBY);
    
    *pX =(int)xDpos;
    *pY = yDpos;
}

/****************************** End of file **********************************/



