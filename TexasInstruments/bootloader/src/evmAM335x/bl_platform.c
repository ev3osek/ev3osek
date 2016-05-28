/**
 * \file  bl_devam335x.c
 *
 * \brief Initializes AM335x Device Peripherals.
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

#include "soc_AM335x.h"
#include "hw_types.h"
#include "hw_cm_cefuse.h"
#include "hw_cm_device.h"
#include "hw_cm_dpll.h"
#include "hw_cm_gfx.h"
#include "hw_cm_mpu.h"
#include "hw_cm_per.h"
#include "hw_cm_rtc.h"
#include "hw_cm_wkup.h"
#include "hw_control_AM335x.h"
#include "hw_emif4d.h"
#include "bl_config.h"
#include "bl.h"
#include "bl_spi.h"
#include "bl_am335x.h"

#if defined (evmAM335x)
#include "evmAM335x.h"
#endif

#if defined(beaglebone)
#include "beaglebone.h"
#endif

#include "uartStdio.h"
#include "watchdog.h"

/******************************************************************************
**                     Internal Macro Definitions
*******************************************************************************/
#define INTVECMAX                         (9)

/******************************************************************************
**                     Local function Declarations
*******************************************************************************/


/******************************************************************************
**                     Global variable Definitions
*******************************************************************************/
char *deviceType = "AM335x";

/******************************************************************************
**                     Local variable Definitions
*******************************************************************************/

/******************************************************************************
**                     Function Definitions
*******************************************************************************/

/* \brief This function initializes the CORE PLL 
 * 
 * \param none
 *
 * \return none
 *
 */
void CorePLLInit(void)
{
    volatile unsigned int regVal = 0;

    /* Enable the Core PLL */

    /* Put the PLL in bypass mode */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_CORE) &
                ~CM_WKUP_CM_CLKMODE_DPLL_CORE_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_CORE_DPLL_EN_DPLL_MN_BYP_MODE;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_CORE) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_CORE) & 
                      CM_WKUP_CM_IDLEST_DPLL_CORE_ST_MN_BYPASS));
            
    /* Set the multipler and divider values for the PLL */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_CORE) =
        ((COREPLL_M << CM_WKUP_CM_CLKSEL_DPLL_CORE_DPLL_MULT_SHIFT) |
         (COREPLL_N << CM_WKUP_CM_CLKSEL_DPLL_CORE_DPLL_DIV_SHIFT));

    /* Configure the High speed dividers */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M4_DPLL_CORE) &= 
                   ~CM_WKUP_CM_DIV_M4_DPLL_CORE_HSDIVIDER_CLKOUT1_DIV;
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M4_DPLL_CORE) |= 
      (COREPLL_HSD_M4 << CM_WKUP_CM_DIV_M4_DPLL_CORE_HSDIVIDER_CLKOUT1_DIV_SHIFT);

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M5_DPLL_CORE) &= 
                  ~CM_WKUP_CM_DIV_M5_DPLL_CORE_HSDIVIDER_CLKOUT2_DIV;
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M5_DPLL_CORE) |= 
        (COREPLL_HSD_M5 << CM_WKUP_CM_DIV_M5_DPLL_CORE_HSDIVIDER_CLKOUT2_DIV_SHIFT);


    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M6_DPLL_CORE) &= 
                                ~CM_WKUP_CM_DIV_M6_DPLL_CORE_HSDIVIDER_CLKOUT3_DIV;
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M6_DPLL_CORE) |= 
        (COREPLL_HSD_M6 << CM_WKUP_CM_DIV_M6_DPLL_CORE_HSDIVIDER_CLKOUT3_DIV_SHIFT);

    /* Now LOCK the PLL by enabling it */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_CORE) &
                ~CM_WKUP_CM_CLKMODE_DPLL_CORE_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_CORE_DPLL_EN;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_CORE) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_CORE) & 
                        CM_WKUP_CM_IDLEST_DPLL_CORE_ST_DPLL_CLK));
}

/* \brief This function initializes the DISPLAY PLL
 * 
 * \param none
 *
 * \return none
 *
 */
void DisplayPLLInit(void)
{
    volatile unsigned int regVal = 0;

    /* Put the PLL in bypass mode */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DISP) &
                ~CM_WKUP_CM_CLKMODE_DPLL_DISP_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_DISP_DPLL_EN_DPLL_MN_BYP_MODE;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DISP) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_DISP) & 
                        CM_WKUP_CM_IDLEST_DPLL_DISP_ST_MN_BYPASS));
   
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_DISP) &= 
                           ~(CM_WKUP_CM_CLKSEL_DPLL_DISP_DPLL_DIV | 
                             CM_WKUP_CM_CLKSEL_DPLL_DISP_DPLL_MULT);
 
    /* Set the multipler and divider values for the PLL */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_DISP) |=
        ((DISPLL_M << CM_WKUP_CM_CLKSEL_DPLL_DISP_DPLL_MULT_SHIFT) |
         (DISPLL_N << CM_WKUP_CM_CLKSEL_DPLL_DISP_DPLL_DIV_SHIFT));

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_DISP) &= 
                        ~CM_WKUP_CM_DIV_M2_DPLL_DISP_DPLL_CLKOUT_DIV;
    /* Set the CLKOUT2 divider */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_DISP) |= DISPLL_M2;

    /* Now LOCK the PLL by enabling it */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DISP) &
                ~CM_WKUP_CM_CLKMODE_DPLL_DISP_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_DISP_DPLL_EN;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DISP) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_DISP) & 
                         CM_WKUP_CM_IDLEST_DPLL_DISP_ST_DPLL_CLK));
}

/* \brief This function initializes the PER PLL
 * 
 * \param none
 *
 * \return none
 *
 */
void PerPLLInit(void)
{
    volatile unsigned int regVal = 0;

    /* Put the PLL in bypass mode */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_PER) &
                ~CM_WKUP_CM_CLKMODE_DPLL_PER_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_PER_DPLL_EN_DPLL_MN_BYP_MODE;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_PER) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_PER) & 
                      CM_WKUP_CM_IDLEST_DPLL_PER_ST_MN_BYPASS));

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_PERIPH) &= 
                             ~(CM_WKUP_CM_CLKSEL_DPLL_PERIPH_DPLL_MULT | 
                                    CM_WKUP_CM_CLKSEL_DPLL_PERIPH_DPLL_DIV);

    /* Set the multipler and divider values for the PLL */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_PERIPH) |=
        ((PERPLL_M << CM_WKUP_CM_CLKSEL_DPLL_PERIPH_DPLL_MULT_SHIFT) |
         (PERPLL_N << CM_WKUP_CM_CLKSEL_DPLL_PERIPH_DPLL_DIV_SHIFT));

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_PER) &= 
                          ~CM_WKUP_CM_DIV_M2_DPLL_PER_DPLL_CLKOUT_DIV;

    /* Set the CLKOUT2 divider */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_PER) |= PERPLL_M2;

    /* Now LOCK the PLL by enabling it */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_PER) &
                ~CM_WKUP_CM_CLKMODE_DPLL_PER_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_PER_DPLL_EN;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_PER) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_PER) & 
                           CM_WKUP_CM_IDLEST_DPLL_PER_ST_DPLL_CLK));

}

/* \brief This function initializes the DDR PLL
 * 
 * \param none
 *
 * \return none
 *
 */
void DDRPLLInit(void)
{
    volatile unsigned int regVal = 0;

    /* Put the PLL in bypass mode */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DDR) &
                 ~CM_WKUP_CM_CLKMODE_DPLL_DDR_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_MPU_DPLL_EN_DPLL_MN_BYP_MODE;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DDR) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_DDR) & 
                      CM_WKUP_CM_IDLEST_DPLL_DDR_ST_MN_BYPASS));

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_DDR) &= 
                     ~(CM_WKUP_CM_CLKSEL_DPLL_DDR_DPLL_MULT | 
                           CM_WKUP_CM_CLKSEL_DPLL_DDR_DPLL_DIV);

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_DDR) |=
        ((DDRPLL_M << CM_WKUP_CM_CLKSEL_DPLL_DDR_DPLL_MULT_SHIFT) |
         (DDRPLL_N << CM_WKUP_CM_CLKSEL_DPLL_DDR_DPLL_DIV_SHIFT));

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_DDR) &= 
                       ~CM_WKUP_CM_DIV_M2_DPLL_DDR_DPLL_CLKOUT_DIV;

    /* Set the CLKOUT divider */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_DDR) |= DDRPLL_M2;

    /* Now LOCK the PLL by enabling it */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DDR) &
                ~CM_WKUP_CM_CLKMODE_DPLL_DDR_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_DDR_DPLL_EN;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_DDR) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_DDR) & 
                           CM_WKUP_CM_IDLEST_DPLL_DDR_ST_DPLL_CLK));
}

/*
 * \brief This function initializes the MPU PLL
 *
 * \param  none
 *
 * \return none
 */
void MPUPLLInit(void)
{
    volatile unsigned int regVal = 0;

    /* Put the PLL in bypass mode */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_MPU) &
                ~CM_WKUP_CM_CLKMODE_DPLL_MPU_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_MPU_DPLL_EN_DPLL_MN_BYP_MODE;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_MPU) = regVal;

    /* Wait for DPLL to go in to bypass mode */
    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_MPU) & 
                CM_WKUP_CM_IDLEST_DPLL_MPU_ST_MN_BYPASS));

    /* Clear the MULT and DIV field of DPLL_MPU register */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_MPU) &= 
                      ~(CM_WKUP_CM_CLKSEL_DPLL_MPU_DPLL_MULT | 
                              CM_WKUP_CM_CLKSEL_DPLL_MPU_DPLL_DIV);

   #ifdef beaglebone
         /* Set the multiplier and divider values for the PLL */
         HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_MPU) |=
         ((MPUPLL_M_720 << CM_WKUP_CM_CLKSEL_DPLL_MPU_DPLL_MULT_SHIFT) |
         (MPUPLL_N << CM_WKUP_CM_CLKSEL_DPLL_MPU_DPLL_DIV_SHIFT));
   #else
         /* Set the multiplier and divider values for the PLL */
         HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKSEL_DPLL_MPU) |=
         ((MPUPLL_M << CM_WKUP_CM_CLKSEL_DPLL_MPU_DPLL_MULT_SHIFT) |
         (MPUPLL_N << CM_WKUP_CM_CLKSEL_DPLL_MPU_DPLL_DIV_SHIFT));
   #endif

    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_MPU);

    regVal = regVal & ~CM_WKUP_CM_DIV_M2_DPLL_MPU_DPLL_CLKOUT_DIV;

    regVal = regVal | MPUPLL_M2;

    /* Set the CLKOUT2 divider */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_DIV_M2_DPLL_MPU) = regVal;

    /* Now LOCK the PLL by enabling it */
    regVal = HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_MPU) &
                ~CM_WKUP_CM_CLKMODE_DPLL_MPU_DPLL_EN;

    regVal |= CM_WKUP_CM_CLKMODE_DPLL_MPU_DPLL_EN;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_CLKMODE_DPLL_MPU) = regVal;

    while(!(HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CM_IDLEST_DPLL_MPU) & 
                             CM_WKUP_CM_IDLEST_DPLL_MPU_ST_DPLL_CLK));
}

void InterfaceClkInit(void)
{
    HWREG(SOC_CM_PER_REGS + CM_PER_L3_CLKCTRL) |= 
                                   CM_PER_L3_CLKCTRL_MODULEMODE_ENABLE;

    while((HWREG(SOC_CM_PER_REGS + CM_PER_L3_CLKCTRL) &
        CM_PER_L3_CLKCTRL_MODULEMODE) != CM_PER_L3_CLKCTRL_MODULEMODE_ENABLE);

    HWREG(SOC_CM_PER_REGS + CM_PER_L4LS_CLKCTRL) |= 
                                       CM_PER_L4LS_CLKCTRL_MODULEMODE_ENABLE;

    while((HWREG(SOC_CM_PER_REGS + CM_PER_L4LS_CLKCTRL) & 
      CM_PER_L4LS_CLKCTRL_MODULEMODE) != CM_PER_L4LS_CLKCTRL_MODULEMODE_ENABLE); 

    HWREG(SOC_CM_PER_REGS + CM_PER_L4FW_CLKCTRL) |= 
                                 CM_PER_L4FW_CLKCTRL_MODULEMODE_ENABLE;

    while((HWREG(SOC_CM_PER_REGS + CM_PER_L4FW_CLKCTRL) &
      CM_PER_L4FW_CLKCTRL_MODULEMODE) != CM_PER_L4FW_CLKCTRL_MODULEMODE_ENABLE);

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_L4WKUP_CLKCTRL) |= 0x02;
    while((HWREG(SOC_CM_WKUP_REGS + CM_WKUP_L4WKUP_CLKCTRL) & 
                        CM_WKUP_L4WKUP_CLKCTRL_MODULEMODE) != 0x02);

    HWREG(SOC_CM_PER_REGS + CM_PER_L3_INSTR_CLKCTRL) |=
                                      CM_PER_L3_INSTR_CLKCTRL_MODULEMODE_ENABLE;

    while((HWREG(SOC_CM_PER_REGS + CM_PER_L3_INSTR_CLKCTRL) & 
                        CM_PER_L3_INSTR_CLKCTRL_MODULEMODE) != 
                        CM_PER_L3_INSTR_CLKCTRL_MODULEMODE_ENABLE);

    HWREG(SOC_CM_PER_REGS + CM_PER_L4HS_CLKCTRL) |= 
                              CM_PER_L4HS_CLKCTRL_MODULEMODE_ENABLE;

    while((HWREG(SOC_CM_PER_REGS + CM_PER_L4HS_CLKCTRL) & 
                        CM_PER_L4HS_CLKCTRL_MODULEMODE) != 
                  CM_PER_L4HS_CLKCTRL_MODULEMODE_ENABLE);
}

void PowerDomainTransitionInit(void)
{
    HWREG(SOC_CM_PER_REGS + CM_PER_L3_CLKSTCTRL) |=
                             CM_PER_L3_CLKSTCTRL_CLKTRCTRL_SW_WKUP;

     HWREG(SOC_CM_PER_REGS + CM_PER_L4LS_CLKSTCTRL) |=
                             CM_PER_L4LS_CLKSTCTRL_CLKTRCTRL_SW_WKUP;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CLKSTCTRL) |=
                             CM_WKUP_CLKSTCTRL_CLKTRCTRL_SW_WKUP;

    HWREG(SOC_CM_PER_REGS + CM_PER_L4FW_CLKSTCTRL) |= 
                              CM_PER_L4FW_CLKSTCTRL_CLKTRCTRL_SW_WKUP;

    HWREG(SOC_CM_PER_REGS + CM_PER_L3S_CLKSTCTRL) |= 
                                CM_PER_L3S_CLKSTCTRL_CLKTRCTRL_SW_WKUP;

}

/*
 * \brief This function sets up various PLLs  
 *
 * \param  none
 *
 * \return none
 */
void PLLInit(void)
{
    MPUPLLInit();
    CorePLLInit();
    PerPLLInit();
    DDRPLLInit();
    InterfaceClkInit();
    PowerDomainTransitionInit();
    DisplayPLLInit();
}

/*
 * \brief This function sets up the pinmux for EMIF/DDR interface
 *
 * \param  instance This is used to specify instance of EMIF to be configured
 *
 * \return none
 */
#define BIT(n)    (1 << (n))
#define PAD_CTRL_PULLUDDISABLE    BIT(3)
#define PAD_CTRL_PULLUPSEL        BIT(4)
#define PAD_CTRL_RXACTIVE        BIT(5)
#define PAD_CTRL_SLOWSLEW         BIT(6)
#define PAD_CTRL_MUXMODE(n)        (n)

void EMIFPinMuxSetup(unsigned int instance)
{
    unsigned int i;

    /* TODO : VTP - not clear on PUPD, VREF - not clear on PinType
     *           STRBEN(n) - not clear on PUPD
     */
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_RESETN) =
        PAD_CTRL_MUXMODE(0);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_CSN0) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_CKE) =
        PAD_CTRL_MUXMODE(0);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_CK) =
        PAD_CTRL_MUXMODE(0);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_NCK) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_CASN) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_RASN) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_WEN) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_BA(0)) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_BA(1)) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_BA(2)) =
        (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);

    /* Configure all the address/data lines */
    for (i = 0; i < 15; i++)
    {
        HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_A(i)) =
            (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);

        HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_D(i)) =
            (PAD_CTRL_MUXMODE(0) | PAD_CTRL_RXACTIVE);
    }

    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_ODT) =
        PAD_CTRL_MUXMODE(0);

    for (i = 0; i < 2; i++)
    {
        HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_DQM(i)) =
            (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL);
        HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_DQS(i)) =
            (PAD_CTRL_MUXMODE(0) | PAD_CTRL_RXACTIVE);
        HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_DQSN(i)) =
            (PAD_CTRL_MUXMODE(0) | PAD_CTRL_PULLUPSEL | PAD_CTRL_RXACTIVE);
    }

    HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_VTP) =
        PAD_CTRL_MUXMODE(0);

    for (i = 0; i < 2; i++)
    {
        HWREG(SOC_CONTROL_REGS + CONTROL_CONF_DDR_STRBEN(i)) =
            (PAD_CTRL_MUXMODE(0) + PAD_CTRL_RXACTIVE);
    }
}


/*
 * \brief This function sets up the DDR PHY
 *
 * \param  none
 *
 * \return none
 */
/* TODO : These are not there in the control module header file */
#define DDR_PHY_CTRL_REGS                (SOC_CONTROL_REGS + 0x2000)
#define CMD0_SLAVE_RATIO_0                (DDR_PHY_CTRL_REGS + 0x1C)
#define CMD0_SLAVE_FORCE_0                (DDR_PHY_CTRL_REGS + 0x20)
#define CMD0_SLAVE_DELAY_0                (DDR_PHY_CTRL_REGS + 0x24)
#define CMD0_LOCK_DIFF_0                (DDR_PHY_CTRL_REGS + 0x28)
#define CMD0_INVERT_CLKOUT_0            (DDR_PHY_CTRL_REGS + 0x2C)
#define CMD1_SLAVE_RATIO_0                (DDR_PHY_CTRL_REGS + 0x50)
#define CMD1_SLAVE_FORCE_0                (DDR_PHY_CTRL_REGS + 0x54)
#define CMD1_SLAVE_DELAY_0                (DDR_PHY_CTRL_REGS + 0x58)
#define CMD1_LOCK_DIFF_0                (DDR_PHY_CTRL_REGS + 0x5C)
#define CMD1_INVERT_CLKOUT_0            (DDR_PHY_CTRL_REGS + 0x60)
#define CMD2_SLAVE_RATIO_0                (DDR_PHY_CTRL_REGS + 0x84)
#define CMD2_SLAVE_FORCE_0                (DDR_PHY_CTRL_REGS + 0x88)
#define CMD2_SLAVE_DELAY_0                (DDR_PHY_CTRL_REGS + 0x8C)
#define CMD2_LOCK_DIFF_0                (DDR_PHY_CTRL_REGS + 0x90)
#define CMD2_INVERT_CLKOUT_0            (DDR_PHY_CTRL_REGS + 0x94)
#define DATA0_RD_DQS_SLAVE_RATIO_0       (DDR_PHY_CTRL_REGS + 0xC8)
#define DATA0_RD_DQS_SLAVE_RATIO_1       (DDR_PHY_CTRL_REGS + 0xCC)
#define DATA0_WR_DQS_SLAVE_RATIO_0       (DDR_PHY_CTRL_REGS + 0xDC)
#define DATA0_WR_DQS_SLAVE_RATIO_1       (DDR_PHY_CTRL_REGS + 0xE0)
#define DATA0_WRLVL_INIT_RATIO_0        (DDR_PHY_CTRL_REGS + 0xF0)
#define DATA0_WRLVL_INIT_RATIO_1        (DDR_PHY_CTRL_REGS + 0xF4)
#define DATA0_GATELVL_INIT_RATIO_0        (DDR_PHY_CTRL_REGS + 0xFC)
#define DATA0_GATELVL_INIT_RATIO_1        (DDR_PHY_CTRL_REGS + 0x100)
#define DATA0_FIFO_WE_SLAVE_RATIO_0        (DDR_PHY_CTRL_REGS + 0x108)
#define DATA0_FIFO_WE_SLAVE_RATIO_1        (DDR_PHY_CTRL_REGS + 0x10C)
#define DATA0_WR_DATA_SLAVE_RATIO_0        (DDR_PHY_CTRL_REGS + 0x120)
#define DATA0_WR_DATA_SLAVE_RATIO_1        (DDR_PHY_CTRL_REGS + 0x124)
#define DATA0_USE_RANK0_DELAYS_0        (DDR_PHY_CTRL_REGS + 0x134)
#define DATA0_LOCK_DIFF_0                (DDR_PHY_CTRL_REGS + 0x138)
#define DATA1_RD_DQS_SLAVE_RATIO_0       (DDR_PHY_CTRL_REGS + 0x16c)
#define DATA1_RD_DQS_SLAVE_RATIO_1       (DDR_PHY_CTRL_REGS + 0x170)
#define DATA1_WR_DQS_SLAVE_RATIO_0       (DDR_PHY_CTRL_REGS + 0x180)
#define DATA1_WR_DQS_SLAVE_RATIO_1       (DDR_PHY_CTRL_REGS + 0x184)
#define DATA1_WRLVL_INIT_RATIO_0        (DDR_PHY_CTRL_REGS + 0x194)
#define DATA1_WRLVL_INIT_RATIO_1        (DDR_PHY_CTRL_REGS + 0x198)
#define DATA1_GATELVL_INIT_RATIO_0        (DDR_PHY_CTRL_REGS + 0x1a0)
#define DATA1_GATELVL_INIT_RATIO_1        (DDR_PHY_CTRL_REGS + 0x1a4)
#define DATA1_FIFO_WE_SLAVE_RATIO_0        (DDR_PHY_CTRL_REGS + 0x1ac)
#define DATA1_FIFO_WE_SLAVE_RATIO_1        (DDR_PHY_CTRL_REGS + 0x1b0)
#define DATA1_WR_DATA_SLAVE_RATIO_0        (DDR_PHY_CTRL_REGS + 0x1c4)
#define DATA1_WR_DATA_SLAVE_RATIO_1        (DDR_PHY_CTRL_REGS + 0x1c8)
#define DATA1_USE_RANK0_DELAYS_0        (DDR_PHY_CTRL_REGS + 0x1d8)
#define DATA1_LOCK_DIFF_0                (DDR_PHY_CTRL_REGS + 0x1dc)

#ifdef am335x_13x13
static void mDDRPhyInit(void)
{
    /* DDR PHY CMD0 Register configuration */
    HWREG(CMD0_SLAVE_RATIO_0) = 0x80;
    HWREG(CMD0_SLAVE_FORCE_0) = 0x0;                       
    HWREG(CMD0_SLAVE_DELAY_0) = 0x0;
    HWREG(CMD0_LOCK_DIFF_0) = 0x4; 
    HWREG(CMD0_INVERT_CLKOUT_0) = 0x0;

    /* DDR PHY CMD1 Register configuration */
    HWREG(CMD1_SLAVE_RATIO_0) = 0x80;                 
    HWREG(CMD1_SLAVE_FORCE_0) =  0x0;                       
    HWREG(CMD1_SLAVE_DELAY_0) = 0x0;                       
    HWREG(CMD1_LOCK_DIFF_0) = 0x4;                        
    HWREG(CMD1_INVERT_CLKOUT_0) = 0x0;

    /* DDR PHY CMD2 Register configuration */
    HWREG(CMD2_SLAVE_RATIO_0) = 0x80;                 
    HWREG(CMD2_SLAVE_FORCE_0) = 0x0;                       
    HWREG(CMD2_SLAVE_DELAY_0) = 0x0;                       
    HWREG(CMD2_LOCK_DIFF_0) = 0x4;                        
    HWREG(CMD2_INVERT_CLKOUT_0) = 0x0;

    /* DATA macro configuration */
    HWREG(DATA0_RD_DQS_SLAVE_RATIO_0) = ((0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0));
    HWREG(DATA0_RD_DQS_SLAVE_RATIO_1) = (0x40 >> 2);
    HWREG(DATA0_WR_DQS_SLAVE_RATIO_0) = (( 0x00 << 30)|( 0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA0_WR_DQS_SLAVE_RATIO_1) = (0x00 >> 2);
    HWREG(DATA0_WRLVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA0_WRLVL_INIT_RATIO_1) = 0x00 >> 2;
    HWREG(DATA0_GATELVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA0_GATELVL_INIT_RATIO_1) = 0x00 >> 2;
    HWREG(DATA0_FIFO_WE_SLAVE_RATIO_0) = ((0x56 << 30)|(0x56 << 20)|(0x56 << 10)|(0x56 << 0));     
    HWREG(DATA0_FIFO_WE_SLAVE_RATIO_1) = 0x56 >> 2;
    HWREG(DATA0_WR_DATA_SLAVE_RATIO_0) = (0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0);
    HWREG(DATA0_WR_DATA_SLAVE_RATIO_1) = 0x40 >> 2;      
    HWREG(DATA0_LOCK_DIFF_0) = 0x00;                 
    HWREG(DATA0_USE_RANK0_DELAYS_0) = 1;        

    HWREG(DATA1_RD_DQS_SLAVE_RATIO_0) = ((0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0));
    HWREG(DATA1_RD_DQS_SLAVE_RATIO_1) = (0x40 >> 2);
    HWREG(DATA1_WR_DQS_SLAVE_RATIO_0) = (( 0x00 << 30)|( 0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA1_WR_DQS_SLAVE_RATIO_1) = (0x00 >> 2);
    HWREG(DATA1_WRLVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA1_WRLVL_INIT_RATIO_1) = 0x00 >> 2;
    HWREG(DATA1_GATELVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA1_GATELVL_INIT_RATIO_1) =  0x00 >> 2;
    HWREG(DATA1_FIFO_WE_SLAVE_RATIO_0) = ((0x56 << 30)|(0x56 << 20)|(0x56 << 10)|(0x56 << 0));     
    HWREG(DATA1_FIFO_WE_SLAVE_RATIO_1) = 0x56 >> 2;
    HWREG(DATA1_WR_DATA_SLAVE_RATIO_0)  = ((0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0));
    HWREG(DATA1_WR_DATA_SLAVE_RATIO_1) = 0x40 >> 2;      
    HWREG(DATA1_LOCK_DIFF_0) =  0x00;      
    HWREG(DATA1_USE_RANK0_DELAYS_0) = 1;  

    
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CMD_IOCTRL(0)) = 0x18B; 
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CMD_IOCTRL(1)) = 0x18B;
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CMD_IOCTRL(2)) = 0x18B;
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_DATA_IOCTRL(0)) = 0x18B;
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_DATA_IOCTRL(1)) = 0x18B;

    /* IO to work for mDDR */
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_IO_CTRL) |= CONTROL_DDR_IO_CTRL_MDDR_SEL;

    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CKE_CTRL) |= CONTROL_DDR_CKE_CTRL_DDR_CKE_CTRL;

    /* Enable VTP */
    HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) |= CONTROL_VTP_CTRL_ENABLE;
    HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) &= ~CONTROL_VTP_CTRL_CLRZ;
    HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) |= CONTROL_VTP_CTRL_CLRZ;
    while((HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) & CONTROL_VTP_CTRL_READY) !=
                CONTROL_VTP_CTRL_READY);


}

static void mDDRInit(void)
{
    volatile unsigned int delay = 0x10000;

    /* mDDR Phy initialization */
    mDDRPhyInit();

    /* Reset DDR PHY */                                             
    HWREG(SOC_EMIF_0_REGS + EMIF_IODFT_TLGC) |= (0x1 << 10);

    /* Wait until PHY is ready */
    while((HWREG(SOC_EMIF_0_REGS + EMIF_STATUS) &
                    EMIF_STATUS_REG_PHY_DLL_READY) == 0);

    /* Start functional mode */
    HWREG(SOC_EMIF_0_REGS + EMIF_IODFT_TLGC) |= 0x01;


    /* EMIF settings for DDR timings */
    HWREG(SOC_EMIF_0_REGS + EMIF_DDR_PHY_CTRL_1) = 0x05;           
    HWREG(SOC_EMIF_0_REGS + EMIF_DDR_PHY_CTRL_1_SHDW) = 0x05;
    HWREG(SOC_EMIF_0_REGS + EMIF_DDR_PHY_CTRL_2) = 0x05;

    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_1) = 0x04446249;         
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_1_SHDW) = 0x04446249;    
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_2) = 0x101731c0;          
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_2_SHDW) = 0x101731c0;    
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_3) = 0x137;          
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_3_SHDW) = 0x137;    
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG) = 0x20004ea3;        
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG_2) = 0x20004ea3;      
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL) = 0x00004650;       
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL_SHDW) =0x00004650;  

    while(delay--);      

    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG) = 0x20004ea3;        
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG_2) = 0x20004ea3;      

    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL) = 0x00004650;       
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL_SHDW) =0x00004650;  
} 

#elif defined (am335x_15x15)
static void DDR2PhyInit(void)
{
    /* Enable VTP */
    HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) |= CONTROL_VTP_CTRL_ENABLE;
    HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) &= ~CONTROL_VTP_CTRL_CLRZ;
    HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) |= CONTROL_VTP_CTRL_CLRZ;
    while((HWREG(SOC_CONTROL_REGS + CONTROL_VTP_CTRL) & CONTROL_VTP_CTRL_READY) !=
                CONTROL_VTP_CTRL_READY);

    /* DDR PHY CMD0 Register configuration */
    HWREG(CMD0_SLAVE_RATIO_0) = 0x80;
    HWREG(CMD0_SLAVE_FORCE_0) = 0x0;                       
    HWREG(CMD0_SLAVE_DELAY_0) = 0x0;
    HWREG(CMD0_LOCK_DIFF_0) = 0x4; 
    HWREG(CMD0_INVERT_CLKOUT_0) = 0x0;

    /* DDR PHY CMD1 Register configuration */
    HWREG(CMD1_SLAVE_RATIO_0) = 0x80;                 
    HWREG(CMD1_SLAVE_FORCE_0) =  0x0;                       
    HWREG(CMD1_SLAVE_DELAY_0) = 0x0;                       
    HWREG(CMD1_LOCK_DIFF_0) = 0x4;                        
    HWREG(CMD1_INVERT_CLKOUT_0) = 0x0;

    /* DDR PHY CMD2 Register configuration */
    HWREG(CMD2_SLAVE_RATIO_0) = 0x80;                 
    HWREG(CMD2_SLAVE_FORCE_0) = 0x0;                       
    HWREG(CMD2_SLAVE_DELAY_0) = 0x0;                       
    HWREG(CMD2_LOCK_DIFF_0) = 0x4;                        
    HWREG(CMD2_INVERT_CLKOUT_0) = 0x0;

    /* DATA macro configuration */
    HWREG(DATA0_RD_DQS_SLAVE_RATIO_0) = ((0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0));
    HWREG(DATA0_RD_DQS_SLAVE_RATIO_1) = (0x40 >> 2);
    HWREG(DATA0_WR_DQS_SLAVE_RATIO_0) = (( 0x00 << 30)|( 0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA0_WR_DQS_SLAVE_RATIO_1) = (0x00 >> 2);
    HWREG(DATA0_WRLVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA0_WRLVL_INIT_RATIO_1) = 0x00 >> 2;
    HWREG(DATA0_GATELVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA0_GATELVL_INIT_RATIO_1) = 0x00 >> 2;
    HWREG(DATA0_FIFO_WE_SLAVE_RATIO_0) = ((0x56 << 30)|(0x56 << 20)|(0x56<< 10)|(0x56 << 0));
    HWREG(DATA0_FIFO_WE_SLAVE_RATIO_1) = 0x56 >> 2;
    HWREG(DATA0_WR_DATA_SLAVE_RATIO_0) = (0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0);
    HWREG(DATA0_WR_DATA_SLAVE_RATIO_1) = 0x40 >> 2;      
    HWREG(DATA0_LOCK_DIFF_0) = 0x00;      


    HWREG(DATA1_RD_DQS_SLAVE_RATIO_0) = ((0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0));
    HWREG(DATA1_RD_DQS_SLAVE_RATIO_1) = (0x40 >> 2);
    HWREG(DATA1_WR_DQS_SLAVE_RATIO_0) = (( 0x00 << 30)|( 0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA1_WR_DQS_SLAVE_RATIO_1) = (0x00 >> 2);
    HWREG(DATA1_WRLVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA1_WRLVL_INIT_RATIO_1) = 0x00 >> 2;
    HWREG(DATA1_GATELVL_INIT_RATIO_0) = ((0x00 << 30)|(0x00 << 20)|(0x00 << 10)|(0x00 << 0));
    HWREG(DATA1_GATELVL_INIT_RATIO_1) =  0x00 >> 2;
    HWREG(DATA1_FIFO_WE_SLAVE_RATIO_0) = ((0x56 << 30)|(0x56 << 20)|(0x56 << 10)|(0x56 << 0));
    HWREG(DATA1_FIFO_WE_SLAVE_RATIO_1) = 0x56 >> 2;
    HWREG(DATA1_WR_DATA_SLAVE_RATIO_0)  = ((0x40 << 30)|(0x40 << 20)|(0x40 << 10)|(0x40 << 0));
    HWREG(DATA1_WR_DATA_SLAVE_RATIO_1) = 0x40 >> 2;      
    HWREG(DATA1_LOCK_DIFF_0) =  0x00;     
 
    HWREG(DATA0_USE_RANK0_DELAYS_0) = 1;
    HWREG(DATA1_USE_RANK0_DELAYS_0) = 1;

									
}    

void DDR2Init(void)
{
    volatile unsigned int delay = 5000;

    /* DDR2 Phy Initialization */
    DDR2PhyInit();

    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CMD_IOCTRL(0)) = 0x18B;
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CMD_IOCTRL(1)) = 0x18B;
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CMD_IOCTRL(2)) = 0x18B;
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_DATA_IOCTRL(0)) = 0x18B;
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_DATA_IOCTRL(1)) = 0x18B;

    /* IO to work for DDR2 */
    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_IO_CTRL) &= 0x0fffffff;

    HWREG(SOC_CONTROL_REGS + CONTROL_DDR_CKE_CTRL) |= CONTROL_DDR_CKE_CTRL_DDR_CKE_CTRL;


    HWREG(SOC_EMIF_0_REGS + EMIF_DDR_PHY_CTRL_1) = 0x05;
    HWREG(SOC_EMIF_0_REGS + EMIF_DDR_PHY_CTRL_1_SHDW) = 0x05;
    HWREG(SOC_EMIF_0_REGS + EMIF_DDR_PHY_CTRL_2) = 0x05;

    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_1) =  0x0666B3D6;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_1_SHDW) = 0x0666B3D6;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_2) = 0x143731DA;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_2_SHDW) = 0x143731DA;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_3) = 0x00000347;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_TIM_3_SHDW) = 0x00000347;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG) = 0x43805332;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG_2) = 0x43805332;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL) = 0x00004650;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL_SHDW) = 0x00004650;

    while(delay--);

    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL) = 0x0000081a;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_REF_CTRL_SHDW) = 0x0000081a;

    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG) =   0x43805332;
    HWREG(SOC_EMIF_0_REGS + EMIF_SDRAM_CONFIG_2) = 0x43805332;

}
#else
#error "---------------------------------------------------"
#error "           UNSUPPORTED MEMORY CONFIGURATION        "
#error "---------------------------------------------------"
#endif

void EMIFInit(void)
{
    volatile unsigned int regVal;

    /* Enable the clocks for EMIF */
    regVal = HWREG(SOC_CM_PER_REGS + CM_PER_EMIF_FW_CLKCTRL) &
                ~(CM_PER_EMIF_FW_CLKCTRL_MODULEMODE);

    regVal |= CM_PER_EMIF_FW_CLKCTRL_MODULEMODE_ENABLE;

    HWREG(SOC_CM_PER_REGS + CM_PER_EMIF_FW_CLKCTRL) = regVal;

    regVal = HWREG(SOC_CM_PER_REGS + CM_PER_EMIF_CLKCTRL) &
                ~(CM_PER_EMIF_CLKCTRL_MODULEMODE);

    regVal |= CM_PER_EMIF_CLKCTRL_MODULEMODE_ENABLE;

    HWREG(SOC_CM_PER_REGS + CM_PER_EMIF_CLKCTRL) = regVal;

    while((HWREG(SOC_CM_PER_REGS + CM_PER_L3_CLKSTCTRL) & 
          (CM_PER_L3_CLKSTCTRL_CLKACTIVITY_EMIF_GCLK | 
           CM_PER_L3_CLKSTCTRL_CLKACTIVITY_L3_GCLK)) != 
          (CM_PER_L3_CLKSTCTRL_CLKACTIVITY_EMIF_GCLK | 
           CM_PER_L3_CLKSTCTRL_CLKACTIVITY_L3_GCLK));
}

/*
 * \brief This function is used to initialize and configure NAND.
 *
 * \param  none.
 *
 * \return none
*/

void NANDSetup(void)
{
#ifdef evmAM335x
    /* Enable clock for NAND and Do the PINMUXing */
    NANDPinMuxSetup();

    GPMCClkConfig();
#endif
}

/*
 * \brief This function is used to initialize and configure SPI Module.
 *
 * \param  none.
 *
 * \return none
*/

void SPISetup(void)
{
#if defined (SPI)
    unsigned int regVal;

    /* Enable clock for SPI */
    regVal = (HWREG(SOC_CM_PER_REGS + CM_PER_SPI0_CLKCTRL) &
                    ~(CM_PER_SPI0_CLKCTRL_MODULEMODE));

    regVal |= CM_PER_SPI0_CLKCTRL_MODULEMODE_ENABLE;

    HWREG(SOC_CM_PER_REGS + CM_PER_SPI0_CLKCTRL) = regVal;

    /* Setup SPI PINMUX */ 
    McSPIPinMuxSetup(0);
    McSPI0CSPinMuxSetup(0);

    SPIConfigure();
#endif
}

/*
 * \brief This function is used to initialize and configure UART Module.
 *
 * \param  none.
 *
 * \return none
*/

void UARTSetup(void)
{
    volatile unsigned int regVal;

    /* Enable clock for UART0 */
    regVal = (HWREG(SOC_CM_WKUP_REGS + CM_WKUP_UART0_CLKCTRL) &
                    ~(CM_WKUP_UART0_CLKCTRL_MODULEMODE));

    regVal |= CM_WKUP_UART0_CLKCTRL_MODULEMODE_ENABLE;

    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_UART0_CLKCTRL) = regVal;

    UARTStdioInit();
}

/*
 * \brief This function Initializes Pll, DDR and Uart
 *
 * \param  none
 *
 * \return none
*/
void DeviceConfig(void)
{
    #ifdef am335x_15x15
    #ifdef evmAM335x
         configVddOpVoltage();
        #ifdef  OPP_SR_TURBO
               /* 
               **set vdd1 voltage to 1.26v .This
               **voltage is configure by writing 
               **0x38 to SEL(0:6) bitfiled of VDD1_OP_REG.
               **
               ** Vout = (SEL(0:6) * 12.5mv + 562.5mv)
               */
               setVdd1OpVoltage(0x38);
        #elif  (defined OPP_120)
               /* 
               **set vdd1 voltage to 1.2v .This
               **voltage is configure by writing 
               **0x38 to SEL(0:6) bitfiled of VDD1_OP_REG.
               **
               ** Vout = (SEL(0:6) * 12.5mv + 562.5mv)
               */
              setVdd1OpVoltage(0x33);
        #endif
    #elif  (defined beaglebone)
        configVddOpVoltage();
    #else
        #error Unsupported EVM !!
    #endif
    #endif

    HWREG(SOC_WDT_1_REGS + WDT_WSPR) = 0xAAAAu;
    while(HWREG(SOC_WDT_1_REGS + WDT_WWPS) != 0x00);

    HWREG(SOC_WDT_1_REGS + WDT_WSPR) = 0x5555u;
    while(HWREG(SOC_WDT_1_REGS + WDT_WWPS) != 0x00);
    
    /* Set the PLL0 to generate 300MHz for ARM */
    PLLInit();

    /* Enable the control module */
    HWREG(SOC_CM_WKUP_REGS + CM_WKUP_CONTROL_CLKCTRL) =
            CM_WKUP_CONTROL_CLKCTRL_MODULEMODE_ENABLE;
   
    /* EMIF Initialization */
    EMIFInit();

    /* DDR Initialization */
#ifdef am335x_13x13 
    mDDRInit();
#elif defined(am335x_15x15)
    DDR2Init();
#endif    
    /* UART Initialization */
    UARTSetup();

#ifdef SPI
    SPISetup();
#elif defined(NAND)
    NANDSetup();
#endif

}


/******************************************************************************
**                              END OF FILE
*******************************************************************************/
