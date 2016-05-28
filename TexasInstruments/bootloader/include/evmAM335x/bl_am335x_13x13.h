/**
 * \file bl_am335x_13x13.h
 *
 * \brief Setting values to the macros depending on 
 *        Operating frequencies and DDR frequenc
 *        for 13x13 Soc.
 *  
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

#ifndef __AM335X_13x13_H__
#define __AM335X_13x13_H__

/******************************************************************************
**                 Configuration Options for Boot Loader
*******************************************************************************/

/* Set of config parameters for AM335x */

     /* Setting the CORE PLL values at OPP100:
     ** OSCIN = 24MHz, Fdpll = 2GHz
     ** HSDM4 = 200MHz, HSDM5 = 250MHz
     ** HSDM6 = 500MHz
     */
    #define COREPLL_M                1000
    #define COREPLL_N                23
    #define COREPLL_HSD_M4           10
    #define COREPLL_HSD_M5           8
    #define COREPLL_HSD_M6           4

     /* Setting the  PER PLL values at OPP100:
     ** OSCIN = 24MHz, Fdpll = 960MHz
     ** CLKLDO = 960MHz, CLKOUT = 192MHz
     */
    #define PERPLL_M                960
    #define PERPLL_N                23
    #define PERPLL_M2               5

    /* Setting the MPU (Cortex) clock at 500MHz */
    #define MPUPLL_M                500
    #define MPUPLL_N                23
    #define MPUPLL_M2               1

     /* Setting the Display CLKOUT at 300MHz independently
     ** This is required for full clock 150MHz for LCD
     ** OSCIN = 24MHz, Fdpll = 300MHz
     ** CLKOUT = 150MHz
     */
    #define DISPLL_M                25
    #define DISPLL_N                3
    #define DISPLL_M2               1

     /* Setting the mDDR frequency to 180MHz
     ** OSCIN = 24MHz, Fdpll = 360MHz
     ** CLKOUT = 180MHz
     */
    #define DDRPLL_M		   166
    #define DDRPLL_N		   23
    #define DDRPLL_M2		   1

#endif

