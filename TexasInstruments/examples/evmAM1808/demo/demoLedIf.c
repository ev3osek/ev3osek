/**
 * \file    demoLedIf.c
 *
 * \brief   This file contains LED interface related functions.
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
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "demoCfg.h"
#include "demoI2C.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
/* Command to select Output Register */
#define I2C_EXP_CMD_WRITE_PORT0              (0x02u) 

/* Command to configure port0 */
#define I2C_EXP_CMD_CONFIG_PORT0             (0x06u) 

#define LED_TOGGLE                           (0xC0u)
#define LED_OFF                              (0xC0u)

/*******************************************************************************
**                     INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
static unsigned char ledState = 0;

/*******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
/*
** Configures the I2C for the LED interface
*/
void LedIfConfig(void)
{
    I2C0IfConfig(I2C_SLAVE_EXPANDER_ADDR, 100000);
    I2C0SlaveRegWrite(I2C_EXP_CMD_CONFIG_PORT0, 0x3F);
}

/*
** Toggle the LED state
*/
void LedToggle(void)
{
    ledState ^= LED_TOGGLE;   
    I2C0SlaveRegWrite(I2C_EXP_CMD_WRITE_PORT0, ledState);
}

/*
** Turn the  LED Off.
*/
void LedOff(void)
{
    I2C0SlaveRegWrite(I2C_EXP_CMD_WRITE_PORT0, LED_OFF);
}

/****************************** End of file **********************************/



