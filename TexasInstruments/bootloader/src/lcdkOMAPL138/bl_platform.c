/**
 * \file  bl_platform.c
 *
 * \brief lcdkOMAPL138 Boot loader platform-specific initialization.
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

#include "hw_types.h"
#include "hw_syscfg0_OMAPL138.h"
#include "hw_pllc_OMAPL138.h"
#include "hw_ddr2_mddr.h"
#include "hw_syscfg1_OMAPL138.h"

/* Device/Platform lib headers */
#include "soc_OMAPL138.h"
#include "lcdkOMAPL138.h"
#include "psc.h"
#include "uartStdio.h"

#if defined(SPI)

#elif defined(MMCSD)

#elif defined(NAND)
    #include "hw_emifa2.h"
    #include "emifa.h"
    #include "nandlib.h"
    #include "nand_emifa2.h"
#endif

#include "bl.h"

/* This module's header */
#include "bl_platform.h"

/******************************************************************************
**                     Internal Macro Definitions
*******************************************************************************/
#define CLK_PLL0_SYSCLK3                  (0xFFFFFFF8)
#define DDR2_MDDR_DRPYC1R_READ_LAT        (0x4)
#define INTVECMAX                         (9)

/******************************************************************************
**                     Local function Declarations
*******************************************************************************/

static void PLL0Init(unsigned char clk_src, unsigned char pllm,
        unsigned char prediv, unsigned char postdiv, unsigned char div1,
        unsigned char div3, unsigned char div7);
static void PLL1Init(unsigned char pllm, unsigned char postdiv,
        unsigned char div1, unsigned char div2, unsigned char div3);
static void DDRInit(void);
static void Delay(volatile unsigned int count);
static void USBSetup(void);


/******************************************************************************
**                     Global variable Definitions
*******************************************************************************/

char *deviceType = "OMAPL138";


/******************************************************************************
**                     Local variable Definitions
*******************************************************************************/
#if defined(NAND)
  static EMIFANANDTimingInfo_t nandTimingInfo;
#endif

/******************************************************************************
**                     Global Function Definitions
*******************************************************************************/

/*
 * \brief This function Initializes Pll, DDR and Uart
 *
 * \param  none
 *
 * \return none
*/
void BL_PLATFORM_Config(void)
{
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_SUSPSRC) &= SYSCFG_SUSPSRC_I2C0SRC  | 
                                                  SYSCFG_SUSPSRC_UART2SRC |
                                                  SYSCFG_SUSPSRC_SPI1SRC  | 
                                                  SYSCFG_SUSPSRC_TIMER64P_0SRC;
                                                    
    /* Set the PLL0 to generate 300MHz for ARM */
    PLL0Init(PLL_CLK_SRC, PLL0_MUL, PLL0_PREDIV, PLL0_POSTDIV,
             PLL0_DIV1,PLL0_DIV3, PLL0_DIV7);

    /* DDR Initialization */
    PLL1Init(PLL1_MUL, PLL1_POSTDIV, PLL1_DIV1,PLL1_DIV2, PLL1_DIV3);
    DDRInit();

    /* USB Initialization */
    USBSetup();
}


/*
 * \brief This function does any post boot setup/init
 *
 * \param  none
 *
 * \return none
*/
void BL_PLATFORM_ConfigPostBoot( void )
{
    /* run DSP if we found a DSP entrypoint */
    if (DspEntryPoint)
    {
        UARTPuts("Running DSP Application...\r\n", -1);
        
        /* check entrypoint alignment */
        if (DspEntryPoint & 0x3ffu)
        {
            UARTPuts("Error: DSP entrypoint (", -1);
            UARTPutHexNum(DspEntryPoint);
            UARTPuts(") is not aligned to 1024 bytes. DSP startup aborted.\r\n", -1);
        }
        else
        {
            /* write DSP entrypoint */
            HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_HOST1CFG) = DspEntryPoint;

            /* power on DSP */
            PSCModuleControl (SOC_PSC_0_REGS, HW_PSC_DSP, PSC_POWERDOMAIN_PD_DSP,
                              PSC_MDCTL_NEXT_ENABLE);

            /* release DSP from reset */
            HWREG(SOC_PSC_0_REGS + PSC_MDCTL(15)) |= PSC_MDCTL_LRST;
        }
    }
}


#if defined(SPI)
/*
 * \brief This function is used to initialize and configure SPI Module.
 *
 * \param  none.
 *
 * \return none
*/
void BL_PLATFORM_SPISetup(void)
{
    /* Enable PSC for SPI */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_SCR0_SS, 0, PSC_MDCTL_NEXT_ENABLE);

    /* Setup SPI PINMUX */ 
    SPIPinMuxSetup(1);
    SPI1CSPinMuxSetup(0);
}
#endif

#if defined(NAND)
/*
 * \brief This function is used to initialize and configure NAND.
 *
 * \param  none.
 *
 * \return none
*/
void BL_PLATFORM_NANDSetup(void)
{
    /* Pin mux and clock setting */
    EMIFAClkConfig();
    NANDPinMuxSetup();
}

static void NANDTimingInfoInit(void *TimingInfo)
{
    int moduleClkInMHz = NAND_MODULE_CLK_IN_MHZ;
    EMIFANANDTimingInfo_t *nandTimingInfo;
    
    nandTimingInfo = (EMIFANANDTimingInfo_t * )TimingInfo;
    
    /* Set the asynchronous wait timing                             */
    nandTimingInfo->writeSetup  = ( ((moduleClkInMHz * NAND_WRITE_SETUP_TIME_IN_NS)/1000u) &
                                     EMIFA_WRITE_SETUP_RESETVAL );
    nandTimingInfo->writeStrobe = ( ((moduleClkInMHz * NAND_WRITE_STROBE_TIME_IN_NS)/1000u) &
                                    EMIFA_WRITE_STROBE_RESETVAL );
    nandTimingInfo->writeHold   = ( ((moduleClkInMHz * NAND_WRITE_HOLD_TIME_IN_NS)/1000u) &
                                    EMIFA_WRITE_HOLD_RESETVAL );
    
    nandTimingInfo->readSetup   = ( ((moduleClkInMHz * NAND_READ_SETUP_TIME_IN_NS)/1000u) &
                                    EMIFA_READ_SETUP_RESETVAL );
    nandTimingInfo->readStrobe  = ( ((moduleClkInMHz * NAND_READ_STROBE_TIME_IN_NS)/1000u) &
                                    EMIFA_READ_STROBE_RESETVAL );
    nandTimingInfo->readHold    = ( ((moduleClkInMHz * NAND_READ_HOLD_TIME_IN_NS)/1000u) &
                                    EMIFA_READ_HOLD_RESETVAL );
    
    nandTimingInfo->turnAround  = ( ((moduleClkInMHz * NAND_TURN_ARND_TIME_IN_NS)/1000u) &
                                    EMIFA_TA_RESETVAL );
}

void BL_PLATFORM_NANDInfoInit(NandInfo_t *nandInfo)
{
    NandCtrlInfo_t *hNandCtrlInfo = nandInfo->hNandCtrlInfo;
    NandDmaInfo_t  *hNandDmaInfo  = nandInfo->hNandDmaInfo;
    NandEccInfo_t  *hNandEccInfo  = nandInfo->hNandEccInfo;

    /* Init the NAND Device Info */
    nandInfo->opMode                        = NAND_DATA_XFER_MODE;
    nandInfo->eccType                       = NAND_ECC_ALGO_RS_4BIT;
    
    nandInfo->chipSelectCnt                 = 1;
    nandInfo->dieCnt                        = 1;
    nandInfo->chipSelects[0]                = NAND_CHIP_SELECT;
    nandInfo->busWidth                      = NAND_BUSWIDTH;
    nandInfo->pageSize                      = NAND_PAGE_SIZE_IN_BYTES;
    nandInfo->blkSize                       = NAND_BLOCK_SIZE_IN_BYTES;
    nandInfo->manId                         = NAND_MANUFATURER_MICRON_ID;
    nandInfo->devId                         = NAND_DEVICE_ID;

    nandInfo->dataRegAddr                   = (SOC_EMIFA_CS3_ADDR + 0x00);
    nandInfo->addrRegAddr                   = (SOC_EMIFA_CS3_ADDR + 0x08);
    nandInfo->cmdRegAddr                    = (SOC_EMIFA_CS3_ADDR + 0x10);


    /* Init the NAND Controller Info struct */
    hNandCtrlInfo->CtrlInit                 = EMIFANANDInit;
    hNandCtrlInfo->WaitPinStatusGet         = EMIFANANDWaitPinStatusGet;
    hNandCtrlInfo->currChipSelect           = NAND_CHIP_SELECT;
    hNandCtrlInfo->baseAddr                 = SOC_EMIFA_0_REGS;
    hNandCtrlInfo->eccSupported             = ( NAND_ECC_ALGO_HAMMING_1BIT |
                                                NAND_ECC_ALGO_RS_4BIT );
    hNandCtrlInfo->waitPin                  = EMIFA_EMA_WAIT_PIN0;
    hNandCtrlInfo->waitPinPol               = EMIFA_EMA_WAIT_PIN_POLARITY_HIGH;
    hNandCtrlInfo->wpPinPol                 = 0;
    hNandCtrlInfo->chipSelectBaseAddr[0]    = SOC_EMIFA_CS3_ADDR;
    hNandCtrlInfo->chipSelectRegionSize[0]  = EMIFA_CHIP_SELECT_3_SIZE;
    hNandCtrlInfo->hNandTimingInfo          = &nandTimingInfo;
    NANDTimingInfoInit(hNandCtrlInfo->hNandTimingInfo);
                                                
                                                
    /* Init the NAND Ecc Info */
    hNandEccInfo->baseAddr                  = 0;    
    hNandEccInfo->ECCInit                   = EMIFANANDECCInit;
    hNandEccInfo->ECCEnable                 = EMIFANANDECCEnable;
    hNandEccInfo->ECCDisable                = EMIFANANDECCDisable;
    hNandEccInfo->ECCWriteSet               = EMIFANANDECCWriteSet;
    hNandEccInfo->ECCReadSet                = EMIFANANDECCReadSet;
    hNandEccInfo->ECCCalculate              = EMIFANANDECCCalculate;
    hNandEccInfo->ECCCheckAndCorrect        = EMIFANANDECCCheckAndCorrect;
    
    /* Init the NAND DMA info */
    hNandDmaInfo->DMAXfer                   = NULL;    
    hNandDmaInfo->DMAInit                   = NULL;
    hNandDmaInfo->DMAXferSetup              = NULL;
    hNandDmaInfo->DMAXferStatusGet          = NULL;
}

#endif

/******************************************************************************
**                     Local Function Definitions
*******************************************************************************/

/*
 * \brief This function is used to initialize and configure USB Module.
 *
 * \param  none.
 *
 * \return none
*/
static void USBSetup(void)
{
    /* Enable PSC for USB2 */
    PSCModuleControl(SOC_PSC_1_REGS,1, 0, PSC_MDCTL_NEXT_ENABLE);
    
    /* USB PHY ON*/
    HWREG(SOC_USB_0_PHY_REGS) = 0x09F2;
}

/*
 * \brief Delay function.
 *
 * \param  count - Halts execution depend upon the value of the variable.
 *
 * \return none
*/
static void Delay(volatile unsigned int count)
{
    while(count--);
}

/*
 * \brief This function Configures the PLL0 registers.
 *      PLL Register are set to achieve the desired frequencies.
 *
 * \param  clk_src
 * \param  pllm             This value is assigned to the PLLMultipler register.
 * \param  prediv           This value is assigned to the PLLMultipler register.
 * \param  postdiv          This value is assigned to the PLL_Postdiv register.
 * \param  div1             This value is assigned to the PLL_DIV1 register.
 * \param  div3             This value is assigned to the PLL_DIV3 register.
 * \param  div7             This value is assigned to the PLL_DIV7 register.
 *
 * \return Int              Returns success or failure
*/
static void PLL0Init(unsigned char clk_src, unsigned char pllm,
           unsigned char prediv, unsigned char postdiv, unsigned char div1,
           unsigned char div3, unsigned char div7)
{
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP0) &=
                                               ~SYSCFG_CFGCHIP0_PLL_MASTER_LOCK;
    /* PLLENSRC must be cleared before PLLEN bit have any effect */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLENSRC;

    /* PLLCTL.EXTCLKSRC bit 9 should be left at 0  */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_EXTCLKSRC;

    /*PLLEN = 0 put pll in bypass mode  */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLEN;

    /*wait for 2 counts to switch pll to the by pass mode */
    Delay(2);

    /*Select the Clock Mode bit 8 as External Clock or On Chip Oscilator  */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_CLKMODE;
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) |= (clk_src << 8);
    /* Clear the PLLRST to reset the PLL */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLRST;

    /*Disable PLL out */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) |= PLLC_PLLCTL_PLLDIS;

    /* PLL initialization sequece, power up the PLL */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLPWRDN;

    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLDIS;
    
    /* Wait for 300 counts */ 
    Delay(300);
    
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLM) = pllm;

    /* Program the required multiplier value   */
    HWREG(SOC_PLLC_0_REGS + PLLC_PREDIV) = PLLC_PREDIV_PREDEN | prediv;
    HWREG(SOC_PLLC_0_REGS + PLLC_POSTDIV) = PLLC_POSTDIV_POSTDEN | postdiv;
    /* Check for the GOSTAT bit in PLLSTAT to clear to 0 to indicate that
                no GO operation is currently in progress */
    while (HWREG(SOC_PLLC_0_REGS + PLLC_PLLSTAT) & PLLC_PLLSTAT_GOSTAT  );
    /* divider values are assigned */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLDIV1) = PLLC_PLLDIV1_D1EN | div1;
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLDIV2)
        = PLLC_PLLDIV2_D2EN | (((div1 + 1) * 2) - 1);
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLDIV4)
        = PLLC_PLLDIV4_D4EN | (((div1 + 1) * 4)- 1);
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLDIV6)
        = PLLC_PLLDIV6_D6EN | div1;
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLDIV3) = PLLC_PLLDIV3_D3EN | div3;
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLDIV7) = PLLC_PLLDIV7_D7EN | div7;

    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCMD) |= PLLC_PLLCMD_GOSET;
    /*Wait for the Gostat bit in PLLSTAT to clear to 0
        ( completion of phase alignment) */
    while (HWREG(SOC_PLLC_0_REGS + PLLC_PLLSTAT) & PLLC_PLLSTAT_GOSTAT);

   /* Wait for 40 counts */ 
   Delay(40);
    /* set the PLLRST bit in PLLCTL to 1,bring the PLL out of reset */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) |= PLLC_PLLCTL_PLLRST;

    /* Wait for 300 counts*/
    Delay (300);

    /*removing pll from bypass mode */
    HWREG(SOC_PLLC_0_REGS + PLLC_PLLCTL) |= PLLC_PLLCTL_PLLEN;

    /* set PLL lock bit */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP0) |=
                                     (0x01 << SYSCFG_CFGCHIP0_PLL_MASTER_LOCK_SHIFT )
                                      & SYSCFG_CFGCHIP0_PLL_MASTER_LOCK ;

    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP3) &= CLK_PLL0_SYSCLK3;
}

/*
 * \brief This function Configures the PLL1 registers.
    PLL Register are set to achieve the desired frequencies.
 *
 * \param  clk_src
 *          pllm             This value is assigned to the PLL1Multipler register.
 *          postdiv          This value is assigned to the PLL1_Postdiv register.
 *          div1             This value is assigned to the PLL1_Div1 register.
 *          div2             This value is assigned to the PLL1_Div2 register.
 *          div3             This value is assigned to the PLL1_Div3 register.
 *
 * \return Int          Returns Success or Failure,depending on the execution
*/
static void PLL1Init(unsigned char pllm, unsigned char postdiv,
        unsigned char div1, unsigned char div2, unsigned char div3)
{
    /* Clear PLL lock bit */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP3) &=
            ~SYSCFG_CFGCHIP3_PLL1_MASTER_LOCK ;

    /* PLLENSRC must be cleared before PLLEN has any effect*/
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLENSRC;

    /* PLLCTL.EXTCLKSRC bit 9 should be left at 0  */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_EXTCLKSRC;

    /* Set PLLEN=0 to put in bypass mode */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLEN;

    /* wait for 4 cycles to allow PLLEN mux
            switches properly to bypass clock */
    Delay(4);

    /* Clear PLLRST bit to reset the PLL */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLRST;

    /* Disable the PLL output */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) &= PLLC_PLLCTL_PLLDIS;

    /* PLL initialization sequence */
    /* Power up the PLL by setting PWRDN bit set to 0 */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLPWRDN ;

    /* Enable the PLL output */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) &= ~PLLC_PLLCTL_PLLDIS;

    Delay(300);

    /* Multiplier value is set */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLM) = pllm;

    HWREG(SOC_PLLC_1_REGS + PLLC_POSTDIV) = PLLC_POSTDIV_POSTDEN | postdiv;

    while ( HWREG(SOC_PLLC_1_REGS + PLLC_PLLSTAT) & PLLC_PLLCMD_GOSET  );
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLDIV1) = PLLC_PLLDIV1_D1EN | div1;
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLDIV2) = PLLC_PLLDIV2_D2EN | div2;
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLDIV3) = PLLC_PLLDIV3_D3EN | div3;


    /*Set the GOSET bit in PLLCMD to 1 to initiate a new divider transition*/
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCMD) |= PLLC_PLLCMD_GOSET;

    while (HWREG(SOC_PLLC_1_REGS + PLLC_PLLSTAT) & PLLC_PLLSTAT_GOSTAT);
    /*Wait for the Gostat bit in PLLSTAT to clear to 0
        ( complition of phase alignment ) */
    Delay(40);

    /* set the PLLRST bit in PLLCTL to 1,bring the PLL out of reset  */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) |= PLLC_PLLCTL_PLLRST;
    Delay(300);
    /* Removing PLL from bypass mode */
    HWREG(SOC_PLLC_1_REGS + PLLC_PLLCTL) |= PLLC_PLLCTL_PLLEN;

    /* set PLL lock bit */
    HWREG(SOC_SYSCFG_0_REGS + SYSCFG0_CFGCHIP3) |=
    (0x1 << SYSCFG_CFGCHIP3_PLL1_MASTER_LOCK_SHIFT)
        & SYSCFG_CFGCHIP3_PLL1_MASTER_LOCK ;
}

/*
 * \brief This function is used to initialize and configure DDR.
 *
 * \param  none.
 *
 * \return none
*/
static void DDRInit(void)
{
    const float freq = 150;
    unsigned int tmp_SDCR;
 
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_DDR2_MDDR,
                              0, PSC_MDCTL_NEXT_ENABLE);
    if (HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) &
                                                SYSCFG1_VTPIO_CTL_POWERDN)
    {
    /* VTP Calibration Begins */
         /* Set IOPWRDN bit, powerdown enable mode */
        HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) |=
                                          SYSCFG1_VTPIO_CTL_IOPWRDN;
         /* Clear POWERDN bit (enable VTP) */
        HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) |=
                                          SYSCFG1_VTPIO_CTL_POWERDN;
         /* Clear CLRZ bit */
        HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) &=
                                          ~SYSCFG1_VTPIO_CTL_CLKRZ;
        /* CLRZ bit should be low at least for 2ns */
        Delay(4);
        /* Set CLRZ bit */
        HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) |=
                                           SYSCFG1_VTPIO_CTL_CLKRZ;
        /* Poll ready bit in VTPIO_CTL Untill it is high */
        while (!(( HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) &
                                                     VTPIO_CTL_HIGH ) >> 15));
        /* Set Lock bit for static mode */
        HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) |= SYSCFG1_VTPIO_CTL_LOCK;
        /* set PWRSAVE bit to save Power */
        HWREG(SOC_SYSCFG_1_REGS + SYSCFG1_VTPIO_CTL) |= SYSCFG1_VTPIO_CTL_PWRSAVE;
    /* VTP Calibration Ends */
    }

    /* Set BOOTUNLOCK */
    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDCR) |= DDR2_MDDR_SDCR_BOOTUNLOCK;
    
    // Settings depending on DDR2 
    tmp_SDCR =     (0x0               << 25)  |  // MSDRAMEN
                   (0x1               << 20);    // DDR2EN


    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDCR) = 
                   tmp_SDCR                    |  // Settings that change depending on DDR2 or MDDR
                   (HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDCR) & 0xF0000000) |  // Reserved
                   (0x0               << 27)   |  // DDR2TERM1
                   (0x0               << 26)   |  // IBANK_POS
                   (0x0               << 24)   |  // DDRDRIVE1
                   (0x0               << 23)   |  // BOOTUNLOCK
                   (0x0               << 22)   |  // DDR2DDQS
                   (0x0               << 21)   |  // DDR2TERM0
                   (0x0               << 19)   |  // DDRDLL_DIS
                   (0x0               << 18)   |  // DDRDRIVE0
                   (0x1               << 17)   |  // DDREN
                   (0x1               << 16)   |  // SDRAMEN
                   (0x1               << 15)   |  // TIMUNLOCK
                   (0x1               << 14)   |  // NM
                   (0x0               << 12)   |  // Reserved
                   (0x4               << 9)    |  // CL
                   (0x0               << 7)    |  // Reserved
                   (0x3               << 4)    |  // IBANK
                   (0x0               << 3)    |  // Reserved
                   (0x2               << 0);      // PAGESIZE

    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDCR2)   = 0x00000000; // IBANK_POS set to 0 so this register does not apply

    
    /* Let float -> integer truncate handle minus 1; Safer to round up for timings */
    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDTIMR1) = 
                        (((unsigned int) (127.5 * freq / 1000))  << 25)         |  // tRFC
                        (((unsigned int) (13.13 * freq / 1000))  << 22)         |  // tRP
                        (((unsigned int) (13.13 * freq / 1000))  << 19)         |  // tRCD
                        (((unsigned int) ( 15.0 * freq / 1000))  << 16)         |  // tWR
                        (((unsigned int) ( 45.0 * freq / 1000))  << 11)         |  // tRAS
                        (((unsigned int) (58.13 * freq / 1000))  << 6)          |  // tRC
                        (((unsigned int) (  7.5 * freq / 1000))  << 3)          |  // tRRD
                        (HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDTIMR1) & 0x4) |  // Reserved
                        ((2 - 1)                                 << 0);     // tWTR

    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDTIMR2) = 
                        (HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDTIMR2) & 0x80000000) |  // Reserved
                        (((unsigned int) ((70000 / 7800) - 1))   << 27)   |  // tRASMAX (original 3400)
                        ((0x3-1)                                 << 25)   |  // tXP (Should be 6-1 per MT46H64M16LFBF-6 datasheet, but field only goes up to 0b11)
                        (0x0                                     << 23)   |  // tODT (Not supported)
                        (((unsigned int) (137.5 * freq / 1000))  << 16)   |  // tXSNR (tXSR for mDDR)
                        ((200-1)  								 << 8)    |  // tXSRD (tXSR for mDDR)
                        ((2 - 1)                                 << 5)    |  // tRTP
                        ((3 - 1)                                 << 0);      // tCKE
  
    /* CLEAR TIMINGUNLOCK */
    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDCR) &= ~DDR2_MDDR_SDCR_BOOTUNLOCK;    
    
    /* SET the refreshing rate */
    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDRCR) = DDR2_SDRCR;    

    // Let float -> integer truncate handle RR round-down; Safer to round down for refresh rate
    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDRCR)   = 
                      (0x1                                  << 31)  |  // LPMODEN (Required for LPSC SyncReset/Enable)
                      (0x1                                  << 30)  |  // MCLKSTOPEN (Required for LPSC SyncReset/Enable)
                      (0x0                                  << 24)  |  // Reserved
                      (0x0                                  << 23)  |  // SR_PD
                      (0x0                                  << 16)  |  // Reserved
                      (((unsigned int) (7.8 * freq))  	    << 0);     // RR  (original 7.8125)

    /* SyncReset the Clock to SDRAM */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_DDR2_MDDR,
                              0,PSC_MDSTAT_STATE_SYNCRST);
    /* Enable clock to SDRAM */
    PSCModuleControl(SOC_PSC_1_REGS, HW_PSC_DDR2_MDDR, 0,PSC_MDCTL_NEXT_ENABLE);

    /* Disable Self refresh rate */
    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_SDRCR ) &= ~DDR2_SDRCR_CLEAR;

    // Set PBBPR to a value lower than default to prevent blocking
    HWREG(SOC_DDR2_0_CTRL_REGS + DDR2_MDDR_PBBPR ) = 0x30;         
}


/******************************************************************************
**                              END OF FILE
*******************************************************************************/
