/**
 * \file  gameI2C0.c
 *
 * \brief Functionis to configure a slave trough i2c.
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

#include "soc_AM1808.h"
#include "interrupt.h"
#include "hw_syscfg0_AM1808.h"
#include "i2c.h"
#include "gameI2C.h"
/*******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
#define I2C0IsBusy()             I2CMasterIsBusy(SOC_I2C_0_REGS)
                       

/*******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void I2C0Isr(void);

/*******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
static volatile unsigned int slaveData[3];

static volatile unsigned int dataIdx = 0;
static volatile unsigned int txCompFlag = 1;

/*******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
/*
** Sets up the I2C interrupt in the AINTC
*/
void I2C0IntRegister(unsigned int channel)
{
#ifdef _TMS320C6X
	IntRegister(C674X_MASK_INT5, I2C0Isr);
	IntEventMap(C674X_MASK_INT5, SYS_INT_I2C0_INT);
	IntEnable(C674X_MASK_INT5);
#else
    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_I2CINT0, I2C0Isr);
    IntChannelSet(SYS_INT_I2CINT0, channel);
#endif
}

/*
** Initializes the I2C interface for a slave
*/
void I2C0IfConfig(unsigned int slaveAddr, unsigned int speed)
{
    /* Put i2c in reset/disabled state */
    I2CMasterDisable(SOC_I2C_0_REGS);

    /* Configure i2c bus speed to 100khz */
    I2CMasterInitExpClk(SOC_I2C_0_REGS, 24000000, 8000000, speed);

    /* Set i2c slave address */
    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, slaveAddr);

    I2CMasterEnable(SOC_I2C_0_REGS);
}

/*
** Function to send data through i2c
*/
void I2C0SendBlocking(unsigned int dataCnt)
{
    txCompFlag = 1;
    dataIdx = 0;    

    while(I2C0IsBusy());

    I2CSetDataCount(SOC_I2C_0_REGS, dataCnt);

    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX | I2C_CFG_STOP);

    I2CMasterIntEnableEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY 
                                         | I2C_INT_STOP_CONDITION
                                         | I2C_INT_NO_ACK);

    I2CMasterStart(SOC_I2C_0_REGS);
   
    /* Wait till the data is sent */ 
    while(txCompFlag);

    while(I2C0IsBusy());
}

/*
** Function to receive data from the Codec through I2C bus
*/
void I2C0RcvBlocking(unsigned int dataCnt)
{
    txCompFlag = 1;
    dataIdx = 0;

    while(I2C0IsBusy());

    I2CSetDataCount(SOC_I2C_0_REGS, dataCnt);

    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_RX | I2C_CFG_STOP);

    I2CMasterIntEnableEx(SOC_I2C_0_REGS, I2C_INT_DATA_READY 
                                         | I2C_INT_STOP_CONDITION
                                         | I2C_INT_NO_ACK);

    I2CMasterStart(SOC_I2C_0_REGS);

    /* Wait till data is received fully */
    while(txCompFlag);

    while(I2C0IsBusy());
}

/*
** ISR to handler i2c interrupts
*/
static void I2C0Isr(void)
{
    volatile unsigned int intCode = 0;

    /* Get interrupt vector code */
    intCode = I2CInterruptVectorGet(SOC_I2C_0_REGS);

    while(intCode!=0)
    {
         /* Clear status of interrupt */
#ifdef _TMS320C6X
    	IntEventClear(SYS_INT_I2C0_INT);
#else
        IntSystemStatusClear(15);
#endif

         if (intCode == I2C_INTCODE_TX_READY)
         {
              I2CMasterDataPut(SOC_I2C_0_REGS, slaveData[dataIdx]);
              dataIdx++;
         }

         if(intCode == I2C_INTCODE_RX_READY)
         {
              slaveData[dataIdx] = I2CMasterDataGet(SOC_I2C_0_REGS);
              dataIdx++;
         }

         if (intCode == I2C_INTCODE_STOP)
         {
             I2CMasterIntDisableEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY |
                                                   I2C_INT_DATA_READY |
                                                   I2C_INT_NO_ACK |
                                                   I2C_INT_STOP_CONDITION);
              txCompFlag = 0;
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
#ifdef _TMS320C6X
             IntEventClear(SYS_INT_I2C0_INT);
#else
             IntSystemStatusClear(15);
#endif

             txCompFlag = 0;
         }

         if (I2CMasterIntStatus(SOC_I2C_0_REGS) & I2C_ICSTR_NACKSNT)
         {
             I2CMasterIntDisableEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY |
                                                   I2C_INT_DATA_READY |
                                                   I2C_INT_NO_ACK |
                                                   I2C_INT_STOP_CONDITION);

             /* Generate a STOP */
             I2CMasterStop(SOC_I2C_0_REGS);
 
             I2CStatusClear(SOC_I2C_0_REGS, (I2C_CLEAR_NO_ACK_SENT |
                                             I2C_CLEAR_STOP_CONDITION));

             /* Clear interrupt at AINTC, if we missed any, in case of error */ 
#ifdef _TMS320C6X
             IntEventClear(SYS_INT_I2C0_INT);
#else
             IntSystemStatusClear(15);
#endif

             txCompFlag = 0;
         }

         intCode = I2CInterruptVectorGet(SOC_I2C_0_REGS);
    }
}

/*
** Writes a slave register with the given data value
*/
void I2C0SlaveRegWrite(unsigned char regAddr, unsigned char regData)
{
    /* Send the register address and data */
    slaveData[0] = regAddr;
    slaveData[1] = regData;

    I2C0SendBlocking(2);
}

/*
** Reads a slave register contents
*/
unsigned char I2C0SlaveRegRead(unsigned char regAddr)
{
    /* Send the register address */
    slaveData[0] = regAddr;
    I2C0SendBlocking(1);

    /* Receive the register contents in slaveData */
    I2C0RcvBlocking(1);

    return (slaveData[0]);
}

/*
** Sets I2C slave register bit specified in the bit mask
*/
void I2C0SlaveRegBitSet(unsigned char regAddr, unsigned char bitMask)
{
    /* Send the register address */
    slaveData[0] = regAddr;
    I2C0SendBlocking(1);

    /* Receive the register contents in slaveData */
    I2C0RcvBlocking(1);

    slaveData[1] =  slaveData[0] | bitMask;
    slaveData[0] = regAddr;

    I2C0SendBlocking(2);
}

/*
** Clears slave register bits specified in the bit mask
*/
void I2C0SlaveRegBitClr(unsigned char regAddr, unsigned char bitMask)
{
    /* Send the register address */
    slaveData[0] = regAddr;
    I2C0SendBlocking(1);

    /* Receive the register contents in slaveData */
    I2C0RcvBlocking(1);

    slaveData[1] =  slaveData[0] & ~bitMask;
    slaveData[0] = regAddr;

    I2C0SendBlocking(2);
}

/***************************** End Of File ***********************************/
