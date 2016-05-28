/**
 * \file   rtcClock.c
 * 
 * \brief  This is a RTC application file. This application receives the 
 *         time and calendar information from the user, sets those values 
 *         in the RTC registers, periodically reads them and displays their 
 *         current values in the serial communication console of the external
 *         device.
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

#include "soc_AM1808.h"
#include "interrupt.h"
#include "evmAM1808.h"
#include "uartStdio.h"
#include "hw_types.h"
#include "uart.h"
#include "rtc.h"
/*****************************************************************************
**                LOCAL MACRO DEFINITIONS                                   
*****************************************************************************/

#define MASK_HOUR            (0xFF000000u)
#define MASK_MINUTE          (0x00FF0000u)
#define MASK_SECOND          (0x0000FF00u)
#define MASK_MERIDIEM        (0x000000FFu)

#define HOUR_SHIFT           (24)
#define MINUTE_SHIFT         (16)
#define SECOND_SHIFT         (8)

#define MASK_DAY             (0xFF000000u)
#define MASK_MONTH           (0x00FF0000u)
#define MASK_YEAR            (0x0000FF00u)
#define MASK_DOTW            (0x000000FFu)

#define DAY_SHIFT            (24)
#define MONTH_SHIFT          (16)
#define YEAR_SHIFT           (8)


/******************************************************************************
**               LOCAL FUNCTION PROTOTYPES                                   
******************************************************************************/

static void CalendarResolve(unsigned int calendarValue);
static unsigned char ASCIIToInt(unsigned char byte);
static unsigned int intToASCII(unsigned char byte);
static void TimeResolve(unsigned int timeValue);
static void Delay(volatile unsigned int count);
static unsigned int UserCalendarInfoGet(void);
static unsigned int UserTimeInfoGet(void);
static void ConfigureAINTCIntRTC(void);
static void SetupAINTCInt(void);
static void RTCIsr(void);


/******************************************************************************
**               LOCAL FUNCTION DEFINITIONS                                  
******************************************************************************/

/*
** Main function.
*/

int main(void)
{
    unsigned int UserTime = 0, UserCalendar = 0;
    
    UARTStdioInit();

    RTCPinMuxSetup(FALSE);
    
    /* Disabling Write Protection for RTC registers.*/
    RTCWriteProtectDisable(SOC_RTC_0_REGS);    

    /* Performing a Software Reset and Enabling the RTC module. */
    RTCEnable(SOC_RTC_0_REGS);

    /* Delay further operations by a minimum of three 32KHz clock times. */
    Delay(0xFFFF);

    UARTPuts("StarterWare AM1808 RTC Demo Application.\r\n", -2);

    UserTime = UserTimeInfoGet();

    UserCalendar = UserCalendarInfoGet();    
    
    RTCCalendarSet(SOC_RTC_0_REGS, UserCalendar);

    RTCTimeSet(SOC_RTC_0_REGS, UserTime);
    
    RTCRun(SOC_RTC_0_REGS);

    UARTPuts("\r\n\r\n", -2);
    UARTPuts("Current Time And Date:\r\n", -1);

    /* Enabling interrupts.*/
    SetupAINTCInt();

    ConfigureAINTCIntRTC();

    /* Enabling RTC interrupts. Configuring RTC to interrupt every second.*/      
    RTCIntTimerEnable(SOC_RTC_0_REGS, RTC_INT_EVERY_SECOND);

    while(1);
}

/*
** This function receives time related information from the user.
*/

static unsigned int UserTimeInfoGet()
{
    unsigned char hour[2] = {0}, minute[2] = {0}, second[2] = {0};
    unsigned int hourTime = 0, minTime = 0, secTime = 0;  
    unsigned int time = 0; 
    int i = 0;
     
    UARTPuts("\n\nEnter the time in 24 hour format.\r\n", -1);
    UARTPuts("Example (hh:mm:ss) 20:15:09\r\n", -1);
    
    UARTPuts("\r\nEnter Hours: \r\n", -2);
    
    do
    {
        hour[i] = UARTGetc();
        UARTPutc(hour[i]);
        i++; 
    }while((i < 2) && (hour[i-1] != '\r'));

    UARTPuts("\r\nEnter Minutes:\r\n", -2);
    i = 0;
    
    do
    {
        minute[i] = UARTGetc();
        UARTPutc(minute[i]);
        i++;
    }while((i < 2) && (minute[i-1] != '\r'));
    
    UARTPuts("\r\nEnter Seconds:\r\n", -1);
    i = 0;

    do
    {
        second[i] = UARTGetc();
        UARTPutc(second[i]);
        i++;
    }while((i < 2) && (second[i-1] != '\r'));
    

    if(hour[0] != '\r')
    {
        hourTime = (ASCIIToInt(hour[0]) << 0x04);
        if(hour[1] != '\r')
        {
            hourTime |= ASCIIToInt(hour[1]);
        }
        else
        {
            hourTime = hourTime >> 0x04;
        }
    }    
    
    if(minute[0] != '\r')
    { 
        minTime = (ASCIIToInt(minute[0]) << 0x04);
        if(minute[1] != '\r')
        {
            minTime |= ASCIIToInt(minute[1]);
        }
        else
        {
            minTime = minTime >> 0x04;
        }
    }    

    if(second[0] != '\r')
    {
        secTime = (ASCIIToInt(second[0]) << 0x04);
        if(second[1] != '\r')
        {
            secTime |= ASCIIToInt(second[1]);
        }
        else
        {
            secTime = secTime >> 0x04;
        }
    }

    time = (hourTime << HOUR_SHIFT);
    time |= (minTime << MINUTE_SHIFT);
    time |= (secTime << SECOND_SHIFT);
 
    return time;

}

/*
** This function receives calendar related information from the user.
*/

static unsigned int UserCalendarInfoGet()
{
    unsigned int calendar = 0;
    unsigned char dayOfMonth[2] = {0}, monthArr[2] = {0}, yearArr[2] = {0};
    unsigned char dotwArr[2] = {0};
    unsigned int dom = 0, month = 0, year = 0, dotw = 0;   
    int j = 0;

    UARTPuts("\r\n\r\nEnter the calendar information.\r\n", -2);
    UARTPuts("Example (DD:MM:YY) 31:03:73\r\n", -2);
    
    UARTPuts("\r\nEnter the day of the month: \r\n", -2);
    
    do
    {
        dayOfMonth[j] = UARTGetc();
        UARTPutc(dayOfMonth[j]);
        j++;
    }while((j < 2) && (dayOfMonth[j-1] != '\r'));

    j = 0;
    UARTPuts("\r\nEnter the month (Jan=01, Dec=12):\r\n", -2);

    do
    {
        monthArr[j] = UARTGetc();
        UARTPutc(monthArr[j]);
        j++;        
    }while((j < 2) && (monthArr[j-1] != '\r'));

    j = 0;
    UARTPuts("\r\nEnter the year (Ex: 2010=10, 1987=87:):\r\n", -1);

    do
    {
        yearArr[j] = UARTGetc();
        UARTPutc(yearArr[j]);
        j++;
    }while((j < 2) && (yearArr[j-1] != '\r'));

    j = 0;
    UARTPuts("\r\nEnter the Day of the Week (Ex:Sun=00, Sat=06):\r\n", -3);    

    do
    {
        dotwArr[j] = UARTGetc();
        UARTPutc(dotwArr[j]);
        j++;
    }while((j < 2) && (dotwArr[j-1] != '\r'));

    if(dayOfMonth[0] != '\r')
    {
        dom = (ASCIIToInt(dayOfMonth[0]) << 0x04);
        if(dayOfMonth[1] != '\r')
        {
            dom |= ASCIIToInt(dayOfMonth[1]);
        }
        else
        {
            dom = dom  >> 0x04;
        }
        
    }

    if(monthArr[0] != '\r')
    {
        month = (ASCIIToInt(monthArr[0]) << 0x04);
        if(monthArr[1] != '\r')
        {
            month |= ASCIIToInt(monthArr[1]);
        }
        else
        {
            month = month >> 0x04;
        }
    }

    if(yearArr[0] != '\r')
    {
        year = (ASCIIToInt(yearArr[0]) << 0x04);
        if(yearArr[1] != '\r')
        {
            year |= ASCIIToInt(yearArr[1]);
        }
        else
        {
            year = year >> 0x04;
        }
    }

    if(dotwArr[0] != '\r')
    {
        dotw = (ASCIIToInt(dotwArr[0]) << 0x04);
        if(dotwArr[1] != '\r')
        {
            dotw |= ASCIIToInt(dotwArr[1]);
        }
        else
        {
            dotw = dotw >> 0x04;
        }
    }

    calendar =  dom << DAY_SHIFT;     
    calendar |= month << MONTH_SHIFT;
    calendar |= year << YEAR_SHIFT;
    calendar |= dotw;

    return calendar;
}  

/*
** This function prints the current time read from the RTC registers.
*/

static void TimeResolve(unsigned int timeValue)
{
    unsigned char timeArray[3] = {0};              
    unsigned char bytePrint[2] = {0};
    unsigned int count = 0, i = 0;
    unsigned int asciiTime = 0;
   
    timeArray[0] = (unsigned char)((timeValue & MASK_HOUR) >> HOUR_SHIFT);
    timeArray[1] = (unsigned char)((timeValue & MASK_MINUTE) >> MINUTE_SHIFT);
    timeArray[2] = (unsigned char)((timeValue & MASK_SECOND) >> SECOND_SHIFT);

    while(count < 3)
    {
        i = 0;
        asciiTime = intToASCII(timeArray[count]);
        bytePrint[0] = (unsigned char)((asciiTime & 0x0000FF00) >> 0x08);
        bytePrint[1] = (unsigned char)(asciiTime & 0x000000FF);
        while(i < 2)
        {    
            UARTPutc(bytePrint[i]);
            i++;
        }
        count++;
        if(count != 3)
        {
            UARTPutc(':');
        }
        else
        {
            UARTPutc(' ');
        }
    }
}

/*
** This function prints the calendar information read from the RTC registers.
*/

static void CalendarResolve(unsigned int calendarValue)
{
    unsigned char calendarArray[3] = {0};
    unsigned int asciiCalendar = 0;
    unsigned int count = 0, j = 0;
    unsigned int dotwValue = 0;
    char bytePrint[2] = {0};
    char dotwString[4] = {0};

    calendarArray[0] = (unsigned char)((calendarValue & MASK_DAY) >> DAY_SHIFT);
    calendarArray[1] = (unsigned char)((calendarValue & MASK_MONTH) >> MONTH_SHIFT);
    calendarArray[2] = (unsigned char)((calendarValue & MASK_YEAR) >> YEAR_SHIFT);

    dotwValue = (calendarValue & MASK_DOTW);

    switch(dotwValue)
    {
        case 0x00: 
             dotwString[0] = 'S';
             dotwString[1] = 'u';
             dotwString[2] = 'n';
             dotwString[3] = '\0';
        break;

        case 0x01: 
             dotwString[0] = 'M';
             dotwString[1] = 'o';
             dotwString[2] = 'n';
             dotwString[3] = '\0';
        break;

        case 0x02: 
             dotwString[0] = 'T';
             dotwString[1] = 'u';
             dotwString[2] = 'e';
             dotwString[3] = '\0';
        break;


        case 0x03: 
             dotwString[0] = 'W';
             dotwString[1] = 'e';
             dotwString[2] = 'd';
             dotwString[3] = '\0';
        break;

        case 0x04: 
             dotwString[0] = 'T';
             dotwString[1] = 'h';
             dotwString[2] = 'u';
             dotwString[3] = '\0';
        break;

        case 0x05: 
             dotwString[0] = 'F';
             dotwString[1] = 'r';
             dotwString[2] = 'i';
             dotwString[3] = '\0';
        break;

        case 0x06: 
             dotwString[0] = 'S';
             dotwString[1] = 'a';
             dotwString[2] = 't';
             dotwString[3] = '\0';

        default: 
        break;

    }
    
    while(count < 3)
    {
        j = 0;
        asciiCalendar = intToASCII(calendarArray[count]);
        bytePrint[0] = (char)((asciiCalendar & 0x0000FF00) >> 0x08);
        bytePrint[1] = (char)(asciiCalendar & 0x000000FF);
        while(j < 2)
        {
            UARTPutc(bytePrint[j]);
            j++;
        }
        count++;
        if(count != 3)
        {
            UARTPutc('-');
        }
        else
        {
            UARTPutc(' ');
        }

    }  
    UARTPuts(dotwString, -2);

}


/*
** This function converts a 8 bit number to its ASCII equivalent value.
** The 8 bit number is passed as a parameter to this function.         
*/

static unsigned int intToASCII(unsigned char byte)
{
    unsigned int retVal = 0;
    unsigned char lsn = 0, msn = 0;
    lsn = (byte & 0x0F);
    msn = (byte & 0xF0) >> 0x04;

    retVal = (lsn + 0x30);
    retVal |= ((msn + 0x30) << 0x08);

    return retVal;
}

/*
** This function converts the ASCII value of a hexadecimal number to its
** equivalent hexadecimal value.
*/

static unsigned char ASCIIToInt(unsigned char byte)
{
    unsigned char retVal = 0;

    /* For numbers from 0x0 to 0x9.*/
    if((byte >= 0x30) && (byte <= 0x39))
    {
        retVal = byte - 0x30;
    }
    /* For alphabets from A to Z.*/
    else if((byte >= 0x41) && (byte <= 0x46))
    {
        retVal = byte - 0x37;
    }
    
    return retVal;
}

/*
** This function invokes necessary functions to configure the ARM 
** processor and ARM Interrupt Controller(AINTC) to receive and
** handle interrupts.
*/

static void SetupAINTCInt(void)
{
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

     /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

/*
** This function configures the AINTC to receive the RTC interrupt.
*/

static void ConfigureAINTCIntRTC(void)
{
    /*
    ** Register the ISR in the Interrupt Vector Table.
    */
    IntRegister(SYS_INT_RTC, RTCIsr);

    /* Map the RTC system interrupt to channel 2 of AINTC. */
    IntChannelSet(SYS_INT_RTC, 2);

    /* Enable the System Interrupts for AINTC.*/
    IntSystemEnable(SYS_INT_RTC);
}

/*
** This is the Interrupt Service Routine(ISR) for RTC.
*/

static void RTCIsr(void)
{
    unsigned int timeValue = 0, calendarValue = 0;    

    IntSystemStatusClear(SYS_INT_RTC);
        
    /* Read the current time from RTC time registers. */ 
    timeValue = RTCTimeGet(SOC_RTC_0_REGS);

    /* Decode the time in 'timeValue' and display it on console.*/
    TimeResolve(timeValue);
 
    /* Read the current date from the RTC calendar registers. */
    calendarValue = RTCCalendarGet(SOC_RTC_0_REGS);
    
    UARTPuts("   ", -2);

    /* Decode  the date in 'calendarValue' and display it on console.*/
    CalendarResolve(calendarValue);

    UARTPuts("\r", -2);    
 
}

/*
** Delay routine.
*/

void Delay(volatile unsigned int count)
{
    while(count--);
}

/****************************** End of file **********************************/
