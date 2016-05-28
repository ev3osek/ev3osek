/**
 *  \file   gameGPIO.c
 *
 *  \brief  This file contains definitions to disable and enable LCD backlight.
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

#include "hw_syscfg0_AM1808.h"
#include "soc_AM1808.h"
#include "hw_types.h"
#include "evmAM1808.h"
#include "psc.h"
#include "gpio.h"

extern void ConfigRasterGpioPins(void);

/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/

/*****************************************************************************
**                       FUNCTION DEFINITION
*****************************************************************************/

/**
 * \brief   This function configures the pin 48 as output.
 *
 * \param   None.
 *
 * \return  None.
 */
void ConfigRasterDisplay(void)
{
    /* The Local PSC number for GPIO is 3. GPIO belongs to PSC1 module.*/
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_GPIO, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    ConfigRasterGpioPins();

    /* Sets the pin 48(GP2[15]) as output.*/
    GPIODirModeSet(SOC_GPIO_0_REGS, 48, GPIO_DIR_OUTPUT);
}

/**
 * \brief   This function disables the backlight.
 *
 * \param   None.
 *
 * \return  None.
 */
void DisableBackLight()
{
    /* write to GP2[15] to disable back light*/
    GPIOPinWrite(SOC_GPIO_0_REGS, 48, 0);
}

/**
 * \brief   This function enables the backlight.
 *
 * \param   None.
 *
 * \return  None.
 */
void EnableBackLight()
{
	/* write to GP2[15] to enable back light*/
    GPIOPinWrite(SOC_GPIO_0_REGS, 48, 1);
}
