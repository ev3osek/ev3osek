/**
 * \file   Touch.h
 *
 * \brief  This file contains the prototypes of touch screen interface.
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

#ifndef _DEMOTOUCH_H_
#define _DEMOTOUCH_H_

#define TOUCH_MIN 150


void TSCStartConversion(void);
void ReadAxis(char,char*,char*);
void ReadFromPMIC(char,char*);
void SetupI2CReception(int);
void WriteToPMIC(char, char);
void SetupI2CTransmit2(int);
void InitTouchScreen(void);
void TSCStandByMode(void);
void TSCModeConfig(char);
void TSCIntEnable(void);
int  WaitForTouch(volatile unsigned int* isrFlag);
void TSCADCEnable(void);
void TSCDACSelect(void);
void touchConfigure(void);
int TouchWaitProcess(void);
char ReadResult(char regAddr);
void I2CPMICInteract(void);
void ResolveCoordinates(int *, int *);
int TouchScreenControl(volatile unsigned int* isrFlag);
int WasNextTouched(int x, int y);
int WasSetTimeDateTouched(int x, int y);
int WasRestartTouched(int x, int y);

extern void TouchScreenDebouncer(void);
extern void TouchScreenCallbackSet(long (*pfnCallback)(unsigned long ulMessage,
                                                       int lX, int lY));

#endif 

