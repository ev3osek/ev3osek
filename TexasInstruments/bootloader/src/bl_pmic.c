/**
 * \file  bl_pmic.c
 *
 * \brief PMIC APIs for StarterWare bootloader
 *
 * This file contains APIs to access PMIC registers
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

#include "hsi2c.h"
#include "bl_config.h"
#include "bl_pmic.h"


/******************************************************************************
**              INTERNAL MACRO DEFINITIONS
******************************************************************************/
/* Address of TPS65910A (PMIC - SR)  over I2C0 */
#define  PMIC_SR_I2C_SLAVE_ADDR     (0x12)

/******************************************************************************
**              GLOBAL VARIABLE DEFINITIONS
******************************************************************************/
extern volatile unsigned char dataFromSlave[2];
extern volatile unsigned char dataToSlave[3];
extern volatile unsigned int tCount;
extern volatile unsigned int rCount;
extern volatile unsigned int flag;
extern volatile unsigned int numOfBytes;

/******************************************************************************
**              INTERNAL FUNCTION PROTOTYPES
******************************************************************************/
extern void SetupI2C(void);
extern void SetupI2CTransmit(unsigned int dcount);
extern void SetupReception(unsigned int dcount);


void configVddOpVoltage(void)
{
    SetupI2C();

    #ifdef beaglebone

    unsigned char pmic_status = 0;

    /* Configure PMIC slave address */
    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, PMIC_TPS65217_I2C_SLAVE_ADDR);

    tps65217_reg_read(STATUS, &pmic_status);

    /* Increase USB current limit to 1300mA */
    tps65217_reg_write(PROT_LEVEL_NONE, POWER_PATH, USB_INPUT_CUR_LIMIT_1300MA,
                       USB_INPUT_CUR_LIMIT_MASK);

    /* Set DCDC2 (MPU) voltage to 1.275V */
    tps65217_voltage_update(DEFDCDC2, DCDC_VOLT_SEL_1275MV);

    /* Set LDO3, LDO4 output voltage to 3.3V */
    tps65217_reg_write(PROT_LEVEL_2, DEFLS1, LDO_VOLTAGE_OUT_3_3, LDO_MASK);


    tps65217_reg_write(PROT_LEVEL_2, DEFLS2, LDO_VOLTAGE_OUT_3_3, LDO_MASK);

   #else
    /* Configure PMIC slave address */
    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, PMIC_CNTL_I2C_SLAVE_ADDR);
	
	/* Select SR I2C(0) */
    selectI2CInstance(PMIC_DEVCTRL_REG_SR_CTL_I2C_SEL_CTL_I2C);

    /* Configure vdd1- need to validate these parameters */
    configureVdd1(PMIC_VDD1_REG_VGAIN_SEL_X1, PMIC_VDD1_REG_ILMAX_1_5_A,
		 PMIC_VDD1_REG_TSTEP_12_5, PMIC_VDD1_REG_ST_ON_HI_POW);
	
    /* Select the source for VDD1 control */
    selectVdd1Source(PMIC_VDD1_OP_REG_CMD_OP);

    #endif
}

#ifdef beaglebone
/**
 * tps65217_reg_read() - Generic function that can read a TPS65217 register
 * @regOffset:          Source register address
 * @src_val:          Address of destination variable
 */
void tps65217_reg_read(unsigned char regOffset, unsigned char* dest)
{
    dataToSlave[0] = regOffset;
    tCount = 0;

    SetupReception(1);

    *dest = dataFromSlave[0];
}

/**
 *  tps65217_reg_write() - Generic function that can write a TPS65217 PMIC
 *                         register or bit field regardless of protection
 *                         level.
 *
 *  @prot_level:        Register password protection.
 *                      use PROT_LEVEL_NONE, PROT_LEVEL_1, or PROT_LEVEL_2
 *  @regOffset:         Register address to write.
 *  @dest_val:          Value to write.
 *  @mask:              Bit mask (8 bits) to be applied.  Function will only
 *                      change bits that are set in the bit mask.
 *
 *  @return:            None.
 */
void tps65217_reg_write(unsigned char port_level, unsigned char regOffset,
                        unsigned char dest_val, unsigned char mask)
{
    unsigned char read_val;
    unsigned xor_reg;

    dataToSlave[0] = regOffset;
    tCount = 0;
    rCount = 0;

    if(mask != MASK_ALL_BITS)
    {
         SetupReception(1);

         read_val = dataFromSlave[0];
         read_val &= (~mask);
         read_val |= (dest_val & mask);
         dest_val = read_val; 
    }

    if(port_level > 0)
    {
         xor_reg = regOffset ^ PASSWORD_UNLOCK;

         dataToSlave[0] = PASSWORD; 
         dataToSlave[1] = xor_reg;
         tCount = 0;
 
         SetupI2CTransmit(2);
    }

    dataToSlave[0] = regOffset; 
    dataToSlave[1] = dest_val;
    tCount = 0;
 
    SetupI2CTransmit(2);

    if(port_level == PROT_LEVEL_2)
    {
         dataToSlave[0] = PASSWORD; 
         dataToSlave[1] = xor_reg;
         tCount = 0;
 
         SetupI2CTransmit(2);
         
         dataToSlave[0] = regOffset; 
         dataToSlave[1] = dest_val;
         tCount = 0;
 
         SetupI2CTransmit(2);
    }
}

/**
 *  tps65217_voltage_update() - Controls output voltage setting for the DCDC1,
 *       DCDC2, or DCDC3 control registers in the PMIC.
 *
 *  @dc_cntrl_reg:      DCDC Control Register address.
 *                      Must be DEFDCDC1, DEFDCDC2, or DEFDCDC3.
 *  @volt_sel:          Register value to set.  See PMIC TRM for value set.
 *
 *  @return:            None.
 */
void tps65217_voltage_update(unsigned char dc_cntrl_reg, unsigned char volt_sel)
{
    /* set voltage level */
    tps65217_reg_write(PROT_LEVEL_2, dc_cntrl_reg, volt_sel, MASK_ALL_BITS);

    /* set GO bit to initiate voltage transition */
    tps65217_reg_write(PROT_LEVEL_2, DEFSLEW, DCDC_GO, DCDC_GO);
}

#else

/*#################*/
/*
** Configure vdd2 for various parameters such as 
** 		-	Multiplier
** 		-	Maximum Load Current
** 		-	Time step - voltage change per us(micro sec)
** 		-	Supply state (on (high/low power mode), off)
*/
void configureVdd2(unsigned int opVolMultiplier, unsigned maxLoadCurrent,
							unsigned int timeStep, unsigned int supplyState)
{
    dataToSlave[0] = VDD2_REG;
    dataToSlave[1] = (
	               (opVolMultiplier << PMIC_VDD2_REG_VGAIN_SEL_SHIFT) |
		       (maxLoadCurrent << PMIC_VDD2_REG_ILMAX_SHIFT)      |
		       (timeStep << PMIC_VDD2_REG_TSTEP_SHIFT)            |
		       (supplyState << PMIC_VDD2_REG_ST_SHIFT)
					 );
    tCount = 0;
    rCount = 0;	
    SetupI2CTransmit(2);
}


/*
** Select the VDD2 value. VDD2_OP_REG or VDD2_SR_REG.
*/
void selectVdd2Source(unsigned int vdd1Source)
{
    /*	Read reg value	*/
    dataToSlave[0] = VDD2_OP_REG;
    dataFromSlave[0] = 0; // clear receive buffer
    dataFromSlave[1] = 0;
    rCount = 0;
    tCount = 0;
    SetupReception(1);

    /*	Modify reg value	*/
    vdd1Source = (dataFromSlave[0] & (~PMIC_VDD2_OP_REG_CMD)) | 
		 (vdd1Source << PMIC_VDD2_OP_REG_CMD_SHIFT);
	
	/*	Write reg value	*/
    dataToSlave[0] = VDD2_OP_REG;
    dataToSlave[1] = vdd1Source;
    tCount = 0;
    rCount = 0;

    SetupI2CTransmit(2);	
}


/*
** set VDD2_OP voltage value
*/
void setVdd2OpVoltage(unsigned int opVolSelector)
{
    /*	Read reg value	*/
    dataToSlave[0] = VDD2_OP_REG;
    dataFromSlave[0] = 0; // clear receive buffer
    dataFromSlave[1] = 0;
    rCount = 0;
    tCount = 0;
    SetupReception(1);

    /*	Modify reg value	*/
    opVolSelector = (dataFromSlave[0] & (~PMIC_VDD2_OP_REG_SEL)) | 
		    (opVolSelector << PMIC_VDD2_OP_REG_SEL_SHIFT);
	
    /*	Write reg value	*/
    dataToSlave[0] = VDD2_OP_REG;
    dataToSlave[1] = opVolSelector;
    tCount = 0;
    rCount = 0;	
    SetupI2CTransmit(2);	
	
     /*	Read reg value to verify */
    dataToSlave[0] = VDD2_OP_REG;
    dataFromSlave[0] = 0; // clear receive buffer
    dataFromSlave[1] = 0;
    rCount = 0;
    tCount = 0;

    SetupReception(1);
	
    while((dataFromSlave[0] & PMIC_VDD2_OP_REG_SEL) != (opVolSelector << PMIC_VDD2_OP_REG_SEL_SHIFT));
}


/*
** set VDD2_SR voltage value
*/
void setVdd2SrVoltage(unsigned int opVolSelector)
{
    /*	Write reg value	*/
    dataToSlave[0] = VDD2_SR_REG;
    dataToSlave[1] = opVolSelector;
    tCount = 0;
    SetupI2CTransmit(2);	
}


/*
** Select I2C interface whether SR I2C or Control I2C
*/
void selectI2CInstance(unsigned int i2cInstance)
{
    /*	Read reg value	*/
    dataToSlave[0] = DEVCTRL_REG;
    dataFromSlave[0] = 0; // clear receive buffer
    dataFromSlave[1] = 0;
    rCount = 0;
    tCount = 0;
    SetupReception(1);

    /*	Modify reg value */
    i2cInstance = (dataFromSlave[0] & PMIC_DEVCTRL_REG_SR_CTL_I2C_SEL) | 
		  (i2cInstance << PMIC_DEVCTRL_REG_SR_CTL_I2C_SEL_SHIFT);
	
    /*	Write reg value	*/
    dataToSlave[0] = DEVCTRL_REG;
    dataToSlave[1] = i2cInstance;
    tCount = 0;
    rCount = 0;

    SetupI2CTransmit(2);
}

/*
** Configure VDD1 for various parameters such as 
** 		-	Multiplier
** 		-	Maximum Load Current
** 		-	Time step - voltage change per us(micro sec)
** 		-	Supply state (on (high/low power mode), off)
*/
void configureVdd1(unsigned int opVolMultiplier, unsigned maxLoadCurrent,
							unsigned int timeStep, unsigned int supplyState)
{
    dataToSlave[0] = VDD1_REG;
    dataToSlave[1] = (
						(opVolMultiplier << PMIC_VDD1_REG_VGAIN_SEL_SHIFT) |
						(maxLoadCurrent << PMIC_VDD1_REG_ILMAX_SHIFT) |
						(timeStep << PMIC_VDD1_REG_TSTEP_SHIFT) |
						(supplyState << PMIC_VDD1_REG_ST_SHIFT)
					 );
    tCount = 0;
    rCount = 0;	
    SetupI2CTransmit(2);
}



/*
** Select the VDD1 value. VDD1_OP_REG or VDD1_SR_REG.
*/
void selectVdd1Source(unsigned int vdd1Source)
{
    /*	Read reg value	*/
    dataToSlave[0] = VDD1_OP_REG;
    dataFromSlave[0] = 0; // clear receive buffer
    dataFromSlave[1] = 0;
    rCount = 0;
    tCount = 0;
    SetupReception(1);

    /*	Modify reg value */
    vdd1Source = (dataFromSlave[0] & (~PMIC_VDD1_OP_REG_CMD)) | 
		 (vdd1Source << PMIC_VDD1_OP_REG_CMD_SHIFT);
	
     /*	Write reg value	*/
    dataToSlave[0] = VDD1_OP_REG;
    dataToSlave[1] = vdd1Source;
    tCount = 0;
    rCount = 0;
    SetupI2CTransmit(2);	
}


/*
** set VDD1_OP voltage value
*/
void setVdd1OpVoltage(unsigned int opVolSelector)
{
    /*	Read reg value	*/
    dataToSlave[0] = VDD1_OP_REG;
    dataFromSlave[0] = 0; // clear receive buffer
    dataFromSlave[1] = 0;
    rCount = 0;
    tCount = 0;
    SetupReception(1);

    /*	Modify reg value */
    opVolSelector = (dataFromSlave[0] & (~PMIC_VDD1_OP_REG_SEL)) | 
		    (opVolSelector << PMIC_VDD1_OP_REG_SEL_SHIFT);
	
    /*	Write reg value	*/
    dataToSlave[0] = VDD1_OP_REG;
    dataToSlave[1] = opVolSelector;
    tCount = 0;
    rCount = 0;	
    SetupI2CTransmit(2);	
	
    /*	Read reg value to verify */
    dataToSlave[0] = VDD1_OP_REG;
    dataFromSlave[0] = 0; // clear receive buffer
    dataFromSlave[1] = 0;
    rCount = 0;
    tCount = 0;
    SetupReception(1);
	
    while((dataFromSlave[0] & PMIC_VDD1_OP_REG_SEL) != (opVolSelector << PMIC_VDD1_OP_REG_SEL_SHIFT));

}

#endif
