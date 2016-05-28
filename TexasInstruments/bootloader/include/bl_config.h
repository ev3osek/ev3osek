/**
 * \file bl_config.h
 *
 * \brief Setting values to the macros depending on 
 *            Operating frequencies and DDR frequency.
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

#ifndef __BL_CONFIG_H__
#define __BL_CONFIG_H__

#include <bl.h>

/******************************************************************************
**                 Configuration Options for Boot Loader
*******************************************************************************/
#if defined(am335x) || defined(am335x_15x15)

    #include "soc_AM335x.h"
    #include "bl_am335x.h"    
    #include "bl_am335x_15x15.h"

#elif defined(am335x_13x13)
    #include "soc_AM335x.h"
    #include "bl_am335x.h"        
    #include "bl_am335x_13x13.h"

#elif defined(am1808)
    #include "soc_AM1808.h"
    #include "bl_am1808.h"

#elif defined(omapl138)
    #include "soc_OMAPL138.h"
    #include "bl_am1808.h"
    #include "psc.h"
    #include "hw_syscfg0_OMAPL138.h"

#elif defined(c6748)
    #include "soc_C6748.h"
    #include "bl_am1808.h"

#else
    #error "UNSUPPORTED EVM"
#endif /* EVM */

void DeviceConfig(void);
void PLLInit(void);

#endif
