/**
 *  \file  adv7343.c
 *
 *  \brief APIs to configure the ADV7343 DAC.
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
#include "adv7343.h"

/******************************************************************************
**                      INTERNAL MACRO DEFINITIONS
*******************************************************************************/
/*
** Register Address for ADV7343
*/

/******************************************************************************
**                          FUNCTION DEFINITIONS
*******************************************************************************/
static void Delay(volatile unsigned int delay)
{
    while(delay--);
}

/**
 * \brief   Initializes the ADV7343 to output composite video / svideo
 *
 * \param   baseAddr     Base Address of the interface connected to ADV7343
 *
 * \return  None.
 *
 **/


void ADV7343CompositeInit(unsigned int baseAddr)
/*void ADV7343SVideoInit(unsigned int baseAddr)*/
{
    CodecRegWrite(baseAddr, 0x17, 0x02);
    Delay(500);
    CodecRegWrite(baseAddr, 0x00, 0xFC);
    CodecRegWrite(baseAddr, 0x82, 0xCB);
    CodecRegWrite(baseAddr, 0x84, 0x00);
}



/***************************** End Of File ***********************************/
