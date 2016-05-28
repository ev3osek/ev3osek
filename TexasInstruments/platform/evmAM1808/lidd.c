/**
 * \file   lidd.c
 *
 * \brief  This file contains the board specific code for enabling the use of
 *         LIDD/character display
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

/* HW Macros */
#include "hw_syscfg0_AM1808.h"
#include "soc_AM1808.h"
#include "hw_types.h"
#include "i2c.h"

#define LIDD_I2C_EXP_CMD_READ_PORT0   (0x00u) /* TCA6416 cmd to read from port0 */
#define LIDD_I2C_EXP_CMD_WRITE_PORT0  (0x02u) /* TCA6416 cmd to write to port0  */
#define LIDD_I2C_EXP_CMD_CONFIG_PORT0 (0x06u) /* TCA6416 cmd to configure port0 */
#define LIDD_I2C_EXP_MASK_LIDD        (0xE0u)

extern void I2CPinMuxSetup(unsigned int instanceNum);

void LIDDPinMuxSetup(void)
{
    unsigned int savePinmux16 = 0;
    unsigned int savePinmux18 = 0;
    unsigned int savePinmux19 = 0;

    savePinmux16 = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(16)) & \
                    ~(SYSCFG_PINMUX16_PINMUX16_11_8  |
                      SYSCFG_PINMUX16_PINMUX16_15_12 |
                      SYSCFG_PINMUX16_PINMUX16_19_16 |
                      SYSCFG_PINMUX16_PINMUX16_23_20 |
                      SYSCFG_PINMUX16_PINMUX16_27_24 |
                      SYSCFG_PINMUX16_PINMUX16_31_28));

    savePinmux18 = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(18)) & \
                    ~(SYSCFG_PINMUX18_PINMUX18_3_0   |
                      SYSCFG_PINMUX18_PINMUX18_7_4   |
                      SYSCFG_PINMUX18_PINMUX18_27_24 |
                      SYSCFG_PINMUX18_PINMUX18_31_28 ));

    savePinmux19 = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) & \
                    ~(SYSCFG_PINMUX19_PINMUX19_3_0  |
                      SYSCFG_PINMUX19_PINMUX19_7_4  |
                      SYSCFG_PINMUX19_PINMUX19_27_24|
                      SYSCFG_PINMUX19_PINMUX19_31_28));

    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(16)) = (0x22222200 | savePinmux16);
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(17)) = 0x22222222;
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(18)) = (0x22000022 | savePinmux18);
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) = (0x02000022 | savePinmux19);
}

/**
 * Read a register content from the TCA6416 slave
 * Reading involves, a write first to the slave to indicate the start of read
 * address. Then a re-start with a read command for the slave to send data
 * from that address
 */
void LIDDTCA6416Read(unsigned int subAddr, char *data, unsigned int length)
{
    unsigned int count = 0;

    /* Set i2c data count register to number of data to be transmit */
    I2CSetDataCount(SOC_I2C_0_REGS, 1);

    /*
    ** Configure i2c has master-transmitter and to generate stop condition
    ** when value in internal data count register count down to zero
    */
    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX);

    I2CMasterStart(SOC_I2C_0_REGS);

    I2CMasterDataPut(SOC_I2C_0_REGS, subAddr);

    /* Set i2c data count register to number of data to be transmit */
    I2CSetDataCount(SOC_I2C_0_REGS, length);

    /* Repeat start a I2C transfer for slave to start transmitting the data */
    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_RX);

    I2CMasterStart(SOC_I2C_0_REGS);

    while (length--)
    {
        while (!(I2CMasterIntStatus(SOC_I2C_0_REGS) & I2C_INT_DATA_READY));
        *(data + count) = (char)I2CMasterDataGet(SOC_I2C_0_REGS);
        count++;
    }

    I2CMasterStop(SOC_I2C_0_REGS);

    /* Wait for the command to complete */
    while (!(I2CMasterIntStatus(SOC_I2C_0_REGS) & I2C_INT_STOP_CONDITION));
}

/**
 * Write to register inside TCA6416 slave
 */
void LIDDTCA6416Write(unsigned int subAddr, char *data, unsigned int length)
{
    unsigned int count = 0;

    /* Data count is length and subAddr) */
    I2CSetDataCount(SOC_I2C_0_REGS, length + 1);

    /*
    ** Configure i2c as master-transmitter and to generate stop condition
    ** when value in internal data count register count down to zero
    */
    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX | I2C_CFG_STOP);

    I2CMasterStart(SOC_I2C_0_REGS);

    I2CMasterDataPut(SOC_I2C_0_REGS, subAddr);

    while (length--)
    {
        while (!(I2CMasterIntStatus(SOC_I2C_0_REGS) & I2C_INT_TRANSMIT_READY));
        I2CMasterDataPut(SOC_I2C_0_REGS, *(data + count));
        count++;
    }

    /* Wait for the command to complete */
    while (!(I2CMasterIntStatus(SOC_I2C_0_REGS) & I2C_INT_STOP_CONDITION));
}

void LIDDI2C0Setup(void)
{
    /* Init I2C0 */
    /* Put i2c in reset/disabled state */
    I2CMasterDisable(SOC_I2C_0_REGS);

    /* Configure i2c bus speed to 100khz */
    I2CMasterInitExpClk(SOC_I2C_0_REGS, 24000000, 8000000, 100000);

    /* Set i2c slave address */
    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, 0x20);
}

void LIDDTCA6416Config(void)
{
    char tca6416_data[2] = {0};

    LIDDI2C0Setup();

    LIDDTCA6416Read(LIDD_I2C_EXP_CMD_CONFIG_PORT0, tca6416_data, 1);

    tca6416_data[0] &= ~LIDD_I2C_EXP_MASK_LIDD;
    LIDDTCA6416Write(LIDD_I2C_EXP_CMD_CONFIG_PORT0, tca6416_data, 1);

    LIDDTCA6416Write(LIDD_I2C_EXP_CMD_WRITE_PORT0, tca6416_data, 1);
}

/**
 * This function enables the LIDD character data path
 * The TCA6416 I/O expander in the UI board needs to be configured
 * The TCA6416 I/O expander is configurable via I2C0 bus
 **/
void LIDDDisplayEnable(void)
{
    I2CPinMuxSetup(0);

    LIDDTCA6416Config();
}

