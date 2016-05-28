/**
 * \file  rtc.c
 *
 * \brief This file contains the board specific code for enabling the use of
 *        RTC driver.
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
#include "evmAM1808.h"
#include "hw_types.h"

/*****************************************************************************
**                         MACRO DEFINITIONS
*****************************************************************************/

/* Pin multiplexing bit mask to select RTC_ALARM pin for use. */
#define PINMUX0_RTC_ALARM_ENABLE   (SYSCFG_PINMUX0_PINMUX0_31_28_ALARM << \
                                    SYSCFG_PINMUX0_PINMUX0_31_28_SHIFT)

/* Pin multiplexing bit mask to select RTCK pin for use. */
#define PINMUX19_RTCK_ENABLE       (SYSCFG_PINMUX19_PINMUX19_31_28_RTCK << \
                                    SYSCFG_PINMUX19_PINMUX19_31_28_SHIFT)

/*****************************************************************************
**                         FUNCTION DEFINITION
*****************************************************************************/

/**
 * \brief   This function selects the RTC pins for use. The RTC pins are
 *          multiplexed with pins of other peripherals in the System
 *          on Chip(SoC).
 *
 * \param   alarmPinReqd  Through this parameter the user specifies whether 
 *                        the RTC_ALARM pin should be selected or not.
 *                        TRUE - if RTC_ALARM pin need to be selected.
 *                        FALSE - if RTC_ALARM pin need not be selected.
 *
 * \return  None.
 *
 * \note    The parameter specified above is required because the RTC_ALARM
 *          pin is multiplexed with pins of other peripherals which might 
 *          also be used by the application. 
 */


void RTCPinMuxSetup(unsigned int alarmPinReqd)
{
     unsigned int savePinMux = 0;

     if(TRUE == alarmPinReqd)
     {
          /* Preserve the pin values of other pins that will not be accessed*/
          savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) & \
                              ~(SYSCFG_PINMUX0_PINMUX0_31_28);
    
          /* Configure pin for use as RTC_ALARM. */
          HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(0)) = \
               (PINMUX0_RTC_ALARM_ENABLE | savePinMux);
     }

     /* Preserve the pin values of other pins that will not be accessed*/
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) & \
                          ~(SYSCFG_PINMUX19_PINMUX19_31_28);

     /* Configure pin for use as RTCK.*/
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) = (PINMUX19_RTCK_ENABLE | \
                                                      savePinMux);
}

/**
 * \brief  This API returns a unique number which identifies itself
 *         with the RTC IP in AM1808 SoC.
 *
 * \param  None
 *
 * \return This returns a number '1' which is unique to RTC IP in AM1808.
 */

unsigned int RtcVersionGet(void)
{
    return 1;
}

/******************************* End of file ********************************/
