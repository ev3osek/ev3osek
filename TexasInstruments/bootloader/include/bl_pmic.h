/**
 * \file  bl_pmic.h
 *
 * \brief This file contains the function prototypes power management API's
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
 
#ifndef      __PMIC_H__
#define      __PMIC_H__

#include "hw_control_AM335x.h"

#ifdef beaglebone
    #include "hw_tps65217.h"
#else
    #include "hw_tps65910.h"
#endif

#include "hw_types.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifndef  beaglebone

/*****************************************************************************
**                   MACRO DEFINITIONS                                   
*****************************************************************************/

#define SMPS_DRIVE_SCLSR_EN1	(0x0u)
#define SMPS_DRIVE_SDASR_EN2	(0x1u)

/*****************************************************************************
**                   FUNCTION DECLARATIONS                                   
*****************************************************************************/
void selectI2CInstance(unsigned int i2cInstance);

/*	VDD2_REG	*/
void configureVdd2(unsigned int opVolMultiplier, unsigned maxLoadCurrent,
					unsigned int timeStep, unsigned int supplyState);

/*	VDD2_OP_REG	*/
void selectVdd2Source(unsigned int vdd1Source);
					
/*	VDD2_OP_REG	*/
void setVdd2OpVoltage(unsigned int opVolSelector);


/*	VDD1_REG	*/
void configureVdd1(unsigned int opVolMultiplier, unsigned maxLoadCurrent,
					unsigned int timeStep, unsigned int supplyState);

/*	VDD1_OP_REG	*/
void selectVdd1Source(unsigned int vdd1Source);
					
/*	VDD1_OP_REG	*/
void setVdd1OpVoltage(unsigned int opVolSelector);


/*	VDD1_SR_REG	*/
void setVdd2SrVoltage(unsigned int opVolSelector);

/*	BCK1_REG
 * 	BCK2_REG
 *	BCK3_REG
 *	BCK4_REG
 *	BCK5_REG
*/

#else

void tps65217_reg_read(unsigned char regOffset, unsigned char* dest);
void tps65217_reg_write(unsigned char port_level, unsigned char regOffset,
                        unsigned char dest_val, unsigned char mask);
void tps65217_voltage_update(unsigned char dc_cntrl_reg, unsigned char volt_sel);

#endif

void configVddOpVoltage(void);

#ifdef __cplusplus
}
#endif

#endif
