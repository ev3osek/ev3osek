/**
 * \file  bl_pmI2c.c
 *
 * \brief This file contains the API's of I2C API which are used to 
 *        communicate with pmic,which is an i2c slave device.
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

#include "bl_config.h"
#include "hsi2c.h"
#include "evmAM335x.h"
 
volatile unsigned char dataFromSlave[2];
volatile unsigned char dataToSlave[3];
volatile unsigned int tCount;
volatile unsigned int rCount;
volatile unsigned int flag = 1;
volatile unsigned int numOfBytes;

/******************************************************************************
**              INTERNAL FUNCTION PROTOTYPES
******************************************************************************/
void I2CIsr(void);
void SetupI2C(void);
void I2CAintcConfigure(void);
void cleanupInterrupts(void);
extern void I2C1ModuleClkConfig(void);
void SetupI2CTransmit(unsigned int dcount);
void SetupReception(unsigned int dcount);

/******************************************************************************
**                      MACROS
*******************************************************************************/
/*	I2C instance	*/
#define  I2C_0					         	(0x0u)

/*	System clock fed to I2C module - 48Mhz	*/
#define  I2C_SYSTEM_CLOCK					(48000000u)

/*	Internal clock used by I2C module - 12Mhz	*/
#define  I2C_INTERNAL_CLOCK					(12000000u)

/*	I2C bus speed or frequency - 100Khz	*/
#define	 I2C_OUTPUT_CLOCK					(100000u)



/******************************************************************************
**                      INTERNAL FUNCTION DEFINITIONS
*******************************************************************************/

/*
** Configure I2C0 on which the PMIC is interfaced
*/
void SetupI2C(void)
{
    I2C0ModuleClkConfig();

    I2CPinMuxSetup(I2C_0);

    /* Put i2c in reset/disabled state */
    I2CMasterDisable(SOC_I2C_0_REGS);
	
    I2CSoftReset(SOC_I2C_0_REGS);
	
    /* Disable auto Idle functionality */
    I2CAutoIdleDisable(SOC_I2C_0_REGS);

    /* Configure i2c bus speed to 100khz */
    I2CMasterInitExpClk(SOC_I2C_0_REGS, I2C_SYSTEM_CLOCK, I2C_INTERNAL_CLOCK,
							   I2C_OUTPUT_CLOCK);
    I2CMasterEnable(SOC_I2C_0_REGS);
	
    while(!I2CSystemStatusGet(SOC_I2C_0_REGS));
}

/******************************************************************************
**              FUNCTION DEFINITIONS
******************************************************************************/

/*
** Transmits data over I2C0 bus 
*/
void SetupI2CTransmit(unsigned int dcount)
{
    I2CSetDataCount(SOC_I2C_0_REGS, dcount);

    cleanupInterrupts();
	
    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX);

    I2CMasterStart(SOC_I2C_0_REGS);

    while(I2CMasterBusBusy(SOC_I2C_0_REGS) == 0);

    while((I2C_INT_TRANSMIT_READY == (I2CMasterIntRawStatus(SOC_I2C_0_REGS) & I2C_INT_TRANSMIT_READY))
           && dcount--)
    {
        I2CMasterDataPut(SOC_I2C_0_REGS, dataToSlave[tCount++]);

        I2CMasterIntClearEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY);
    }

    I2CMasterStop(SOC_I2C_0_REGS);

    while(0 == (I2CMasterIntRawStatus(SOC_I2C_0_REGS) & I2C_INT_STOP_CONDITION));

    I2CMasterIntClearEx(SOC_I2C_0_REGS, I2C_INT_STOP_CONDITION);

}

/*
** Receives data over I2C0 bus 
*/
void SetupReception(unsigned int dcount)
{
    I2CSetDataCount(SOC_I2C_0_REGS, 1);

    cleanupInterrupts();

    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX);

    I2CMasterStart(SOC_I2C_0_REGS);

    while(I2CMasterBusBusy(SOC_I2C_0_REGS) == 0);

    I2CMasterDataPut(SOC_I2C_0_REGS, dataToSlave[tCount]);

    I2CMasterIntClearEx(SOC_I2C_0_REGS, I2C_INT_TRANSMIT_READY);

    while(0 == (I2CMasterIntRawStatus(SOC_I2C_0_REGS) & I2C_INT_ADRR_READY_ACESS));
	
    I2CSetDataCount(SOC_I2C_0_REGS, dcount);

    cleanupInterrupts();
	
    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_RX);

    I2CMasterStart(SOC_I2C_0_REGS);

    while(I2CMasterBusBusy(SOC_I2C_0_REGS) == 0);

    while((dcount--))
    {
        while(0 == (I2CMasterIntRawStatus(SOC_I2C_0_REGS) & I2C_INT_RECV_READY));

        dataFromSlave[rCount++] = I2CMasterDataGet(SOC_I2C_0_REGS);

        I2CMasterIntClearEx(SOC_I2C_0_REGS, I2C_INT_RECV_READY);
    }

    I2CMasterStop(SOC_I2C_0_REGS);

    while(0 == (I2CMasterIntRawStatus(SOC_I2C_0_REGS) & I2C_INT_STOP_CONDITION));

    I2CMasterIntClearEx(SOC_I2C_0_REGS, I2C_INT_STOP_CONDITION);
}

/* Clear the status of all interrupts */
void cleanupInterrupts(void)
{
    I2CMasterIntClearEx(SOC_I2C_0_REGS,  0x7FF);
}

