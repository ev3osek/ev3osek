/**
 * \file    gpioCardDetect.c
 *
 * \brief   This is a sample application file demonstrating the use of
 *          a GPIO pin to generate an interrupt whenever an MMC/SD card
 *          is inserted or ejected from the Evaluation Module(EVM).
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

#include "interrupt.h"
#include "uartStdio.h"
#include "gpio.h"
#include "psc.h"

#include "soc_AM1808.h"
#include "evmAM1808.h"

/****************************************************************************/
/*              LOCAL FUNCTION PROTOTYPES                                   */
/****************************************************************************/
static void Delay(volatile unsigned int delay);
static void ConfigureIntGPIO(void);
static void CheckCardStatus(void);
static void SetupInt(void);
static void GPIOIsr(void);

/****************************************************************************/
/*              GLOBAL VARIABLES                                            */
/****************************************************************************/
volatile unsigned char flag = 0;

/****************************************************************************/
/*             LOCAL FUNCTION DEFINITIONS                                   */
/****************************************************************************/

int main(void)
{


    /* The Local PSC number for GPIO is 3. GPIO belongs to PSC1 module.*/
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_GPIO, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    /* Initializes the UART instance.*/
    UARTStdioInit();   

    /* Pin Multiplexing of pin 0 of GPIO Bank 4.*/
    GPIOBank4Pin0PinMuxSetup();

    /* Sets the pin 65(GP4[0]) as input.*/
    GPIODirModeSet(SOC_GPIO_0_REGS, 65, GPIO_DIR_INPUT);

    /*
    ** Configure rising edge and falling edge triggers on pin 65 to generate
    ** an interrupt
    */
    GPIOIntTypeSet(SOC_GPIO_0_REGS, 65, GPIO_INT_TYPE_BOTHEDGE);

    /* Enable interrupts for Bank 4.*/
    GPIOBankIntEnable(SOC_GPIO_0_REGS, 4);

    /* Configuring the AINTC to handle interrupts.*/
    SetupInt();
    
    /* Configure GPIO interrupts */
    ConfigureIntGPIO();

    UARTPuts("StarterWare AM1808 GPIO Demo Application.\r\n", -2);
    UARTPuts("Insert an MMC/SD card.\r\n", -2);

    while(1)
    {
        if(flag == 1)
        {
            CheckCardStatus();
        }
    }

} 



/*
** \brief   This function invokes necessary functions to configure the ARM 
**          processor and ARM Interrupt Controller(AINTC) to receive and
**          handle interrupts.
*/

static void SetupInt(void)
{
	// Setup ARM or DSP interrupt controller

#ifdef _TMS320C6X
	// Initialize the DSP Interrupt Controller
	IntDSPINTCInit();

	// Enable DSP Interrupts Globally
	IntGlobalEnable();
#else
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

     /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
#endif
}


/*
** \brief  This function configures the AINTC to receive the GPIO interrupt.
*/

static void ConfigureIntGPIO(void)
{
	// Configure GPIO interrupts for ARM or DSP

#ifdef _TMS320C6X
	// Register the ISR in the Interrupt Vector Table
	IntRegister(C674X_MASK_INT4, GPIOIsr);

	// Map the system interrupt to the DSP maskable interrupt
	IntEventMap(C674X_MASK_INT4, SYS_INT_GPIO_B4INT);

	// Enable DSP maskable interrupt
	IntEnable(C674X_MASK_INT4);
#else
    // Register the ISR in the Interrupt Vector Table.
    IntRegister(SYS_INT_GPIOB4, GPIOIsr);

    // Map the channnel number 2 of AINTC to GPIO BANK 4 system interrupt.
    IntChannelSet(SYS_INT_GPIOB4, 2);

    // Enable the System Interrupts for AINTC.
    IntSystemEnable(SYS_INT_GPIOB4);
#endif
}


/*
** \brief   Interrupt Service Routine to be executed on GPIO interrupts.
**          This disables the bank interrupts, clears the system interrupt
**          status and pin interrupt status. This also sets flag as 1.
*/
static void GPIOIsr(void)
{
    /* Disable the interrupts for pins of bank 4 in GPIO.*/
    GPIOBankIntDisable(SOC_GPIO_0_REGS, 4);

#ifdef _TMS320C6X
    // Clear the system interrupt status in the DSPINTC
    IntEventClear(SYS_INT_GPIO_B4INT);
#else
    /* Clears the system interrupt status of GPIO in AINTC.*/
    IntSystemStatusClear(SYS_INT_GPIOB4);
#endif

    /* Clears the Interrupt Status of GP4[0] in GPIO.*/
    GPIOPinIntClear(SOC_GPIO_0_REGS, 65);

    flag = 1;
}

/*
** \brief  This function checks the insertion status of the MMC/SD card
**         in the device and prints related statements on the serial
**         commuincation console of the external device.
**         
*/

static void CheckCardStatus(void)
{
    Delay(0x1FFF);
    
#ifdef _TMS320C6X
    // Clear the system interrupt status in the DSPINTC
    IntEventClear(SYS_INT_GPIO_B4INT);
#else
    /* Clears the system interrupt status of GPIO in AINTC.*/
    IntSystemStatusClear(SYS_INT_GPIOB4);
#endif

    /* Clears the Interrupt Status of GP4[0] in GPIO.*/
    GPIOPinIntClear(SOC_GPIO_0_REGS, 65);
    
    /* 
    ** 'GPIOPinRead' here returns the value on the GP4[0].
    ** If value returned is 1, it implies the card is removed.
    ** If value returned is 0, it implies the card is inserted.
    */

    if (GPIOPinRead(SOC_GPIO_0_REGS, 65))
    {
        UARTPuts("MMC/SD card is removed.\n\r", -2);
    }
    else
    {
        UARTPuts("MMC/SD card inserted.\n\r", -2);
    }

    flag = 0;

    /* Enable interrupts for pins of bank 4.*/
    GPIOBankIntEnable(SOC_GPIO_0_REGS, 4);
}

/*
** \brief   This function can be called to generate a delay.
*/

static void Delay(volatile unsigned int delay)
{
    while(delay--);
}


/*****************************END OF FILE************************************/
