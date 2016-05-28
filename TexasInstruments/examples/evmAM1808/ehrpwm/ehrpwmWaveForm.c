/**
 * \file    ehrpwmWaveForm.c
 *
 * \brief   This is a sample application file demonstrating the use of
 *          a EHRPWM to generate different waveforms demonstrating the 
 *          capability of each sub-module.
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

#include "uart.h"
#include "psc.h"
#include "soc_AM1808.h"
#include "interrupt.h"
#include "hw_types.h"
#include "hw_syscfg0_AM1808.h"
#include "evmAM1808.h"
#include "ehrpwm.h"

/* Enable to demonstrate High resolution capability*/
/* #define HR_EN	1 */

/* Enable one of the macros in addition to BASIC_WF to get the corresponding 
 * waveform
 * */
#ifndef HR_EN
	#define BASIC_WF	1
	/* #define DB_GEN	1 */
	 #define CHP_EN	1 
	/* #define TRIP_EN	1 */
	/* #define SYNC_EN	1 */  /* Note: Reset the target before enabling this */
#endif

#define CLOCK_DIV_VAL		10


/****************************************************************************/
/*              LOCAL FUNCTION PROTOTYPES                                   */
/****************************************************************************/

static void SetupIntc(void);
static void PWMEventIsr(void);
static void PWMTZIsr(void);


	/* This feature is useful to position the edges at very high resolution.
	 * The MEP (micro-edge position) is added to the raising edge of the PWM signal. 
	 * */
#ifdef HR_EN
	static void HighResWaveform(void);
#else

	/* Generate basic waveform on PWM1A. With the period set to 256 count, the PWM is 
	 * configured to toggle when count equals 63 and 191, resulting in a square waveform. 
	 * The PWM is configured to gentrate interrupt when count == CMPB.
	 * */
	static void GenPWM1A_Basic(void);

	/* In additon to the basic waveform, the software sync in is triggered when interupt 
	 * occurs (count == CMPB). On sync-in, the counter is reloaded to 250. Now the 
	 * counter will count from 250 and reset after 255. 
	 * */
	#ifdef SYNC_EN
		static void SyncWaveform(void);

	#elif DB_GEN
	/* In addition to the basic waveform, dead band is added. In this example dead band 
	 * is added to the Raising edge of PWM1A signal.
	 * */
	static void GenDeadBandWavefrom(void);

	#elif CHP_EN
	/* In addition to the basic waveform, the waveform is chopped using the chopper 
	 * sub-module. In this case the width of the first pulse, duty cycle of the remaining 
	 * pulses and frequency of the carrier signal can be configured.
	 * */
	static void GenChopperWaveform(void);

	#else /* TRIP_EN */
	/* In addition to the basic waveform, the trip feature is demonstrated. The trip signal 
	 * is software triggered cyclically after a delay. On each trip event the signal is toggled.
	 * */
	static void TripWaveform(void);
	#endif
#endif


/****************************************************************************/
/*             LOCAL FUNCTION DEFINITIONS                                   */
/****************************************************************************/


int main(void)
{
    SetupIntc();

    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_EHRPWM, PSC_POWERDOMAIN_ALWAYS_ON,
		     PSC_MDCTL_NEXT_ENABLE);

    EHRPWM1PinMuxSetup();
    
#ifdef BASIC_WF    
    GenPWM1A_Basic();
#endif

#ifdef SYNC_EN
    GenPWM1A_Basic();
    SyncWaveform();
#endif

#ifdef DB_GEN
    GenPWM1A_Basic();
    GenDeadBandWavefrom();
#endif

#ifdef CHP_EN
    GenPWM1A_Basic();
    GenChopperWaveform();
#endif

#ifdef TRIP_EN
    GenPWM1A_Basic();
    TripWaveform();
#endif

#ifdef HR_EN
    HighResWaveform();
#endif

    while(1)
    {
	volatile bool eventCount = EHRPWMETEventCount(SOC_EHRPWM_1_REGS);
	eventCount = eventCount;
    }
}


#ifndef HR_EN  
static void GenPWM1A_Basic(void)
{
  
    /* TimeBase configuration */
    /* Configure the clock frequency */
    EHRPWMTimebaseClkConfig(SOC_EHRPWM_1_REGS, SOC_EHRPWM_1_MODULE_FREQ/CLOCK_DIV_VAL , SOC_EHRPWM_1_MODULE_FREQ);

    /* Configure the period of the output waveform */
    EHRPWMPWMOpFreqSet(SOC_EHRPWM_1_REGS, SOC_EHRPWM_1_MODULE_FREQ/CLOCK_DIV_VAL, 
		    (SOC_EHRPWM_1_MODULE_FREQ/CLOCK_DIV_VAL)/0xFF, EHRPWM_COUNT_UP, EHRPWM_SHADOW_WRITE_DISABLE);

    /* Disable synchronization*/
    EHRPWMTimebaseSyncDisable(SOC_EHRPWM_1_REGS);

    /* Disable syncout*/
    EHRPWMSyncOutModeSet(SOC_EHRPWM_1_REGS, EHRPWM_SYNCOUT_DISABLE);

    /* Configure the emulation behaviour*/
    EHRPWMTBEmulationModeSet(SOC_EHRPWM_1_REGS, EHRPWM_STOP_AFTER_NEXT_TB_INCREMENT);

    /* Configure Counter compare cub-module */
    /* Load Compare A value */
    EHRPWMLoadCMPA(SOC_EHRPWM_1_REGS, 63, EHRPWM_SHADOW_WRITE_DISABLE,
		   EHRPWM_COMPA_NO_LOAD, EHRPWM_CMPCTL_OVERWR_SH_FL);

    /* Load Compare B value */
    EHRPWMLoadCMPB(SOC_EHRPWM_1_REGS, 191, EHRPWM_SHADOW_WRITE_DISABLE,
		   EHRPWM_COMPB_NO_LOAD, EHRPWM_CMPCTL_OVERWR_SH_FL);

    /* Configure Action qualifier */
    /* Toggle when CTR = CMPA OR CMPB */
    EHRPWMConfigureAQActionOnA(SOC_EHRPWM_1_REGS, EHRPWM_AQCTLA_ZRO_DONOTHING, EHRPWM_AQCTLA_PRD_DONOTHING,
		EHRPWM_AQCTLA_CAU_EPWMXATOGGLE,  EHRPWM_AQCTLA_CAD_DONOTHING,  EHRPWM_AQCTLA_CBU_EPWMXATOGGLE,
		EHRPWM_AQCTLA_CBD_DONOTHING, EHRPWM_AQSFRC_ACTSFA_DONOTHING);

    /* Bypass dead band sub-module */
    EHRPWMDBOutput(SOC_EHRPWM_1_REGS, EHRPWM_DBCTL_OUT_MODE_BYPASS);

    /* Disable Chopper sub-module */
    EHRPWMChopperDisable(SOC_EHRPWM_1_REGS);

    /* Disable trip events */
    EHRPWMTZTripEventDisable(SOC_EHRPWM_1_REGS, EHRPWM_TZ_ONESHOT);
    EHRPWMTZTripEventDisable(SOC_EHRPWM_1_REGS, EHRPWM_TZ_CYCLEBYCYCLE);

    /* Event trigger */
    /* Generate interrupt every 3rd occurance of the event */
    EHRPWMETIntPrescale(SOC_EHRPWM_1_REGS, EHRPWM_ETPS_INTPRD_THIRDEVENT);
    /* Generate event when CTR = CMPB */
    EHRPWMETIntSourceSelect(SOC_EHRPWM_1_REGS, EHRPWM_ETSEL_INTSEL_TBCTREQUCMPBINC);
    /* Enable interrupt */
    EHRPWMETIntEnable(SOC_EHRPWM_1_REGS);

    /* Disable High resolution capability */
    EHRPWMHRDisable(SOC_EHRPWM_1_REGS);

}
#endif /* BASIC_WF */


#ifdef SYNC_EN

static void SyncWaveform(void)
{
    /* Reload CTR = 250 and count up after sync */
    EHRPWMTimebaseSyncEnable(SOC_EHRPWM_1_REGS, 250 , EHRPWM_COUNT_UP_AFTER_SYNC);
}
#endif /* SYNC_EN */


#ifdef DB_GEN
static void GenDeadBandWavefrom(void)
{
    /* A is the input for RED & FED */
    EHRPWMDBSourceSelect(SOC_EHRPWM_1_REGS, EHRPWM_DBCTL_IN_MODE_AREDAFED);
    /* Active High polarity */
    EHRPWMDBPolaritySelect(SOC_EHRPWM_1_REGS, EHRPWM_DBCTL_POLSEL_ACTIVEHIGH);
    /* Raising edge delay for A & B */
    EHRPWMDBOutput(SOC_EHRPWM_1_REGS, EHRPWM_DBCTL_OUT_MODE_AREDBFED);
    /* RED */
    EHRPWMDBConfigureRED(SOC_EHRPWM_1_REGS, 0x40);

}
#endif /* DB_GEN */

#ifdef CHP_EN
static void GenChopperWaveform(void)
{
    /* configure to 50% duty cycle */
    EHRPWMConfigureChopperDuty(SOC_EHRPWM_1_REGS, EHRPWM_CHP_DUTY_50_PER);
    /* chopper freq DIV by 4 */
    EHRPWMConfigureChopperFreq(SOC_EHRPWM_1_REGS, EHRPWM_PCCTL_CHPFREQ_DIVBY4);
    /* OSPW- div by 0xF */
    EHRPWMConfigureChopperOSPW(SOC_EHRPWM_1_REGS, 0xF);
    /* Enable Chopper */
    EHRPWMChopperEnable(SOC_EHRPWM_1_REGS);
}
#endif /* CHP_EN */


#ifdef TRIP_EN
static void Delay(void)
{
   volatile unsigned int i_delay = 0;
   for(i_delay = 0; i_delay < 0x0000000F; i_delay++);
}

static void TripWaveform(void)
{

    unsigned int i_toggle = 0;

    /* OSHT Trip Event Enable */
    EHRPWMTZTripEventEnable(SOC_EHRPWM_1_REGS, EHRPWM_TZ_ONESHOT);
    /* Force op A to HIGH on trip */
    EHRPWMTZForceAOnTrip(SOC_EHRPWM_1_REGS, EHRPWM_TZCTL_TZA_FORCEHIGH);
    /* Enable OSHT interrupt */
    EHRPWMTZIntEnable(SOC_EHRPWM_1_REGS, EHRPWM_TZ_ONESHOT);
	

    while(1)
    {
	if(i_toggle)
	{
		EHRPWMTZForceAOnTrip(SOC_EHRPWM_1_REGS, EHRPWM_TZCTL_TZA_FORCEHIGH);
		i_toggle = 0;
	}
	else
	{
		EHRPWMTZForceAOnTrip(SOC_EHRPWM_1_REGS, EHRPWM_TZCTL_TZA_FORCELOW);
		i_toggle = 1;
	}
	
	Delay();

	EHRPWMTZSWFrcEvent(SOC_EHRPWM_1_REGS, EHRPWM_TZ_ONESHOT);
    }
}
#endif /* TRIP_EN */


#ifdef HR_EN
static void HighResWaveform(void)
{
    /* TimeBase configuration */
    /* Configure the clock frequency - 75 Mhz */
    EHRPWMTimebaseClkConfig(SOC_EHRPWM_1_REGS, SOC_EHRPWM_1_MODULE_FREQ/2 , SOC_EHRPWM_1_MODULE_FREQ);

    /* Configure the period of the output waveform */
    EHRPWMPWMOpFreqSet(SOC_EHRPWM_1_REGS, SOC_EHRPWM_1_MODULE_FREQ/2, 
		    (SOC_EHRPWM_1_MODULE_FREQ/2)/5, EHRPWM_COUNT_UP, EHRPWM_SHADOW_WRITE_DISABLE);

    /* Disable synchronization */
    EHRPWMTimebaseSyncDisable(SOC_EHRPWM_1_REGS);

    /* Disable syncout*/
    EHRPWMSyncOutModeSet(SOC_EHRPWM_1_REGS, EHRPWM_SYNCOUT_MASK);

    /* Load Compare A value */
    EHRPWMLoadCMPA(SOC_EHRPWM_1_REGS, 4, EHRPWM_SHADOW_WRITE_DISABLE,
		   EHRPWM_CMPCTL_LOADAMODE_TBCTRZERO, EHRPWM_CMPCTL_OVERWR_SH_FL);

    /* Load Compare B value*/
    EHRPWMLoadCMPB(SOC_EHRPWM_1_REGS, 0, EHRPWM_SHADOW_WRITE_DISABLE,
		   EHRPWM_CMPCTL_LOADAMODE_TBCTRZERO, EHRPWM_CMPCTL_OVERWR_SH_FL);

    /* Configure Action Qualifier */
    EHRPWMConfigureAQActionOnA(SOC_EHRPWM_1_REGS, EHRPWM_AQCTLA_ZRO_DONOTHING, EHRPWM_AQCTLA_PRD_EPWMXALOW,
		EHRPWM_AQCTLA_CAU_EPWMXAHIGH,  EHRPWM_AQCTLA_CAD_DONOTHING,  EHRPWM_AQCTLA_CBU_DONOTHING,
		EHRPWM_AQCTLA_CBD_DONOTHING, EHRPWM_AQSFRC_ACTSFA_DONOTHING);

    /* Disable deab band generation */
    EHRPWMDBOutput(SOC_EHRPWM_1_REGS, EHRPWM_DBCTL_OUT_MODE_BYPASS);

    /* disable Chopper sub-module */
    EHRPWMChopperDisable(SOC_EHRPWM_1_REGS);

    /* Disable trip zone sub-module */
    EHRPWMTZTripEventDisable(SOC_EHRPWM_1_REGS, EHRPWM_TZ_ONESHOT);
    EHRPWMTZTripEventDisable(SOC_EHRPWM_1_REGS, EHRPWM_TZ_CYCLEBYCYCLE);

    /* Disable Event trigger */
    EHRPWMETIntDisable(SOC_EHRPWM_1_REGS);

    /* High resolution */
    /* Add 50 MEP when counter == 0 */
    EHRPWMLoadCMPAHR(SOC_EHRPWM_1_REGS, 50, EHRPWM_HR_HRLOAD_CTR_ZERO);
    /* Add MEP to the raising edge of the PWM signal */
    EHRPWMConfigHR(SOC_EHRPWM_1_REGS, EHRPWM_HR_CTLMODE_CMPAHR, EHRPWM_HR_EDGEMODE_RAISING);

    /* EHRPWMHRDisable(SOC_EHRPWM_1_REGS); */

}
#endif /* HR_EN */




/*
** configures arm interrupt controller to generate PWM interrupts
*/
static void SetupIntc(void)
{
    /* Initialize the ARM Interrupt Controller.*/
    IntAINTCInit();

    IntSystemStatusClear(SYS_INT_EHRPWM1);
    EHRPWMETIntClear(SOC_EHRPWM_1_REGS);
    
    /************************PWM1****************************************/
    IntRegister(SYS_INT_EHRPWM1, PWMEventIsr);
    IntChannelSet(SYS_INT_EHRPWM1, 2);
    IntSystemEnable(SYS_INT_EHRPWM1);
    /********************************************************************/
    IntRegister(SYS_INT_EHRPWM1TZ, PWMTZIsr);
    IntChannelSet(SYS_INT_EHRPWM1TZ, 2);
    IntSystemEnable(SYS_INT_EHRPWM1TZ);
    /********************************************************************/

    /* Enable IRQ in CPSR.*/
    IntMasterIRQEnable();

    /* Enable the interrupts in GER of AINTC.*/
    IntGlobalEnable();

    /* Enable the interrupts in HIER of AINTC.*/
    IntIRQEnable();
}

static void PWMEventIsr(void)
{
    IntSystemStatusClear(SYS_INT_EHRPWM1);

    EHRPWMETIntClear(SOC_EHRPWM_1_REGS);

#ifdef SYNC_EN
    EHRPWMTriggerSWSync(SOC_EHRPWM_1_REGS);
#endif

}

static void PWMTZIsr(void)
{
    IntSystemStatusClear(SYS_INT_EHRPWM1TZ);

    EHRPWMTZFlagClear(SOC_EHRPWM_1_REGS, EHRPWM_TZ_CYCLEBYCYCLE_CLEAR);
}



















