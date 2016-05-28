/**
 * \file  demoI2C.h
 * 
 * \brief I2C slave configuration functions
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

#ifndef _DEMOI2C_H_
#define _DEMOI2C_H_

/**************************************************************************
**                      API FUNCTION PROTOTYPES
**************************************************************************/
extern void I2C0IfConfig(unsigned int slaveAddr, unsigned int speed);
extern void I2C0SlaveRegWrite(unsigned char regAddr,
                              unsigned char regData);
extern void I2C0SlaveRegBitSet(unsigned char regAddr,
                               unsigned char bitMask);
extern void I2C0SlaveRegBitClr(unsigned char regAddr,
                               unsigned char bitMask);
extern unsigned char I2C0SlaveRegRead(unsigned char regAddr);
extern void I2C0IntRegister(unsigned int channel);
extern void I2C0SendBlocking(unsigned int dataCnt);
extern void I2C0RcvBlocking(unsigned int dataCnt);

#endif
