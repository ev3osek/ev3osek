/** 
 * \file   ehrpwm.c
 * 
 *  \brief  This file contains the board specific code for enabling the use of
 *          ehrpwm driver.  
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
/* EVM AM1808 APIs */
#include "evmAM1808.h"

/*****************************************************************************
**                       MACRO DEFINITION
*****************************************************************************/
/* Pin Multiplexing bit mask to select EPWM0A pin */
#define PINMUX3_EPWM0A_ENABLE    (SYSCFG_PINMUX3_PINMUX3_3_0_EPWM0A << \
					SYSCFG_PINMUX3_PINMUX3_3_0_SHIFT)

/* Pin Multiplexing bit mask to select EPWM0B pin. */
#define PINMUX3_EPWM0B_ENABLE	 (SYSCFG_PINMUX3_PINMUX3_7_4_EPWM0B << \
					SYSCFG_PINMUX3_PINMUX3_7_4_SHIFT)

/* Pin Multiplexing bit mask to select EPWM0TZ0 pin. */
#define PINMUX1_EPWM0TZ0_ENABLE	(SYSCFG_PINMUX1_PINMUX1_3_0_EPWM0TZ0 << \
					SYSCFG_PINMUX1_PINMUX1_3_0_SHIFT)

/* Pin Multiplexing bit mask to select EPWM1A pin. */
#define PINMUX5_EPWM1A_ENABLE	(SYSCFG_PINMUX5_PINMUX5_3_0_EPWM1A << \
					SYSCFG_PINMUX5_PINMUX5_3_0_SHIFT)

/* Pin Multiplexing bit mask to select EPWM1B pin. */
#define PINMUX5_EPWM1B_ENABLE	(SYSCFG_PINMUX5_PINMUX5_7_4_EPWM1B << \
					SYSCFG_PINMUX5_PINMUX5_7_4_SHIFT)

/* Pin Multiplexing bit mask to select EPWM1TZ0 pin. */
#define PINMUX2_EPWM1TZ0_ENABLE	(SYSCFG_PINMUX2_PINMUX2_3_0_EPWM1TZ0 << \
					SYSCFG_PINMUX2_PINMUX2_3_0_SHIFT)

/* Pin Multiplexing bit mask to select EPWMSYNCO pin. */
#define PINMUX3_EPWMSYNCO_ENABLE (SYSCFG_PINMUX3_PINMUX3_15_12_EPWMSYNCO << \
					SYSCFG_PINMUX3_PINMUX3_15_12_SHIFT)

/* Pin Multiplexing bit mask to select EPWMSYNCI pin. */
#define	PINMUX3_EPWMSYNCI_ENABLE (SYSCFG_PINMUX3_PINMUX3_11_8_EPWMSYNCI << \
					SYSCFG_PINMUX3_PINMUX3_11_8_SHIFT)

/*****************************************************************************
**                       FUNCTION DEFINITION
*****************************************************************************/
/**
 * \brief  This function does appropriate Pin multiplexing to enable the use of
 * 		pwm0 related pins on the board.
 *          
 * \return  None.
 */

void EHRPWM0PinMuxSetup(void)
{

    /* EPWM0A */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & 
		 (~(SYSCFG_PINMUX3_PINMUX3_3_0))) | (PINMUX3_EPWM0A_ENABLE);

    /* EPWM0B */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & 
		 (~(SYSCFG_PINMUX3_PINMUX3_7_4))) | (PINMUX3_EPWM0B_ENABLE);
    
    /* EPWM0TZ[0] */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(1)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(1)) & (~(SYSCFG_PINMUX1_PINMUX1_3_0))) |
	    	(PINMUX1_EPWM0TZ0_ENABLE);

 
    /* EPWMSYNCO */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & (~(SYSCFG_PINMUX3_PINMUX3_15_12))) |
	    	(PINMUX3_EPWMSYNCO_ENABLE);

    /* EPWMSYNCI */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & (~(SYSCFG_PINMUX3_PINMUX3_11_8))) |
	    	(PINMUX3_EPWMSYNCI_ENABLE);

    /* Enable PWM Clock in chip config reg 1 */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP1) |= SYSCFG_CFGCHIP1_TBCLKSYNC;

}

/**
 * \brief  This function does appropriate Pin multiplexing to enable the use of
 * 		pwm1 related pins on the board.
 *          
 * \return  None.
 */

void EHRPWM1PinMuxSetup(void)
{

    /* EPWM1A */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) & (~(SYSCFG_PINMUX5_PINMUX5_3_0))) |
	    	(PINMUX5_EPWM1A_ENABLE);

    /* EPWM1B */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) & (~(SYSCFG_PINMUX5_PINMUX5_7_4))) |
	    	(PINMUX5_EPWM1B_ENABLE);

    /* EPWM1TZ[0] */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(2)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(2)) & (~(SYSCFG_PINMUX2_PINMUX2_3_0))) |
	    	(PINMUX2_EPWM1TZ0_ENABLE);


    /* EPWMSYNCO */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & (~(SYSCFG_PINMUX3_PINMUX3_15_12))) |
	    	(PINMUX3_EPWMSYNCO_ENABLE);

    /* EPWMSYNCI */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) =  
	    	(HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(3)) & (~(SYSCFG_PINMUX3_PINMUX3_11_8))) |
	    	(PINMUX3_EPWMSYNCI_ENABLE);

    /* Enable PWM Clock in chip config reg 1 */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP1) |= SYSCFG_CFGCHIP1_TBCLKSYNC;

}


