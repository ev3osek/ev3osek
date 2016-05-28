/**
 * \file   lcd.c
 *
 * \brief  This file contains the board specific code for enabling the use of
 *         lcd driver.
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

/* HW Macros */
#include "hw_syscfg0_AM1808.h"
#include "soc_AM1808.h"
#include "hw_types.h"
#include "evmAM1808.h"
#include "psc.h"
#include "gpio.h"

/* NOTE:
** The Raster LCD display panel power and backlight are controlled via GPIO pins
** These pins are GPIO bank 2, pin 15 for backlight and GPIO bank 2, pin 8 for
** power. These are configured as show in ConfigRasterDisplayEnable() below.
** This has been tested with 1016660 REV A experimenter (base) board, and
** 1012041 REV B board. Please refer to schematics on your board and make
** changes correspondingly if required.
*/
/*****************************************************************************
**                      MACRO DEFINITIONS
*****************************************************************************/
#define PINMUX16_LCD_ENABLE     (SYSCFG_PINMUX16_PINMUX16_31_28_LCD_D2 << \
                                 SYSCFG_PINMUX16_PINMUX16_31_28_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_27_24_LCD_D3 << \
                                 SYSCFG_PINMUX16_PINMUX16_27_24_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_23_20_LCD_D4 << \
                                 SYSCFG_PINMUX16_PINMUX16_23_20_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_19_16_LCD_D5 << \
                                 SYSCFG_PINMUX16_PINMUX16_19_16_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_15_12_LCD_D6 << \
                                 SYSCFG_PINMUX16_PINMUX16_15_12_SHIFT) | \
                                (SYSCFG_PINMUX16_PINMUX16_11_8_LCD_D7 << \
                                 SYSCFG_PINMUX16_PINMUX16_11_8_SHIFT)

#define PINMUX17_LCD_ENABLE     (SYSCFG_PINMUX17_PINMUX17_31_28_LCD_D10 << \
                                 SYSCFG_PINMUX17_PINMUX17_31_28_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_27_24_LCD_D11 << \
                                 SYSCFG_PINMUX17_PINMUX17_27_24_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_23_20_LCD_D12 << \
                                 SYSCFG_PINMUX17_PINMUX17_23_20_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_19_16_LCD_D13 << \
                                 SYSCFG_PINMUX17_PINMUX17_19_16_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_15_12_LCD_D14 << \
                                 SYSCFG_PINMUX17_PINMUX17_15_12_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_11_8_LCD_D15 << \
                                 SYSCFG_PINMUX17_PINMUX17_11_8_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_7_4_LCD_D0 << \
                                 SYSCFG_PINMUX17_PINMUX17_7_4_SHIFT) | \
                                (SYSCFG_PINMUX17_PINMUX17_3_0_LCD_D1 << \
                                 SYSCFG_PINMUX17_PINMUX17_3_0_SHIFT)

#define PINMUX18_LCD_ENABLE     (SYSCFG_PINMUX18_PINMUX18_31_28_LCD_MCLK << \
                                 SYSCFG_PINMUX18_PINMUX18_31_28_SHIFT) | \
                                (SYSCFG_PINMUX18_PINMUX18_27_24_LCD_PCLK << \
                                 SYSCFG_PINMUX18_PINMUX18_27_24_SHIFT) | \
                                (SYSCFG_PINMUX18_PINMUX18_7_4_LCD_D8 << \
                                 SYSCFG_PINMUX18_PINMUX18_7_4_SHIFT) | \
                                (SYSCFG_PINMUX18_PINMUX18_3_0_LCD_D9 << \
                                 SYSCFG_PINMUX18_PINMUX18_3_0_SHIFT)
 
#define PINMUX19_LCD_ENABLE     (SYSCFG_PINMUX19_PINMUX19_27_24_NLCD_AC_ENB_CS << \
                                 SYSCFG_PINMUX19_PINMUX19_27_24_SHIFT) | \
                                (SYSCFG_PINMUX19_PINMUX19_7_4_LCD_VSYNC << \
                                 SYSCFG_PINMUX19_PINMUX19_7_4_SHIFT) | \
                                (SYSCFG_PINMUX19_PINMUX19_3_0_LCD_HSYNC << \
                                 SYSCFG_PINMUX19_PINMUX19_3_0_SHIFT)


#define PINMUX5_GPIO2_15_ENABLE    (SYSCFG_PINMUX5_PINMUX5_3_0_GPIO2_15     << \
                                    SYSCFG_PINMUX5_PINMUX5_3_0_SHIFT)

#define PINMUX18_GPIO2_8_ENABLE   (SYSCFG_PINMUX5_PINMUX5_31_28_GPIO2_8 << \
                                    SYSCFG_PINMUX5_PINMUX5_31_28_SHIFT)
   
/******************************************************************************
**                      INTERNAL FUNCTION PROTOTYPES
*******************************************************************************/

/*****************************************************************************
**                       FUNCTION DEFINITION
*****************************************************************************/

/**
 * \brief   This function selects the LCD pins for use. The LCD pins
 *          are multiplexed with pins of other peripherals in the
 *          System on Chip(SoC).
 *
 * \param   None.
 *
 * \return  None.
 */

void LCDPinMuxSetup(void)
{
     unsigned int savePinMux = 0;


     /* Programming the PINMUX16 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX16 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(16)) & \
                        ~(SYSCFG_PINMUX16_PINMUX16_31_28 | \
                          SYSCFG_PINMUX16_PINMUX16_27_24 | \
                          SYSCFG_PINMUX16_PINMUX16_23_20 | \
                          SYSCFG_PINMUX16_PINMUX16_19_16 | \
                          SYSCFG_PINMUX16_PINMUX16_15_12 | \
                          SYSCFG_PINMUX16_PINMUX16_11_8);


     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX16  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(16)) = \
          (PINMUX16_LCD_ENABLE | savePinMux);
 
     /* Programming the PINMUX17 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX17 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(17)) & \
                        ~(SYSCFG_PINMUX17_PINMUX17_31_28 | \
                          SYSCFG_PINMUX17_PINMUX17_27_24 | \
                          SYSCFG_PINMUX17_PINMUX17_23_20 | \
                          SYSCFG_PINMUX17_PINMUX17_19_16 | \
                          SYSCFG_PINMUX17_PINMUX17_15_12 | \
                          SYSCFG_PINMUX17_PINMUX17_11_8 | \
                          SYSCFG_PINMUX17_PINMUX17_7_4 | \
                          SYSCFG_PINMUX17_PINMUX17_3_0);

     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX17  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(17)) = \
          (PINMUX17_LCD_ENABLE | savePinMux);

     /* Programming the PINMUX18 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX18 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(18)) & \
                       ~(SYSCFG_PINMUX18_PINMUX18_31_28 | \
                         SYSCFG_PINMUX18_PINMUX18_27_24 | \
                         SYSCFG_PINMUX18_PINMUX18_7_4 |  \
                         SYSCFG_PINMUX18_PINMUX18_3_0);

     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX18  register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(18)) = \
           (PINMUX18_LCD_ENABLE | savePinMux);
     

     /* Programming the PINMUX19 register. */

     /*
     ** Clearing the pins in context and retaining the other pin values
     ** of PINMUX19 register.
     */
     savePinMux = HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) & \
                       ~(SYSCFG_PINMUX19_PINMUX19_27_24 | \
                         SYSCFG_PINMUX19_PINMUX19_7_4 | \
                         SYSCFG_PINMUX19_PINMUX19_3_0);
 
     /* 
     ** Performing the actual Pin Multiplexing to select relevant pins in
     ** PINMUX19 register.
     */
     HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(19)) = \
          (PINMUX19_LCD_ENABLE | savePinMux);

}

static void Delay(volatile unsigned int delay)
{
    while(delay--);
}
	
void ConfigRasterGpioPins(void)
{
    unsigned int savePinmux = 0;
    
    savePinmux = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) &
                  ~(SYSCFG_PINMUX5_PINMUX5_3_0));

     /* Setting the BACK LIGHT control pin */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) = 
          (PINMUX5_GPIO2_15_ENABLE | savePinmux);

    savePinmux = (HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) &
                  ~(SYSCFG_PINMUX5_PINMUX5_31_28));

    /* Setting the POWER ENABLE control pin */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_PINMUX(5)) =
          (PINMUX18_GPIO2_8_ENABLE | savePinmux);
}

 /*
 **  Function to enable display panel power and the backlight for the LCD display
 **  panel                                                              
 */
void ConfigRasterDisplayEnable(void)
{
    /* The Local PSC number for GPIO is 3. GPIO belongs to PSC1 module.*/
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_GPIO, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    ConfigRasterGpioPins();

    /* Sets the pin 48 (GP2[15]) as output for BACK LIGHT control */
    GPIODirModeSet(SOC_GPIO_0_REGS, 48, GPIO_DIR_OUTPUT);

    /* Sets the pin 139(GP18[10]) as output for POWER ENABLE control */
    GPIODirModeSet(SOC_GPIO_0_REGS, 41, GPIO_DIR_OUTPUT);

    /*
    ** Configure rising edge and falling edge triggers on pin 48to generate
    ** an interrupt
    */
    GPIOIntTypeSet(SOC_GPIO_0_REGS, 48, GPIO_INT_TYPE_BOTHEDGE);
  
    /*
    ** Configure rising edge and falling edge triggers on pin 48to generate
    ** an interrupt
    */
    GPIOIntTypeSet(SOC_GPIO_0_REGS, 41, GPIO_INT_TYPE_BOTHEDGE);

    /* Disable backlight */
    GPIOPinWrite(SOC_GPIO_0_REGS, 48, 0);
    Delay(0xFFFFF);

    /* Disable power */
    GPIOPinWrite(SOC_GPIO_0_REGS, 41, 0);
    Delay(0xFFFFF);

    /* Enable back light */
    GPIOPinWrite(SOC_GPIO_0_REGS, 48, 1);
    Delay(0xFFFFF);

    /* Enable power */
    GPIOPinWrite(SOC_GPIO_0_REGS, 41, 1);
    Delay(0xFFFFF);
}

/**  
 * \brief  This API returns a unique number which identifies itself  
 *         with the LCDC IP in AM1808 SoC.  
 * \param  None  
 * \return This returns a number '1' which is unique to LCDC IP in AM1808.
 */
unsigned int LCDVersionGet(void)
{
    return 1;
}

/****************************** End of file *********************************/
