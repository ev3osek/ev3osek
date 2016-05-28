/**
 * \file    demoTouch.c
 *
 * \brief   This file contains Touch Screen related functions.
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

#include "i2c.h"
#include "psc.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "Touch.h"
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
#define TOUCH_ENABLE                      ((char)0x40)
#define TSC_STANDBY                       ((char)0x05)
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
#define TSC_MODE                          ((char)0x08)

/* address of ADCONFIG register */
#define ADCONFIG                          ((char)0x07)

/* address of INT register */
#define INT                               ((char)0x02)

/*
** Coordinates of the 'Next' icon displayed on the LCD.
*/
#define NEXT_XMAX                         (470) 
#define NEXT_XMIN                         (420) 
#define NEXT_YMAX                         (262)
#define NEXT_YMIN                         (222)

/*
** Coordinates of the 'Set Time and Date' icon displayed in the RTC slide.
*/

#define RTC_STD_XMIN                      (125)
#define RTC_STD_XMAX                      (340)
#define RTC_STD_YMIN                      (184)
#define RTC_STD_YMAX                      (228)

/* 
** Coordinates of the 'Restart' icon displayed in the 'Thank You' slide.
*/
#define TY_RESTART_XMIN                   (200)
#define TY_RESTART_XMAX                   (275)
#define TY_RESTART_YMIN                   (167)
#define TY_RESTART_YMAX                   (235)

/****************************************************************************
**            EXTERNAL GLOBAL VARIABLES DECLARATIONS                       **
****************************************************************************/
extern unsigned int timerIsrFlag;

/****************************************************************************
**            EXTERNAL GLOBAL FUNCTION DECLARATIONS                        **
****************************************************************************/


/****************************************************************************
**             GLOBAL VARIABLE DEFINITIONS                                 **
****************************************************************************/
unsigned int count = 0, rCount = 0;
volatile unsigned int flag = 1;
unsigned char dataFromSlave[2];
unsigned char dataToPmic[2];
unsigned char data[3];

/* 
** Function pointer which points to either:
** 1> I2CPMICInteract() present in the current file, OR
** 2> I2CLEDInteract() present in <demoI2c.c>
*/
void (*I2CpFunc)(void);

/*******************************************************************************
                INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/

/*
** Initialize touch screen 
*/

 void InitTouchScreen()
{
    volatile unsigned int delay = 0xffff;
    char temp;

    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, 0x48);
    I2CpFunc = I2CPMICInteract;
    
    TSCIntEnable();
    
    TSCStandByMode();

    ReadFromPMIC(INT, &temp);

    while((temp & TOUCH_DETECTED) != 0)
    {
          while(--delay);
          ReadFromPMIC(INT, &temp);
          delay = 0xffff;
    }
    TSCStandByMode();
    ReadFromPMIC(INT, &temp);
}

/*
** Reads the data from registers of Power Management IC(PMIC). 
*/
 void ReadFromPMIC(char regAddr, char*data)
{
    count = 0;
    rCount = 0;
     
    dataToPmic[0] = regAddr;
    SetupI2CTransmit2(1);
    SetupI2CReception(1);

    *data = dataFromSlave[rCount];
}

/* 
** Configures the touch screen into different modes.
*/
 void TSCModeConfig(char modeVal)
{
    WriteToPMIC(TSC_MODE, modeVal);
}

/*
** Enables the analog to digital converter 
*/
 void TSCADCEnable()
{
    char temp;

    ReadFromPMIC(ADCONFIG, &temp);

    temp |= ADC_ENABLE;
 
    WriteToPMIC(ADCONFIG, temp);
}

/*
** Selects the input channel 
*/
 void TSCDACSelect()
{
    char temp;

    ReadFromPMIC(ADCONFIG, &temp);

    temp &= ~INPUT_CHANNEL_MASK;

    temp |= TSC_ADC_INPUT;

    WriteToPMIC(ADCONFIG, temp);
}


/*
** Converts analog input received on touch surface to digital value 
*/
 void TSCStartConversion()
{
    char temp;
    
    ReadFromPMIC(ADCONFIG, &temp);
	
    temp |= ADC_START;

    WriteToPMIC(ADCONFIG, temp);
}

/*
** Reads data from ADRESULT_1 or ADRESULT_2 
*/
 char ReadResult(char regAddr)
{
    char temp;

    ReadFromPMIC(regAddr, &temp);

    return temp;
}

/*
** Writes data to registers in PMIC 
*/
 void WriteToPMIC(char regAddr, char val)
{
    count = 0;

    dataToPmic[0] = regAddr;
    dataToPmic[1] = val;

    SetupI2CTransmit2(2);
}

/*
** Enable touch interrupt 
*/
 void TSCIntEnable()
{
    char temp;

    ReadFromPMIC(INT, &temp);

    temp = TOUCH_ENABLE;

    WriteToPMIC(INT, temp);
}

/*
** Receives data over I2C bus 
*/
 void SetupI2CReception(int count)
{
    I2CSetDataCount(SOC_I2C_0_REGS, count);

    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_RX | I2C_CFG_STOP);

    I2CMasterIntEnableEx(SOC_I2C_0_REGS, I2C_INT_DATA_READY 
                                         | I2C_INT_STOP_CONDITION 
                                         | I2C_INT_NO_ACK);

    I2CMasterStart(SOC_I2C_0_REGS);

    while(flag);

    flag = 1;
}


/*
** Transmits data over I2C bus 
*/
 void SetupI2CTransmit2(int count)
{
    I2CSetDataCount(SOC_I2C_0_REGS, count);

    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX | I2C_CFG_STOP);

    I2CMasterIntEnableEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY 
                                         | I2C_INT_STOP_CONDITION
                                         | I2C_INT_NO_ACK);

    I2CMasterStart(SOC_I2C_0_REGS);

    while(flag);

    flag = 1;
}

/*
** This function will read/write data from/to PMIC through I2C bus.
*/
void I2CPMICInteract(void)
{
    volatile unsigned int intCode = 0;

    /* Get interrupt vector code */
    intCode = I2CInterruptVectorGet(SOC_I2C_0_REGS);

    while(intCode!=0)
    {
         /* Clear status of interrupt */
         IntSystemStatusClear(SYS_INT_I2CINT0);

         if (intCode == I2C_INTCODE_TX_READY)
         {
              /* Put data to data transmit register of i2c */
              I2CMasterDataPut(SOC_I2C_0_REGS, dataToPmic[count++]);
         }  

         if(intCode == I2C_INTCODE_RX_READY)
         {
              /* Receive data from data receive register */
              dataFromSlave[rCount] = I2CMasterDataGet(SOC_I2C_0_REGS);
         }        
   
         if (intCode == I2C_INTCODE_STOP)
         {
	      /* Disable transmit data ready and receive data read interupt */
              I2CMasterIntDisableEx(SOC_I2C_0_REGS,I2C_INT_TRANSMIT_READY|
                                                       I2C_INT_DATA_READY);
              flag = 0;
         }

         if (intCode == I2C_INTCODE_NACK)
         {
             I2CMasterIntDisableEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY |
                                                   I2C_INT_DATA_READY |
                                                   I2C_INT_NO_ACK |
                                                   I2C_INT_STOP_CONDITION);
             /* Generate a STOP */
             I2CMasterStop(SOC_I2C_0_REGS);

             I2CStatusClear(SOC_I2C_0_REGS, I2C_CLEAR_STOP_CONDITION);

             /* Clear interrupt at AINTC, if we missed any, in case of error */

             flag = 0;
         }


         intCode = I2CInterruptVectorGet(SOC_I2C_0_REGS);
    }
}

/*
** This function initializes the touch screen and waits for a touch to happen.
** When the touch screen is pressed, it resolves the coordinates and checks if
** the 'Next' icon was touched. This function returns only if the 'Next' icon 
** is touched.
*/
int TouchWaitProcess()
{
     int xCoOd = 0, yCoOd = 0;
    
     /*Initializes the Touch Screen*/
     InitTouchScreen();  
     while(1)
     { 
          /* wait until touch is detected */
          if(TRUE == WaitForTouch(&timerIsrFlag))
          {
            ResolveCoordinates(&xCoOd, &yCoOd);
            if(TRUE == WasNextTouched(xCoOd, yCoOd))
            {
                break;
            }
        }
    }

    return 0;
}

/*
** This function waits till a touch is detected. 
** In our application, we usually poll for a touch whenever a certain 
** peripheral operation is started and the completion interrupt is awaited.
** Usually in the peripheral's ISR, a flag is set to 1. This function polls
** for either a touch happening or the peripheral's ISR flag being set and 
** returns if any of these actions take place.
**
** This function returns:
** -> TRUE - when a touch on the touch screen has happened.
** -> FALSE - when the interrupt was generated and the ISR flag is set.
**
** Note: Here we pass the address of the ISR flag of the corresponding 
**       peripheral as a parameter to this function.
*/
int WaitForTouch(volatile unsigned int *isrFlag)
{
    char temp;    
    int retVal = FALSE;
    do 
    {
        ReadFromPMIC(INT, &temp);
        /* Checking if the peripheral's ISR has been invoked. */
        if(*isrFlag != 0)
        {
            break;
        }
  
     }while(((temp & TOUCH_DETECTED) == 0));
 
    /* Checking if a touch has been detected. */    
    if((temp & TOUCH_DETECTED)!= 0)
    {
        ReadFromPMIC(INT, &temp);
        retVal = TRUE;
    }
    return retVal;
}


/*
** Reads the x or y cordinates based on mode value 
*/
 void ReadAxis(char mode, char*p1, char*p2)
{
    char result1, result2;
    char temp;

    /* configures touch screen in to different modes,based on mode value */
    TSCModeConfig(mode);

    /* enables the analog to digital convertor */
    TSCADCEnable();

    /* selects the input channel to be used */
    TSCDACSelect();

    /* converts analog value received on surface to digital value */
    TSCStartConversion();

    do {
            ReadFromPMIC(ADCONFIG, &temp);
       }while((temp & ADC_START)!= 0);

    result1 = ReadResult(ADCRESULT1);
    result2 = ReadResult(ADCRESULT2);

    *p1 = result1;

    *p2 = result2;
    
     ReadFromPMIC(INT, &temp);
}
/*
** Put touch screen in stand by mode 
*/
 void TSCStandByMode()
{
    char temp;

    ReadFromPMIC(TSC_MODE, &temp);

    temp = TSC_STANDBY;
 
    WriteToPMIC(TSC_MODE, temp);
}


/*
** This function resolves the coordinates of the location on the 
** touch screen being touched.
*/
void ResolveCoordinates(int *pX, int *pY)
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
    xpos = rx1 + ((unsigned short int)rx2 << 8);

    /*To collect the 10 bits of digital data, 8 present in ry1 and 2 in ry2.*/
    ypos = ry1 + ((unsigned short int)ry2 << 8);

    xDpos = (unsigned int)xpos*DEFAULT_XSCALE + XOFFSET; 
    yDpos = (int)ypos*DEFAULT_YSCALE + YOFFSET;

    yDpos = LCD_HEIGHT - yDpos;

    if(yDpos < 0)
    {
        yDpos = 0;
    }

    /* put touch screen in stand by mode.So that next
     * can be detected 
     */          
    TSCStandByMode();
    
    *pX =(int)xDpos;
    *pY = yDpos;
}

/*
** This function waits for a touch to happen, resolves the coordinates
** of the touch and decides whether 'Next' icon was touched.
**
**
*/


int TouchScreenControl(volatile unsigned int *pIsrFlag)
{
    int xCoOd = 0, yCoOd = 0;
    int retVal = FALSE;
    
    do
    {
    	if(TRUE == WaitForTouch(pIsrFlag))
    	/* Check if any coordinates are */ 
    	{
       	    ResolveCoordinates(&xCoOd, &yCoOd);
            if(TRUE == WasNextTouched(xCoOd, yCoOd))
            {
                retVal = TRUE;
                break;
            } 
    	}
     }while(0 == *pIsrFlag);
    return retVal;
}

int WasNextTouched(int x, int y)
{
    int retVal = FALSE;

    if((x >= NEXT_XMIN) && (x <= NEXT_XMAX))
    {
        if((y >= NEXT_YMIN) && (y <= NEXT_YMAX))
        {
            retVal = TRUE;
        }
    }
   
    return retVal;

}

int WasSetTimeDateTouched(int x, int y)
{
    int retVal = FALSE;

    if((x >= RTC_STD_XMIN) && (x <= RTC_STD_XMAX))
    {
        if((y >= RTC_STD_YMIN) && (y <= RTC_STD_YMAX))
        {
            retVal = TRUE;
        }
    }

    return retVal;
}

int WasRestartTouched(int x, int y)
{
    int retVal = FALSE;

    if((x >= TY_RESTART_XMIN) && (x <= TY_RESTART_XMAX))
    {
        if((y >= TY_RESTART_YMIN) && (y <= TY_RESTART_YMAX))
        {
            retVal = TRUE;
        }
   
    }

    return retVal;
}







