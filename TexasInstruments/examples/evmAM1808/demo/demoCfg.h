/**
 * \file   demoCfg.h
 * 
 * \brief  Configuration values for the Demo Application  
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

#ifndef _DEMOCFG_H_
#define _DEMOCFG_H_

/*
** I2C Slave Addresses
*/
#define I2C_SLAVE_AIC31_ADDR                   (0x18u)
#define I2C_SLAVE_PMIC_ADDR                    (0x48u)
#define I2C_SLAVE_EXPANDER_ADDR                (0x21u)

/*
** Configurable parameters for the Audio Tone
*/
#define TONE_SLOT_SIZE                         (16u)
#define TONE_WORD_SIZE                         (16u)
#define TONE_SAMPLE_RATE                       (44100u)

/*
** Size of the Image to be displayed on the LCD in bytes
*/
#define SIZEOF_IMAGE                           (261152u)

/*
** Number of Icons in the images
*/
#define NUM_ICON_DFLT                          (3u)
#define NUM_ICON_BANNER                        (NUM_ICON_DFLT)
#define NUM_ICON_CHOICE                        (NUM_ICON_DFLT)
#define NUM_ICON_INTRO                         (NUM_ICON_DFLT)
#define NUM_ICON_I2C                           (NUM_ICON_DFLT)
#define NUM_ICON_TMR                           (NUM_ICON_DFLT)
#define NUM_ICON_GPIO                          (NUM_ICON_DFLT)
#define NUM_ICON_UART                          (NUM_ICON_DFLT)
#define NUM_ICON_SPI                           (NUM_ICON_DFLT)
#define NUM_ICON_MCASP                         (NUM_ICON_DFLT)
#define NUM_ICON_ENET                          (NUM_ICON_DFLT)
#define NUM_ICON_RTC                           (4u)
#define NUM_ICON_MENU	                       (11u)
#define NUM_ICON_USB_MOUSE	                   (7u)

/*
** The indexes of Each Icon in the html page 
*/
#define CLICK_IDX_INTRO                        (2u)
#define CLICK_IDX_CHOICE                       (3u)
#define CLICK_IDX_MCASP                        (4u)
#define CLICK_IDX_SPI                          (5u)
#define CLICK_IDX_UART	                       (6u)
#define CLICK_IDX_GPIO                         (7u)
#define CLICK_IDX_RTC                          (8u)
#define CLICK_IDX_LED                          (9u)
#define CLICK_IDX_USB_MOUSE                    (10u)
#define CLICK_IDX_TIMER                        (11u)
#define CLICK_IDX_ETHERNET                     (12u)


/*
** Coordinates of the 'Next' icon displayed on the LCD.
*/
#define XMAX_NEXT                              (480u)
#define XMIN_NEXT                              (430u)
#define YMAX_NEXT                              (272u)
#define YMIN_NEXT                              (235u)

/*
** Coordinates of the 'Prev' icon displayed on the LCD.
*/
#define XMAX_PREV                              (45u)
#define XMIN_PREV                              (0u)
#define YMAX_PREV                              (272u)
#define YMIN_PREV                              (235u)

/*
** Coordinates of the 'Home' icon displayed on the LCD.
*/
#define XMAX_HOME                              (35u)
#define XMIN_HOME                              (0u)
#define YMAX_HOME                              (35u)
#define YMIN_HOME                              (0u)

/*
** Coordinates of the 'Set Time and Date' icon displayed in the RTC slide.
*/
#define XMIN_RTC_STD                           (125u)
#define XMAX_RTC_STD                           (340u)
#define YMIN_RTC_STD                           (184u)
#define YMAX_RTC_STD                           (228u)

/*
** Coordinates of the Menu Intro icon displayed in the Menu slide.
*/
#define XMIN_INTRO	46
#define XMAX_INTRO	108
#define YMIN_INTRO	28
#define YMAX_INTRO	90

/*
** Coordinates of the Menu web demo icon displayed in the Menu slide.
*/
#define XMIN_WEB_DEMO	155
#define XMAX_WEB_DEMO	216
#define YMIN_WEB_DEMO	28
#define YMAX_WEB_DEMO	90

/*
** Coordinates of the Menu McASP icon displayed in the Menu slide.
*/
#define XMIN_MCASP	263
#define XMAX_MCASP	323
#define YMIN_MCASP	28
#define YMAX_MCASP	90

/*
** Coordinates of the Menu SPI icon displayed in the Menu slide.
*/
#define XMIN_SPI	370
#define XMAX_SPI	432
#define YMIN_SPI	28
#define YMAX_SPI	90

/*
** Coordinates of the Menu UART icon displayed in the Menu slide.
*/
#define XMIN_UART	46
#define XMAX_UART	108
#define YMIN_UART	118
#define YMAX_UART	180

/*
** Coordinates of the Menu GPIO icon displayed in the Menu slide.
*/
#define	XMIN_GPIO	155
#define	XMAX_GPIO	216
#define	YMIN_GPIO	118
#define	YMAX_GPIO	180

/*
** Coordinates of the Menu RTC icon displayed in the Menu slide.
*/
#define XMIN_RTC	263
#define XMAX_RTC	323
#define YMIN_RTC	118
#define YMAX_RTC	180

/*
** Coordinates of the Menu I2C icon displayed in the Menu slide.
*/
#define	XMIN_I2C	370
#define	XMAX_I2C	432
#define	YMIN_I2C	118
#define	YMAX_I2C	180

/*
** Coordinates of the Menu USB Mouse icon displayed in the Menu slide.
*/
#define	XMIN_USB_MOUSE	46
#define	XMAX_USB_MOUSE	108
#define	YMIN_USB_MOUSE	209
#define	YMAX_USB_MOUSE	272

/*
** Coordinates of the Menu Timer icon displayed in the Menu slide.
*/
#define XMIN_TIMER	155
#define XMAX_TIMER	216
#define YMIN_TIMER	209
#define YMAX_TIMER	272
							   
/*
** Coordinates of the Menu Ethernet icon displayed in the Menu slide.
*/
#define	XMIN_ETHERNET	263
#define	XMAX_ETHERNET	323
#define	YMIN_ETHERNET	209
#define	YMAX_ETHERNET	272

/*
** Coordinates of the Mouse left button in the USB HID slide.
*/
#define XMIN_MOUSE_LEFT	54
#define XMAX_MOUSE_LEFT	175
#define YMIN_MOUSE_LEFT	235
#define YMAX_MOUSE_LEFT	272

/*
** Coordinates of the Mouse middle button in the USB HID slide.
*/
#define XMIN_MOUSE_MIDDLE	177
#define XMAX_MOUSE_MIDDLE	297
#define YMIN_MOUSE_MIDDLE	235
#define YMAX_MOUSE_MIDDLE	272

/*
** Coordinates of the Mouse right button in the USB HID slide.
*/
#define XMIN_MOUSE_RIGHT	300
#define XMAX_MOUSE_RIGHT	422
#define YMIN_MOUSE_RIGHT	235
#define YMAX_MOUSE_RIGHT	272

/*
** Coordinates of the Touch pad in the USB HID slide.
*/
#define	XMIN_TOUCH_PAD	54
#define	XMAX_TOUCH_PAD	423
#define	YMIN_TOUCH_PAD	31
#define	YMAX_TOUCH_PAD	229


#endif
