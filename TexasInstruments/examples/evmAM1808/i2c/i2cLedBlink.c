/**
 *  \file     i2cLedBlink.c
 *
 *  \brief    Sample application for i2c.
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

#include "hw_psc_AM1808.h"
#include "soc_AM1808.h"
#include "interrupt.h"
#include "evmAM1808.h"
#include "i2c.h"

/***********************************************************************/
/*                    INTERNAL MACRO DEFINITION                        */ 
/***********************************************************************/

/* I2C address of TCA6416 expander. */
#define I2C_SLAVE_ADDR            (0x21u) 

/* Command byte to select output register. */
#define I2C_EXP_CMD_WRITE_PORT0   (0x02u) 

/* Cmd to TCA6416 to configure port0. */
#define I2C_EXP_CMD_CONFIG_PORT0  (0x06u) 

/* Turn on the LEDs. */
#define I2C_EXP_PORT0_LED_ON      (0x00u) 

/* Turn off the LEDs. */
#define I2C_EXP_PORT0_LED_OFF     (0xc0u) 

/***********************************************************************/
/*                   INTERNAL VARIABLE DEFINITION                      */
/***********************************************************************/
unsigned char dataToSlave[10];
volatile unsigned int count, flag = 1;

/*******************************************************************************
**                   INTERNAL FUNCTION PROTOTYPE
*******************************************************************************/
static void SetupI2CTransmit(void);
static void SetupI2C(void);
static void SetupIntc(void);
static void BlinkDelay(void);

int main(void)
{
    unsigned int num  = 0;

    I2CPinMuxSetup(0);

    /* Configures AINTC to generate interrupt */
    SetupIntc();

    count = 0;

    dataToSlave[0] = I2C_EXP_CMD_CONFIG_PORT0;
    dataToSlave[1] = 0x3f;

    /*
    ** Configures I2C to Master mode to generate start codition
    ** on I2C bus and to transmit data at a bus speed of  100khz
    */
    SetupI2C();
 
   /* Wait for interrupt to occur */

    while(flag);

    dataToSlave[0] = I2C_EXP_CMD_WRITE_PORT0;

    for (num = 100; num != 0; num--)
    {
        count = 0;
        dataToSlave[1] = I2C_EXP_PORT0_LED_ON;

        /*
        **Transmits command byte and data to I/0 expander
        **through I2C bus
        */
        SetupI2CTransmit();

        BlinkDelay();

        count = 0;
        dataToSlave[1] = I2C_EXP_PORT0_LED_OFF;/*data to OFF LED*/

        SetupI2CTransmit();
        BlinkDelay(); 
    }

    while(1);    
}

void I2CIsr(void)
{
    unsigned int intCode = 0;

    /* Get interrupt vector code */
    intCode = I2CInterruptVectorGet(SOC_I2C_0_REGS);

    /* Clear status of interrupt */
    IntSystemStatusClear(SYS_INT_I2CINT0);

    if (intCode == I2C_INTCODE_TX_READY)
    {
         /* Put data to data transmit register of i2c */
         I2CMasterDataPut(SOC_I2C_0_REGS, dataToSlave[count++]);
    }
   
    if (intCode == I2C_INTCODE_STOP)
    {
	/* Disable transmit data ready register */
        I2CMasterIntDisableEx(SOC_I2C_0_REGS,I2C_INT_TRANSMIT_READY);
        flag = 0;
    }
}

static void SetupI2C(void)
{
    /* Put i2c in reset/disabled state */
    I2CMasterDisable(SOC_I2C_0_REGS);

    /* Configure i2c bus speed to 100khz */
    I2CMasterInitExpClk(SOC_I2C_0_REGS, 24000000, 8000000, 100000);

    /* Set i2c slave address */
    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, I2C_SLAVE_ADDR);

    /* Enable transmit data ready and stop condition interrupt */
    I2CMasterIntEnableEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY|I2C_INT_STOP_CONDITION);

    /* Set i2c data count register to number of data to be transmit */
    I2CSetDataCount(SOC_I2C_0_REGS, 2);

    /* 
    ** Configure i2c has master-transmitter and to generate stop condition
    ** when value in internal data count register count down to zero
    */
    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX | I2C_CFG_STOP);
  
    /* Bring i2c out of reset */
    I2CMasterEnable(SOC_I2C_0_REGS);

    /* Generate start condition on i2c bus */
    I2CMasterStart(SOC_I2C_0_REGS);
}

/*
** Set up the AINTC to generate I2C interrup
**
*/
static void SetupIntc(void)
{
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_I2CINT0, I2CIsr);
    
    /* Set the channnel number 2 of AINTC for system interrupt 61.
     * Channel 2 is mapped to IRQ interrupt of ARM9.
     */
    IntChannelSet(SYS_INT_I2CINT0, 2);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_I2CINT0);

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

static void SetupI2CTransmit(void)
{
    I2CSetDataCount(SOC_I2C_0_REGS, 2);

    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX | I2C_CFG_STOP);

    I2CMasterIntEnableEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY|I2C_INT_STOP_CONDITION);

    I2CMasterStart(SOC_I2C_0_REGS);
}

static void BlinkDelay(void)
{
    volatile unsigned int delay = 0x7FFFF;

    while(delay--);
}


/********************************** End of file *****************************/
