/**
 * \file  i2cEdma.c
 *
 * \brief Sample application for i2cEdma
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

#include "i2c.h"
#include "psc.h"
#include "edma.h"
#include "interrupt.h"
#include "edma_event.h"
#include "soc_AM1808.h"
#include "hw_psc_AM1808.h"
#include "evmAM1808.h"
#include "hw_types.h"
#include "hw_edma3cc.h"
#include "uartStdio.h"

/*********************************************************************************
**                    INTERNAL MACRO DEFINITION
*********************************************************************************/
#define I2C_SLAVE_ADDR            (0x21u) /* I2C address of TCA6416 expander  */
#define I2C_EXP_CMD_WRITE_PORT0   (0x02u) /* Command byte to select output  
                                           * register*/
#define I2C_EXP_CMD_CONFIG_PORT0  (0x06u) /* Cmd to TCA6416 to configure port0*/
#define I2C_EXP_PORT0_LED_ON      (0x00u) /* Turn on the LEDs       */
#define I2C_EXP_PORT0_LED_OFF     (0xc0u) /* Turn off the LEDs     */


/*******************************************************************************
**                   INTERNAL FUNCTION PROTOTYPE
*******************************************************************************/
static void RegisterEdma3Interrupts(void);
static void EdmaConfig(unsigned int);
static void SetupI2CTransmit(void);
static void SetupAINTCInt(void);
static void BlinkDelay(void);
static void SetupI2C(void);
static void SetupEdma(void);
void I2CEdmaErrIsr(void);
void I2CEdmaIsr(void);

/*******************************************************************************
**                   INTERNAL VARIABLE DEFINITION
*******************************************************************************/
volatile int error = 0;
volatile unsigned int flag = 1;
unsigned char srcBuff[2]  = {I2C_EXP_CMD_CONFIG_PORT0 , 0x3f};
unsigned char srcBuff1[2] = {I2C_EXP_CMD_WRITE_PORT0  , I2C_EXP_PORT0_LED_ON};
unsigned char srcBuff2[2] = {I2C_EXP_CMD_WRITE_PORT0  , I2C_EXP_PORT0_LED_OFF}; 

int main(void)
{

    unsigned int num;

    I2CPinMuxSetup(0);

    SetupEdma();

    /*
    ** Configures I2C to Master mode to generate start codition
    ** on I2C bus and to transmit data at a bus speed of  100khz
    */
    SetupI2C();

    SetupI2CTransmit();

    for(num = 100 ;num!=0; num--)
    {
         EdmaConfig((unsigned int)srcBuff1);

         SetupI2CTransmit();

         if(error == -1)
              return error;

         BlinkDelay();

         EdmaConfig((unsigned int)srcBuff2);

         SetupI2CTransmit();

         if(error == -1)
              return error;
   
         BlinkDelay();
   }

   while(1);
}

/*
** Configures Edma to transmit 2 bytes to
** i2c transmit register.
*/
static void EdmaConfig(unsigned int address)
{
    EDMA3CCPaRAMEntry paramSet;
  
    paramSet.srcAddr    = address;
    paramSet.destAddr   = (SOC_I2C_0_REGS + I2C_ICDXR);

    /*
    ** I2C generates one EDMA event whenever I2CXSR is empty.There is space
    ** for only one byte of data in I2CXSR.There is no fifo.Hence per event
    ** one bytes needs to be transfered.Thus EDMA is configured in ASYNC mode
    ** with acount = 1, bcount = total_numbytes, ccount = 1.BSRC index should
    ** be 1 since memory pointer needs to incremented one after every byte 
    ** transfer by EDMA.BDST index should be zero since the destination address
    ** is in constant adrressing mode(hardware register).
    **
    */
    paramSet.srcBIdx    = 0x01;
    paramSet.srcCIdx    = 0x00;
    paramSet.destBIdx   = 0x00;
    paramSet.destCIdx   = 0x00;
    paramSet.aCnt       = 0x01;
    paramSet.bCnt       = 0x02;             
    paramSet.cCnt       = 0x01;
    paramSet.bCntReload = 0x00;
    paramSet.linkAddr   = 0xffff;
    paramSet.opt        = 0;

    /* Program the TCC */
    paramSet.opt |= ((EDMA3_CHA_I2C0_TX << EDMA3CC_OPT_TCC_SHIFT) & EDMA3CC_OPT_TCC);

    /* Transmission complition interrupt enable */
    paramSet.opt |= (1 << EDMA3CC_OPT_TCINTEN_SHIFT);
 
    /* configure PaRAM Set */ 
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS,  EDMA3_CHA_I2C0_TX, &paramSet);
	        
    /* Enable the transfet */	        
    EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS,  EDMA3_CHA_I2C0_TX, EDMA3_TRIG_MODE_EVENT);
}


/*
** Enables PSC for EDMA Channel and Transfer Controller.
** Registers Edma Interrupt.
** Configures Edma to transmit 2 bytes to
** i2c transmit register.
*/
static void SetupEdma(void)
{
    volatile unsigned int evtQ = 0;
    EDMA3CCPaRAMEntry paramSet;

    /* Enabling the PSC for EDMA3CC_0.*/
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_CC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    /* Enabling the PSC for EDMA3TC_0.*/
    PSCModuleControl(SOC_PSC_0_REGS, HW_PSC_TC0, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    /*
    ** Enable AINTC to handle interrupts. Also enable IRQ interrupt in ARM 
    ** processor.
    */
    SetupAINTCInt();

    /* Intialize the Edma */
    EDMA3Init(SOC_EDMA30CC_0_REGS, evtQ);

    /* Register required edma interrupts */
    RegisterEdma3Interrupts();

    /* Request DMA Channel and TCC */ 
    EDMA3RequestChannel(SOC_EDMA30CC_0_REGS, EDMA3_CHANNEL_TYPE_DMA ,
                       EDMA3_CHA_I2C0_TX , EDMA3_CHA_I2C0_TX , evtQ);

    paramSet.srcAddr    = (unsigned int)srcBuff;
    paramSet.destAddr   = (SOC_I2C_0_REGS + I2C_ICDXR);
    paramSet.srcBIdx    = 0x01;
    paramSet.srcCIdx    = 0x00;
    paramSet.destBIdx   = 0x00;
    paramSet.destCIdx   = 0x00;
    paramSet.aCnt       = 0x01;
    paramSet.bCnt       = 0x02;              
    paramSet.cCnt       = 0x01;
    paramSet.bCntReload = 0x00;
    paramSet.linkAddr   = 0xffff;
    paramSet.opt        = 0;

    /* Program the TCC */
    paramSet.opt |= (( EDMA3_CHA_I2C0_TX << EDMA3CC_OPT_TCC_SHIFT) & EDMA3CC_OPT_TCC);

    /* Transmission complition interrupt enable */
    paramSet.opt |= (1 << EDMA3CC_OPT_TCINTEN_SHIFT);

    /* configure PaRAM Set */ 
    EDMA3SetPaRAM(SOC_EDMA30CC_0_REGS, EDMA3_CHA_I2C0_TX , &paramSet);

    /* Enable the transfet */	        
    EDMA3EnableTransfer(SOC_EDMA30CC_0_REGS, EDMA3_CHA_I2C0_TX , EDMA3_TRIG_MODE_EVENT);

    /* on i2c reset both tx and rx events are enabled.
     * Both rx and tx events are disabled by this API
     */
    I2CDMATxRxEventDisable(SOC_I2C_0_REGS);
}

/*
** Registers EDMA Completion and Error Interrupt
**
*/
static void RegisterEdma3Interrupts(void)
{
    /*
    ** Registers the I2CIsr in the Interrupt Vector Table of
    ** AINTC.
    */
    IntRegister(SYS_INT_CCINT0, I2CEdmaIsr);

    /*
    ** Map the channel number 2 of AINTC to EDMA3_0 Channel Controller Transfer
    ** completion system interrput.Channel number 2 of AINTC is mapped to IRQ 
    ** interrupt of ARM9 processor.
    */
    IntChannelSet(SYS_INT_CCINT0, 2);

    /*
    ** Enable the EDMA3_0 Channel Controller Transfer 
    ** completion system interrupt in AINTC.
    */
    IntSystemEnable(SYS_INT_CCINT0);

    /*
    ** Registers the I2CEdmaIsr in the Interrupt Vector Table of
    ** AINTC.
    */
    IntRegister(SYS_INT_CCERRINT, I2CEdmaErrIsr);

    /*
    ** Map the channel number 2 of AINTC to EDMA3_0 Channel Controller Error
    ** system inerrupt of AINTC is mapped to IRQ interrupt of ARM9 processor.
    */
    IntChannelSet(SYS_INT_CCERRINT, 2);

    /* Enable the EDMA3_0 Channel Controller Error system interrupt  in AINTC.*/
    IntSystemEnable(SYS_INT_CCERRINT);
}

/*
** Clears the pending interrupt in EDMA,Disables the Transmit
** Event generated by I2C and Disables EDMA Transfer
*/
void I2CEdmaIsr(void)
{
    volatile unsigned int pendingIrqs;
    volatile unsigned int val;

    IntSystemStatusClear(SYS_INT_CCINT0);

    /* Get status of the interrupt */
    pendingIrqs = EDMA3GetIntrStatus(SOC_EDMA30CC_0_REGS);

    val = (0x01 << EDMA3_CHA_I2C0_TX);

    if((pendingIrqs & val))
    {
         /* clear the pending interrupt */
         EDMA3ClrIntr(SOC_EDMA30CC_0_REGS, EDMA3_CHA_I2C0_TX);
    }

    /* Disable the transmit event */
    I2CDMATxEventDisable(SOC_I2C_0_REGS);

    /* Disable Edma Transfer */
    EDMA3DisableTransfer(SOC_EDMA30CC_0_REGS , EDMA3_CHA_I2C0_TX , EDMA3_TRIG_MODE_EVENT);
   
    flag = 0;
}

/*
** Clears the pending error interrupt in EDMA,Disables the Transmit
** Event generated by I2C and Disables EDMA Transfer
*/
void I2CEdmaErrIsr(void)
{
    volatile  unsigned int pendingIrqs;

    IntSystemStatusClear(SYS_INT_CCERRINT);

    /* Get status of the error interrupt */
    EDMA3GetErrIntrStatus(SOC_EDMA30CC_0_REGS);

    if((pendingIrqs & (0x01 << EDMA3_CHA_I2C0_TX )))
    {
         /* clear the pending error interrupt */
           EDMA3ClrIntr(SOC_EDMA30CC_0_REGS,  EDMA3_CHA_I2C0_TX);  
    }
    /* Disable the transmit event */
    I2CDMATxEventDisable(SOC_I2C_0_REGS);

    /* Disable Edma Transfer */
    EDMA3DisableTransfer(SOC_EDMA30CC_0_REGS , EDMA3_CHA_I2C0_TX , EDMA3_TRIG_MODE_EVENT);

    flag = 0;

    error = -1;
}

/*
** Configures ARM interrupt Controller.
**
*/
static void SetupAINTCInt(void)
{
    /* Initialize the ARM Interrupt Controller(AINTC). */
    IntAINTCInit();

    /* Enable IRQ in CPSR.*/     
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

/*
** Configures I2C to communicate with I/0 Expander
** at 100kbps
*/
static void SetupI2C(void)
{
    /* Put i2c in reset/disabled state */
    I2CMasterDisable(SOC_I2C_0_REGS);

    /* Configure i2c bus speed to 100khz */
    I2CMasterInitExpClk(SOC_I2C_0_REGS, 24000000, 8000000, 100000);

    /* Set i2c slave address */
    I2CMasterSlaveAddrSet(SOC_I2C_0_REGS, I2C_SLAVE_ADDR);

    /* Bring i2c out of reset */
    I2CMasterEnable(SOC_I2C_0_REGS);
}

/*
** Enables Transmit Event to be generated by the I2C,generates
** start condition on i2c bus and waits still stop generated.
*/
static void SetupI2CTransmit()
{
    unsigned int status = 0;

     /* configures number of transfer carried out 
     ** before generating stop condition
     */
    I2CSetDataCount(SOC_I2C_0_REGS, 2);
    /* 
    ** Configure i2c has master-transmitter and to generate stop condition
    ** when value in internal data count register count down to zero
    */
    I2CMasterControl(SOC_I2C_0_REGS, I2C_CFG_MST_TX |I2C_CFG_STOP);

    /* Enable transmit event of I2C */ 
    I2CDMATxEventEnable(SOC_I2C_0_REGS);

    I2CMasterStart(SOC_I2C_0_REGS);

    /* Wait for the START to be reflected on the bus.
     * This can be checked by waiting for BUS BUSY condition set.
     */

    while(I2CMasterBusBusy(SOC_I2C_0_REGS) == 0);

    while(flag);

    flag = 1;

    /* Wait for the STOP to be reflected on the bus.
     * This can be checked by waiting for the SCD on the bus
     */
    do {
	status = I2CMasterIntStatus(SOC_I2C_0_REGS) & I2C_INT_STOP_CONDITION;
    } while(status == 0);

    /* Clear the SCD status bit */
   I2CMasterIntClearEx(SOC_I2C_0_REGS, I2C_CLEAR_STOP_CONDITION);
}

static void BlinkDelay()
{
    volatile unsigned int delay = 0x7ffff;

    while(delay--);
}


/******************************* End of file ********************************/
