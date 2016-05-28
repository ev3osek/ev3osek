/**
 * \file    demoSlides.c
 *
 * \brief   This file defines the slide contents for the demo application
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

#include "demoImages.h"
#include "demoSlides.h"
#include <string.h>

/****************************************************************************
**                   INTERNAL MACRO DEFINITIONS
****************************************************************************/

#define SLIDE_LAYOUT_INIT(context)  int x = 45, y = 30; \
                                    tContext slide_context = context

#define SLIDE_PRINT_HEADER(text)    y += 12; \
                                    GrContextForegroundSet(&slide_context, ClrDarkRed); \
                                    GrContextFontSet(&slide_context, &g_sFontCmss22b);  \
                                    GrStringDraw(&slide_context, text, -1, x, y, 0);    \
                                    y += 30

#define SLIDE_NEW_BULLET            GrContextForegroundSet(&slide_context, ClrBlack);  \
                                    GrContextFontSet(&slide_context, &g_sFontCmss18b); \
                                    GrStringDraw(&slide_context, "-", -1, x, y, 0);    \
                                    x += 16

#define SLIDE_END_BULLET            x -= 16

#define SLIDE_PRINT_TEXT(text)      GrContextForegroundSet(&slide_context, ClrBlack);  \
                                    GrContextFontSet(&slide_context, &g_sFontCmss18b); \
                                    GrStringDraw(&slide_context, text, -1, x, y, 0);   \
                                    y += 20

#define SLIDE_DRAW_ICONS            GrImageDraw(&slide_context, iconHome, 0, 0); \
                                    GrImageDraw(&slide_context, iconBack, 0, HEIGHT - 60); \
                                    GrImageDraw(&slide_context, iconNext, WIDTH - 60, HEIGHT - 60);

/****************************************************************************
**                   GLOBAL VARIABLES DEFINITIONS
****************************************************************************/

tDisplay g_sDisplayBanner;
tDisplay g_sDisplayChoice;
tDisplay g_sDisplayEthernet;
tDisplay g_sDisplayGpio;
tDisplay g_sDisplayI2c;
tDisplay g_sDisplayIntro;
tDisplay g_sDisplayMcasp;
tDisplay g_sDisplayMenu;
tDisplay g_sDisplayRtc;
tDisplay g_sDisplaySpi;
tDisplay g_sDisplayTimer;
tDisplay g_sDisplayUart;
tDisplay g_sDisplayUsbMouse;

tContext sContextBanner;
tContext sContextChoice;
tContext sContextEthernet;
tContext sContextGpio;
tContext sContextI2c;
tContext sContextIntro;
tContext sContextMcasp;
tContext sContextMenu;
tContext sContextRtc;
tContext sContextSpi;
tContext sContextTimer;
tContext sContextUart;
tContext sContextUsbMouse;

/****************************************************************************
**                   LOCAL FUNCTION PROTOTYPES
****************************************************************************/

static void draw_choice_slide();
static void draw_ethernet_slide();
static void draw_gpio_slide();
static void draw_i2c_slide();
static void draw_intro_slide();
static void draw_mcasp_slide();
static void draw_menu_slide();
static void draw_rtc_slide();
static void draw_spi_slide();
static void draw_timer_slide();
static void draw_uart_slide();
static void draw_usbmouse_slide();

/****************************************************************************
**                   FUNCTION DEFINITIONS
****************************************************************************/

void InitializeSlides()
{
    /* copy background image into all slide image arrays */
    memcpy((void *)&bannerImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&choiceImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&ethernetImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&gpioImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&i2cImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&introImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&mcaspImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&menuImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&rtcImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&spiImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&timerImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&uartImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    memcpy((void *)&usbMouseImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    
    /* initialize drawing context on all slides */
    GrOffScreen16BPPInit(&g_sDisplayBanner, (unsigned char *)bannerImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayChoice, (unsigned char *)choiceImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayEthernet, (unsigned char *)ethernetImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayGpio, (unsigned char *)gpioImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayI2c, (unsigned char *)i2cImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayIntro, (unsigned char *)introImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayMcasp, (unsigned char *)mcaspImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayMenu, (unsigned char *)menuImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayRtc, (unsigned char *)rtcImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplaySpi, (unsigned char *)spiImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayTimer, (unsigned char *)timerImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayUart, (unsigned char *)uartImage, WIDTH, HEIGHT);
    GrOffScreen16BPPInit(&g_sDisplayUsbMouse, (unsigned char *)usbMouseImage, WIDTH, HEIGHT);
    
    GrContextInit(&sContextBanner, &g_sDisplayBanner);
    GrContextInit(&sContextChoice, &g_sDisplayChoice);
    GrContextInit(&sContextEthernet, &g_sDisplayEthernet);
    GrContextInit(&sContextGpio, &g_sDisplayGpio);
    GrContextInit(&sContextI2c, &g_sDisplayI2c);
    GrContextInit(&sContextIntro, &g_sDisplayIntro);
    GrContextInit(&sContextMcasp, &g_sDisplayMcasp);
    GrContextInit(&sContextMenu, &g_sDisplayMenu);
    GrContextInit(&sContextRtc, &g_sDisplayRtc);
    GrContextInit(&sContextSpi, &g_sDisplaySpi);
    GrContextInit(&sContextTimer, &g_sDisplayTimer);
    GrContextInit(&sContextUart, &g_sDisplayUart);
    GrContextInit(&sContextUsbMouse, &g_sDisplayUsbMouse);
    
    /* Draw graphics and text to all slides */
    draw_choice_slide();
    draw_ethernet_slide();
    draw_gpio_slide();
    draw_i2c_slide();
    draw_intro_slide();
    draw_mcasp_slide();
    draw_menu_slide();
    draw_rtc_slide();
    draw_spi_slide();
    draw_timer_slide();
    draw_uart_slide();
    draw_usbmouse_slide();
}

void ResetChoiceSlide()
{
    /* reset the choice slide to its original contents */
    memcpy((void *)&choiceImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    draw_choice_slide();
}

void ResetUsbMouseSlide()
{
    /* reset the USB mouse slide to its original contents */
    memcpy((void *)&usbMouseImage[HW_VAL], (const void *)bgImage,  WIDTH * HEIGHT * 2 + PALETTE);
    draw_usbmouse_slide();
}

static void draw_choice_slide()
{
    SLIDE_LAYOUT_INIT(sContextChoice);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("Network Web Server");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Lightweight networking with open source LWIP stack");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Support for TCP/IP, UDP, DHCP and more");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Type the IP address below into your PC web browser");
    SLIDE_PRINT_TEXT("to view a web page hosted by the embedded target");
    SLIDE_END_BULLET;
}

static void draw_ethernet_slide()
{
    SLIDE_LAYOUT_INIT(sContextEthernet);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("Ethernet Communication");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Industry standard performance (IEEE 802.3)");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Supports 10BaseT and 100BaseTX in half- and full-");
    SLIDE_PRINT_TEXT("duplex modes");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("MDIO implements standard serial management and");
    SLIDE_PRINT_TEXT("can control up to 32 Ethernet PHYs");
    SLIDE_END_BULLET;
}

static void draw_gpio_slide()
{
    SLIDE_LAYOUT_INIT(sContextGpio);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("GPIO Functionality");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("General purpose pins that can be configured as input");
    SLIDE_PRINT_TEXT("or output");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Wide variety of applications");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Insert and remove an MMC/SD card from slot on");
    SLIDE_PRINT_TEXT("the underside of the EVM");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("A message is transmitted via UART every time the");
    SLIDE_PRINT_TEXT("card status changes");
    SLIDE_END_BULLET;
}

static void draw_i2c_slide()
{
    SLIDE_LAYOUT_INIT(sContextI2c);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("I2C Access");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Simple, synchronous serial I/O port");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Programmable data word width and clock rate");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("I2C is used to toggle the state of two LEDs on the");
    SLIDE_PRINT_TEXT("EVM below the LCD screen");
    SLIDE_END_BULLET;
}

static void draw_intro_slide()
{
    SLIDE_LAYOUT_INIT(sContextIntro);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("Introduction");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Enables no OS development on TI embedded devices");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Provides peripheral driver libraries and board level");
    SLIDE_PRINT_TEXT("example applications");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Connect the Ethernet port to your LAN");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Connect the UART to your PC serial port and use a");
    SLIDE_PRINT_TEXT("terminal (ex. HyperTerminal) to send input values");
    SLIDE_END_BULLET;
}

static void draw_mcasp_slide()
{
    SLIDE_LAYOUT_INIT(sContextMcasp);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("McASP Audio Output");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("McASP is a general purpose serial port that is");
    SLIDE_PRINT_TEXT("designed for multi-channel audio applications");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Supports TDS streams, I2S protocol, and DIT");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Transmit and receive operations can operate");
    SLIDE_PRINT_TEXT("synchronously or independently");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Connect speakers or headphones to LINE OUT jack");
    SLIDE_END_BULLET;
}

static void draw_menu_slide()
{
    /* draw special menu icons instead of standard text and icon layout */
    GrImageDraw(&sContextMenu, (unsigned char *)iconIntro, 47, 41);
    GrImageDraw(&sContextMenu, (unsigned char *)iconChoice, 155, 41);
    GrImageDraw(&sContextMenu, (unsigned char *)iconMcasp, 263, 41);
    GrImageDraw(&sContextMenu, (unsigned char *)iconSpi, 371, 41);
    
    GrImageDraw(&sContextMenu, (unsigned char *)iconUart, 47, 117);
    GrImageDraw(&sContextMenu, (unsigned char *)iconGpio, 155, 117);
    GrImageDraw(&sContextMenu, (unsigned char *)iconTimer, 263, 117);
    GrImageDraw(&sContextMenu, (unsigned char *)iconI2c, 371, 117);
    
    GrImageDraw(&sContextMenu, (unsigned char *)iconUsbMouse, 47, 193);
    GrImageDraw(&sContextMenu, (unsigned char *)iconRtc, 155, 193);
    GrImageDraw(&sContextMenu, (unsigned char *)iconEthernet, 263, 193);
}

static void draw_rtc_slide()
{
    SLIDE_LAYOUT_INIT(sContextRtc);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("Real Time Clock");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Provides time reference to embedded applications");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Set date and time through UART console");
    SLIDE_END_BULLET;
}

static void draw_spi_slide()
{
    SLIDE_LAYOUT_INIT(sContextSpi);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("SPI Access");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("SPI is a high-speed synchronous serial I/O port");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Programmable data word width and clock rate");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Turn the demo off and on to boot from a SPI flash");
    SLIDE_PRINT_TEXT("chip");
    SLIDE_END_BULLET;
}

static void draw_timer_slide()
{
    SLIDE_LAYOUT_INIT(sContextTimer);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("Timer Functionality");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Timer plus module supports 64-bit, dual 32-bit un-");
    SLIDE_PRINT_TEXT("chained, and dual 32-bit chained modes of operation");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Can be used to generate periodic interrupts");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Timer is used to toggle the state of two LEDs in");
    SLIDE_PRINT_TEXT("various patterns");
    SLIDE_END_BULLET;
}

static void draw_uart_slide()
{
    SLIDE_LAYOUT_INIT(sContextUart);
    
    SLIDE_DRAW_ICONS;
    
    SLIDE_PRINT_HEADER("UART Communication");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Industry-standard asynchronous serial I/O port");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Speed is programmable up to 3M baud");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Features 16 byte FIFO for transmit and receive");
    SLIDE_END_BULLET;
    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("Supports hardware flow control (RTS/CTS)");
    SLIDE_END_BULLET;

    SLIDE_PRINT_HEADER("Demo Instructions");

    SLIDE_NEW_BULLET;
    SLIDE_PRINT_TEXT("UART is used to send input values to some modes");
    SLIDE_PRINT_TEXT("of this application");
    SLIDE_END_BULLET;
}

static void draw_usbmouse_slide()
{
    const tRectangle rect1 = {50, 48, 430, 228};
    const tRectangle rect2 = {51, 49, 429, 227};
    
    GrImageDraw(&sContextUsbMouse, iconHome, 0, 0);
    GrImageDraw(&sContextUsbMouse, iconBack, 0, HEIGHT - 60);
    GrImageDraw(&sContextUsbMouse, iconNext, WIDTH - 60, HEIGHT - 60);

    /* draw special trackpad graphics instead of standard slide layout */
    GrContextForegroundSet(&sContextUsbMouse, ClrDarkBlue);
    GrRectDraw(&sContextUsbMouse, &rect1);
    GrRectDraw(&sContextUsbMouse, &rect2);
    
    GrContextForegroundSet(&sContextUsbMouse, ClrDarkGray);
    GrContextFontSet(&sContextUsbMouse, &g_sFontCmss22b);
    GrStringDrawCentered(&sContextUsbMouse, "Touch Pad", -1, 240, 140, 0);
    
    GrImageDraw(&sContextUsbMouse, (unsigned char *)usbMouseButtons, 50, 238);
}
