/**
 * \file    demoTimer.c
 *
 * \brief   This file contains Timer related functions.
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

#include "hw_types.h"
#include "interrupt.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "demoRtc.h"
#include "rtc.h"
#include "uartStdio.h"

/*******************************************************************************
**                       INTERNAL MACRO DEFINITIONS
*******************************************************************************/
#define MASK_HOUR                        (0xFF000000u)
#define MASK_MIN                         (0x00FF0000u)
#define MASK_SEC                         (0x0000FF00u)
#define MASK_MERIDIEM                    (0x000000FFu)

#define SHIFT_HOUR                       (24u)
#define SHIFT_MIN                        (16u)
#define SHIFT_SEC                        (8u)

#define MASK_DAY                         (0xFF000000u)
#define MASK_MON                         (0x00FF0000u)
#define MASK_YEAR                        (0x0000FF00u)
#define MASK_DOTW                        (0x000000FFu)

#define SHIFT_DAY                        (24u)
#define SHIFT_MON                        (16u)
#define SHIFT_YEAR                       (8u)

/*******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/
static void RTCIsr(void);

/*******************************************************************************
**                      INTERNAL VARIABLE DEFINITIONS
*******************************************************************************/
unsigned int rtcSetFlag = FALSE;
unsigned int rtcSecUpdate = FALSE;

/*******************************************************************************
**                     FUNCTION DEFINITIONS
*******************************************************************************/
/*
** Registers RTC interrupts
*/
#ifdef _TMS320C6X
void RtcIntRegister(unsigned int cpuINT)
{
    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(cpuINT, RTCIsr);
    IntEventMap(cpuINT, SYS_INT_RTC_IRQS);
}
#else
void RtcIntRegister(unsigned int channel)
{
    /* Register the ISR in the Interrupt Vector Table.*/
    IntRegister(SYS_INT_RTC, RTCIsr);
    IntChannelSet(SYS_INT_RTC, channel);
}
#endif

/*
** Enables RTC seconds interrupt
*/
void RtcSecIntEnable(void)
{
    /* Enable interrupts to be generated on every second.*/
    RTCIntTimerEnable(SOC_RTC_0_REGS, RTC_INT_EVERY_SECOND);
}

/*
** Initializes the RTC peripheral
*/
void RtcInit(void)
{
    /* Disabling Write Protection for RTC registers.*/
    RTCWriteProtectDisable(SOC_RTC_0_REGS);

    RTCEnable(SOC_RTC_0_REGS);
}

/*
** Sets the Time and Calender in the RTC. This is a blocking call. 
** The time and date are entered through UART.
*/
void RtcTimeCalSet(void)
{
    unsigned int time = 0; 
    unsigned int cal = 0;
    unsigned int temp = 0; 
 
    UARTPuts("\n\rEnter Hours (0 to 24):", -1);
    temp = UARTGetNum();

    while(temp > 24)
    {
        UARTPuts("\n\rValue entered is invalid. Enter value:", -1);
        temp = UARTGetNum();
    }

    time = (((temp / 10) << 4) << SHIFT_HOUR)
            | ((temp % 10) << SHIFT_HOUR);

    UARTPuts("\n\rEnter Minutes (0 to 59):", -1);
    temp = UARTGetNum();

    while(temp > 59)
    {
        UARTPuts("\n\rValue entered is invalid. Enter value:", -1);
        temp = UARTGetNum();
    }

    time |= (((temp / 10) << 4) << SHIFT_MIN)
            | ((temp % 10) << SHIFT_MIN);
 
    UARTPuts("\n\rEnter Seconds (0 to 59):", -1);
    temp = UARTGetNum();

    while(temp > 59)
    {
        UARTPuts("\n\rValue entered is invalid. Enter value:", -1);
        temp = UARTGetNum();
    }

    time |= (((temp / 10) << 4) << SHIFT_SEC)
             | ((temp % 10) << SHIFT_SEC);

    UARTPuts("\n\rEnter Date (1 to 31):", -1);
    temp = UARTGetNum();

    while((temp > 31) || (0 == temp))
    {
        UARTPuts("\n\rValue entered is invalid. Enter value:", -1);
        temp = UARTGetNum();
    }

    cal = (((temp / 10) << 4) << SHIFT_DAY)
           | ((temp % 10) << SHIFT_DAY);

    UARTPuts("\n\rEnter Month (1 to 12):", -1);
    temp = UARTGetNum();

    while((temp > 12) || (0 == temp))
    {
        UARTPuts("\n\rValue entered is invalid. Enter value:", -1);
        temp = UARTGetNum();
    }

    cal |= (((temp / 10) << 4) << SHIFT_MON)
            | ((temp % 10) << SHIFT_MON);

    UARTPuts("\n\rEnter Year (0 to 99):", -1);
    temp = UARTGetNum();
    while(temp > 99)
    {
        UARTPuts("\n\rValue entered is invalid. Enter value:", -1);
        temp = UARTGetNum();
    }

    cal |= (((temp / 10) << 4) << SHIFT_YEAR)
            | ((temp % 10) << SHIFT_YEAR);

    UARTPuts("\n\rEnter Day Of the week (0 for Sunday...6 for Saturday):", -1);
    temp = UARTGetNum();

    while(temp > 6)
    {
        UARTPuts("\n\rValue entered is invalid. Enter value:", -1);
        temp = UARTGetNum();
    }

    cal |= (((temp / 10) << 4)) | ((temp % 10));
 
    /* Set the calendar registers of RTC with received calendar information.*/
    RTCCalendarSet(SOC_RTC_0_REGS, cal);

    /* Set the time registers of RTC with the received time information.*/
    RTCTimeSet(SOC_RTC_0_REGS, time);

    /* Run the RTC. The seconds tick from now on.*/
    RTCRun(SOC_RTC_0_REGS);
 
    UARTPuts("\n\rThe Time and Date are set successfully! \n\n\r", -1);

    rtcSetFlag = TRUE;
}

/*
** Displays the Time and Date on the UART console
*/
void RtcTimeCalDisplay(void)
{
    unsigned int time = 0;
    unsigned int cal = 0;
    unsigned int temp;
 
    UARTPuts("\r", -1);

    time = RTCTimeGet(SOC_RTC_0_REGS);
    UARTPuts("Current Time And Date: ", -1);
 
    temp = (time & MASK_HOUR) >> SHIFT_HOUR;
    UARTPutc(((temp >> 4) & 0x0F) + 48);
    UARTPutc((temp & 0x0F) + 48);
  
    UARTPutc(':');
 
    temp = (time & MASK_MIN) >> SHIFT_MIN;
    UARTPutc(((temp >> 4) & 0x0F) + 48);
    UARTPutc((temp & 0x0F) + 48);

    UARTPutc(':');

    temp = (time & MASK_SEC) >> SHIFT_SEC;
    UARTPutc(((temp >> 4) & 0x0F) + 48);
    UARTPutc((temp & 0x0F) + 48);

    UARTPuts(", ", -1);

    cal = RTCCalendarGet(SOC_RTC_0_REGS);

    temp = (cal & MASK_DAY) >> SHIFT_DAY;
    UARTPutc(((temp >> 4) & 0x0F) + 48);
    UARTPutc((temp & 0x0F) + 48);

    UARTPutc('-');

    temp = (cal & MASK_MON) >> SHIFT_MON;
    UARTPutc(((temp >> 4) & 0x0F) + 48);
    UARTPutc((temp & 0x0F) + 48);

    UARTPutc('-');

    temp = (cal & MASK_YEAR) >> SHIFT_YEAR;
    UARTPutc(((temp >> 4) & 0x0F) + 48);
    UARTPutc((temp & 0x0F) + 48);

    UARTPuts(", ", -1);

    switch(cal & MASK_DOTW)
    {
        case 0x00:
             UARTPuts("Sunday", -1);
        break;

        case 0x01:
             UARTPuts("Monday", -1);
        break;

        case 0x02:
             UARTPuts("Tuesday", -1);
        break;

        case 0x03:
             UARTPuts("Wednesday", -1);
        break;

        case 0x04:
             UARTPuts("Thursday", -1);
        break;

        case 0x05:
             UARTPuts("Friday", -1);
        break;

        case 0x06:
             UARTPuts("Saturday", -1);

        default:
        break;

    }
}

/*
** Interrupt service routine for RTC
*/
static void RTCIsr(void)
{
#ifdef _TMS320C6X
	IntEventClear(SYS_INT_RTC_IRQS);
#else
    IntSystemStatusClear(SYS_INT_RTC);
#endif

    rtcSecUpdate = TRUE;
}

/******************************** End of file **********************************/



