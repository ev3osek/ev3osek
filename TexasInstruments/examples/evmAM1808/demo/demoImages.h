/**
 * \file    demoImages.h
 *
 * \brief   This file contains image declarations and macros used by the demo
 *          application
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

#ifndef __DEMOIMAGES_H__
#define __DEMOIMAGES_H__

#include "grlib.h"

/****************************************************************************
**                   MACRO DEFINITIONS                                       
****************************************************************************/

#define WIDTH       (480u)
#define HEIGHT      (272u)
#define PALETTE     (16u)
#define HW_VAL      (2u)

/****************************************************************************
**                   IMAGE ARRAY VARIABLES                                       
****************************************************************************/

extern unsigned char const iconHome[];
extern unsigned char const iconBack[];
extern unsigned char const iconNext[];

extern unsigned char const iconIntro[];
extern unsigned char const iconChoice[];
extern unsigned char const iconMcasp[];
extern unsigned char const iconSpi[];
extern unsigned char const iconUart[];
extern unsigned char const iconGpio[];
extern unsigned char const iconTimer[];
extern unsigned char const iconI2c[];
extern unsigned char const iconUsbMouse[];
extern unsigned char const iconRtc[];
extern unsigned char const iconEthernet[];

extern unsigned char const usbMouseButtons[];

extern unsigned short bannerImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short choiceImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short ethernetImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short gpioImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short i2cImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short introImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short mcaspImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short menuImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short rtcImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short spiImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short timerImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short uartImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];
extern unsigned short usbMouseImage[(WIDTH*HEIGHT)+PALETTE+HW_VAL];

extern unsigned short const bgImage[(WIDTH*HEIGHT)+PALETTE];

#endif
