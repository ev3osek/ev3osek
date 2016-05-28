/**
 *  \file  tvp5147.c
 *
 *  \brief APIs to configure the TVP5147 ADC
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

#include "codecif.h"
#include "tvp5147.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
/*
** Register Address for TVP5147
*/

/******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
static void Delay(volatile unsigned int delay)
{
    while(delay--);
}

/**
 * \brief   Initializes the TVP5147 to accept composite video
 *
 * \param   baseAddr     Base Address of the interface connected to TVP5147
 *
 * \return  None.
 */
/*
void TVP5147CompositeInit(unsigned int baseAddr)
{
    CodecRegWrite(baseAddr, 0x03, 0x01);
    Delay(1000000);
    CodecRegWrite(baseAddr, 0x03, 0x00);
    Delay(1000000);
    CodecRegWrite(baseAddr, 0x00, 0x05);
    CodecRegWrite(baseAddr, 0x08, 0x00);
    CodecRegWrite(baseAddr, 0x0E, 0x04);
    CodecRegWrite(baseAddr, 0x34, 0x11);
    CodecRegWrite(baseAddr, 0x02, 0x01);
    Delay(10000);
}
*/

void TVP5147CompositeInit(unsigned int baseAddr)
{
unsigned char reg_val;
    CodecRegWrite(baseAddr, 0x03, 0x01);
    Delay(1000000);
    CodecRegWrite(baseAddr, 0x03, 0x00);
    Delay(1000000);
    CodecRegWrite(baseAddr, 0x00, 0x05);
    CodecRegWrite(baseAddr, 0x08, 0x00);
    CodecRegWrite(baseAddr, 0x0E, 0x04);
    CodecRegWrite(baseAddr, 0x34, 0x11);
    CodecRegWrite(baseAddr, 0x02, 0x01);
reg_val = CodecRegRead(baseAddr, 0x3A);
while((reg_val | 0xF1) != 0xFF)
{
reg_val = CodecRegRead(baseAddr, 0x3A);
}
      Delay(10000);
}

/**
 * \brief   Initializes the TVP5147 to accept s-video
 *
 * \param   baseAddr     Base Address of the interface connected to TVP5147
 *
 * \return  None.
 *
 **/


void TVP5147SVideoInit(unsigned int baseAddr)
{
    CodecRegWrite(baseAddr, 0x03, 0x01);
    Delay(100000);
    CodecRegWrite(baseAddr, 0x03, 0x00);
    Delay(100000);
    CodecRegWrite(baseAddr, 0x00, 0x46);
    CodecRegWrite(baseAddr, 0x08, 0x00);
    CodecRegWrite(baseAddr, 0x0E, 0x04);
    CodecRegWrite(baseAddr, 0x34, 0x11);
    CodecRegWrite(baseAddr, 0x02, 0x01);
    Delay(1000);
}

/***************************** End Of File ***********************************/
