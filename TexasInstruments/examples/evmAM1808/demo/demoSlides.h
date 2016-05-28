/**
 * \file    demoSlides.h
 *
 * \brief   This file defines the slide contents for the demo application
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

#ifndef __DEMOSLIDES_H__
#define __DEMOSLIDES_H__

#include "grlib.h"

/****************************************************************************
**                   GLOBAL VARIABLES DECLARATIONS
****************************************************************************/

extern tDisplay g_sDisplayBanner;
extern tDisplay g_sDisplayChoice;
extern tDisplay g_sDisplayEthernet;
extern tDisplay g_sDisplayGpio;
extern tDisplay g_sDisplayI2c;
extern tDisplay g_sDisplayIntro;
extern tDisplay g_sDisplayMcasp;
extern tDisplay g_sDisplayMenu;
extern tDisplay g_sDisplayRtc;
extern tDisplay g_sDisplaySpi;
extern tDisplay g_sDisplayTimer;
extern tDisplay g_sDisplayUart;
extern tDisplay g_sDisplayUsbMouse;

extern tContext sContextBanner;
extern tContext sContextChoice;
extern tContext sContextEthernet;
extern tContext sContextGpio;
extern tContext sContextI2c;
extern tContext sContextIntro;
extern tContext sContextMcasp;
extern tContext sContextMenu;
extern tContext sContextRtc;
extern tContext sContextSpi;
extern tContext sContextTimer;
extern tContext sContextUart;
extern tContext sContextUsbMouse;

/****************************************************************************
**                   GLOBAL FUNCTION DECLARATIONS
****************************************************************************/

extern void InitializeSlides();
extern void ResetChoiceSlide();
extern void ResetUsbMouseSlide();

#endif
