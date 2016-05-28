/**
*  \file ecrobot_interface.c
*
*  \brief This file contains the function definitions for the users ECRobot-API. This API is used to interact with sensors and actuators.
*
*  \author Christian Soward, Tobias Schießl
*/

/*****************************************************************************
 * FILE: ecrobot_interface.c
 *
 * COPYRIGHT 2008 Takashi Chikamasa <takashic@cybernet.co.jp>
 *
 * <About leJOS NXJ>
 *  leJOS NXJ is a full firmware replacement of LEGO Mindstorms NXT and 
 *  designed for Java programming environment for the NXT 
 *  ( For more detailed information, please see: http://lejos.sourceforge.net/ )
 *  In the leJOS NXJ distribution, C source files for NXT platform layer is also
 *  included besides with the Java VM. The platform C source code is well
 *  structured, comprehensive, and achieved higher performance than the LEGO's
 *  one. Therefore, leJOS NXJ (platform) is also the best GCC based C/C++  
 *  development platform for NXT.
 *
 *  The contents of this file are subject to the Mozilla Public License
 *  Version 1.0 (the "License") {
    
}
 you may not use this file except in
 *  compliance with the License. You may obtain a copy of the License at
 *  http://www.mozilla.org/MPL/
 *
 *  Software distributed under the License is distributed on an "AS IS"
 *  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 *  License for the specific language governing rights and limitations
 *  under the License.
 *
 *  The Original Code is TinyVM code, first released March 6, 2000,
 *  later released as leJOS on September 23, 2000.
 *
 *  The Initial Developer of the Original Code is Jose H. Solorzano.
 *
 *  Contributor(s): see leJOS NXJ ACKNOWLEDGEMENTS .
 *
 *
 * <About TOPPERS OSEK>
 *  TOPPERS OSEK is an open source OSEK kernel and developed by TOPPERS project.
 *  TOPPERS(Toyohashi OPen Platform for Embedded Real-time Systems) has been managed 
 *  by a Non Profit Organization founded in Sep. 2003 and has been led by Professor
 *  Hiroaki Takada of Nagoya University in Japan. 
 *
 *  TOPPERS OSEK program is covered by the TOPPERS License as published
 *  by the TOPPERS PROJECT (http://www.toppers.jp/en/index.html).
 *
 *****************************************************************************/



/* Include statements */
#include "ecrobot_interface.h"
#include "stdio.h"

/* Global variable definitions */
/**
* \brief A internally used attribute. Needed to save the init state
**/
unsigned char isInitialized = 0;
/**
* \brief A internally used attribute. Needed for port access
**/
extern sensor_port_info ports[];

/* Macro definitions */
/**
* \brief A macro that is internally used to initialize leJOS if needed
**/
#define CHECK_INIT      if(!isInitialized){leJOS_init();isInitialized=1;}


/**
* \brief The internal standard error function for unimplemented ECRobot functions.
*
* \param function - The function that is currently not implemented
*
* \return none
**/
void error_function_call_not_implemented(char *function_name) {
    printf("ERROR: function %s called but not implemented in ECRobot - starting infinite loop...", function_name);
    // TODO show error message on display as soon as driver is implemented
    while(1);
}

/* NXT servo motor API */
/**
* \brief Sets Servo Motor PWM value. Wrapper of nxt_motor_set_speed, but brake mode is fixed as brake.
*
* \param port_id - EV3_PORT_1, EV3_PORT_2, EV3_PORT_3, EV3_PORT_4
* \param speed - -100 to +100
*
* \return none
**/
void ecrobot_set_motor_speed(U8 port_id, S8 speed) {
    CHECK_INIT
    nxt_motor_set_speed(port_id, speed, 1);
}

/**
* \brief Sets Servo Motor brake mode and PWM value. Wrapper of nxt_motor_set_speed
*
* \param port_id - EV3_PORT_1, EV3_PORT_2, EV3_PORT_3, EV3_PORT_4
* \param mode - 0(float), 1(brake)
* \param speed - -100 to +100
*
* \return none
**/
void ecrobot_set_motor_mode_speed(U8 port_id, S32 mode, S8 speed) {
    CHECK_INIT
    nxt_motor_set_speed(port_id, speed, mode);
}

/**
* \brief Gets Servo Motor revolution value in degree. Wrapper of nxt_motor_get_count.
*
* \param port_id - EV3_PORT_1, EV3_PORT_2, EV3_PORT_3, EV3_PORT_4
*
* \return Servo Motors revolution in degree
**/
S32 ecrobot_get_motor_rev(U8 port_id) {
    CHECK_INIT
    return nxt_motor_get_count(port_id);
}

/**
* \brief Sets Servo Motor revolution value in degree. Wrapper of nxt_motor_set_count.
*
* \param port_id - EV3_PORT_1, EV3_PORT_2, EV3_PORT_3, EV3_PORT_4
* \param rev - Servo Motors revolution in degree
*
* \return none
**/
void ecrobot_set_motor_rev(U8 port_id, S32 rev) {
    CHECK_INIT
    nxt_motor_set_count(port_id, rev);
}


/* NXT light sensor API */
/**
* \brief Get NXT Light Sensor raw A/D data
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return A/D raw data(0 to 1023)
**/
extern  U16 ecrobot_get_light_sensor(U8 port_id) {
    CHECK_INIT
    return sensor_light_get(port_id);
}

/**
* \brief Turn infra-red light on
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_set_light_sensor_active(U8 port_id) {
    CHECK_INIT
    sensor_light_set_active(port_id);
}

/**
* \brief Turn infra-red light off
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_set_light_sensor_inactive(U8 port_id) {
    CHECK_INIT
    sensor_light_set_inactive(port_id);
}


/* NXT touch sensor API */
/**
* \brief Get Touch Sensor on/off status
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return 1(touched), 0(not touched)
**/
extern U8 ecrobot_get_touch_sensor(U8 port_id) {
    CHECK_INIT
    return (U8) sensor_touch_get_state(port_id);
}


/* NXT sound sensor API */
/**
* \brief Get Sound Sensor raw A/D data
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return A/D raw data(0 to 1023)
**/
extern  U16 ecrobot_get_sound_sensor(U8 port_id) {
    CHECK_INIT
    return sensor_sound_get(port_id);
}


/* NXT I2C API */
/**
* \brief Init a NXT sensor port for I2C communication
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param type - LOWSPEED_9V, LOWSPEED
*
* \return none
**/
extern void ecrobot_init_i2c(U8 port_id, U8 type) {
    CHECK_INIT
    if (type == LOWSPEED_9V)
        gpio_set(ports[port_id].pin1, 1);
    else if (type == LOWSPEED)
        gpio_init_inpin(ports[port_id].pin1);
    sensor_digi_enable(port_id);
}

/**
* \brief Wait until I2C communication is ready
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param wait - wait time out in msec
*
* \return 1(I2C is ready), 0(time out)
**/
extern U8 ecrobot_wait_i2c_ready(U8 port_id, U32 wait) {
    CHECK_INIT
    volatile U32 time_out;

    time_out = systick_get_ms() + wait;
    while(systick_get_ms() <= time_out) {
        if (i2c_busy(port_id) == 0) return 1;
    }
    return 0;
}

/**
* \brief Send I2C data
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param address - 0x01 to 0x7F (Note that addresses are from 0x01 to 0x7F not even numbers from 0x02 to 0xFE as given in some I2C device specifications. They are 7-bit addresses not 8-bit addresses)
* \param i2c_reg - I2C register e.g. 0x42
* \param buf - buffer containing data to send
* \param len - length of the data to send
*
* \return 1(success), 0(failure)
**/
extern SINT ecrobot_send_i2c(U8 port_id, U32 address, SINT i2c_reg, U8 *buf, U32 len) {
    CHECK_INIT
    ecrobot_wait_i2c_ready(port_id, 50);
    SINT ret = i2c_start_transaction(port_id, address, i2c_reg, 1, buf, len, 1);
    return !ret;
}

/**
* \brief Read I2C data
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param address - 0x01 to 0x7F (Note that addresses are from 0x01 to 0x7F not even numbers from 0x02 to 0xFE as given in some I2C device specifications. They are 7-bit addresses not 8-bit addresses)
* \param i2c_reg - I2C register e.g. 0x42
* \param buf - buffer to return data
* \param len - length of the return data
*
* \return 1(success), 0(failure)
**/
extern SINT ecrobot_read_i2c(U8 port_id, U32 address, SINT i2c_reg, U8 *buf, U32 len) {
    CHECK_INIT
    ecrobot_wait_i2c_ready(port_id, 50);
    SINT ret = i2c_start_transaction(port_id, address, i2c_reg, 1, buf, len, 0);
    return !ret;
}

/**
* \brief Terminate a NXT sensor port used for I2C communication
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_term_i2c(U8 port_id) {
    CHECK_INIT
    i2c_disable(port_id);
}


/**
* \brief Init a NXT sensor port for Ultrasonic Sensor
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_init_sonar_sensor(U8 port_id) {
    ecrobot_init_i2c(port_id, LOWSPEED);
}

/**
* \brief Get Ultrasonic Sensor measurement data in cm
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return distance in cm (0 to 255), -1 (failure)
**/
extern  S32 ecrobot_get_sonar_sensor(U8 port_id) {
    CHECK_INIT
    sensor_ultrasonic_set_mode(port_id, ULTRASONIC_MODE_CONTINOUS);
    unsigned char data[8];
    sensor_ultrasonic_get_range(port_id, data);
    return (S32) data[0];
}

/**
* \brief Set the mode of the Lego ultrasonic sensor at the specified port to ULTRASONIC_MODE_SINGLE_SHOT. After that get the range of the Lego ultrasonic sensor connected at the specified port and store it in the buffer.
*
* The sensor meassures distances from 0 to 255 in cm. If nothing is located in front of the sensor, the value will be 255. All 8 entries of the array will be values returned by the sensor. If less than 8 objects are detected, some entries will be set to 255.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param data_buffer - Buffer to store the result in
*
* \return none
**/
extern void ecrobot_get_sonar_sensor_single_shot(U8 port_id, U8 data_buffer[8]) {
    CHECK_INIT
    sensor_ultrasonic_set_mode(port_id, ULTRASONIC_MODE_SINGLE_SHOT);
    sensor_ultrasonic_get_range(port_id, data_buffer);
}

/**
* \brief Terminate I2C used for for Ultrasonic
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_term_sonar_sensor(U8 port_id) {
    ecrobot_term_i2c(port_id);
}

/* HiTechnic gyro sensor API */
/**
* \brief Gets Gyro Sensor raw A/D data. The sensor data has offset value (approximately 600).
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return raw A/D value
**/
extern  U16 ecrobot_get_gyro_sensor(U8 port_id) {
    CHECK_INIT
    signed short gyro_value = adc_get(ports[port_id].adc1);
    gyro_value = 1024 * ((float) gyro_value / 0xFFF);
    return gyro_value;
}

/**
* \brief Get the current rotation meassured by the HiTechnic gyro sensor connected at the specified port
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return The current rotation meassured by the gyro sensor, ranging from -360 degrees  to +360 degrees 
**/
extern  S16 ecrobot_get_gyro_sensor_degrees(U8 port_id) {
    CHECK_INIT
    return sensor_gyro_get(port_id);
}


/* HiTechnic acceleration sensor API */
/**
* \brief Initializes a port for I2C communication for Acceleration Sensor. This function should be implemented in the device initialize hook routine.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_init_accel_sensor(U8 port_id) {
    ecrobot_init_i2c(port_id, LOWSPEED);
}

/**
* \brief Gets acceleration data in three axes.
* The sensor meassures the acceleration on all 3 axis (X, Y and Z).
* This function will call sensor_accel_calibrate when called for the first time. The values returned will be relativ to 0.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param buf - Buffer to store the meassured values in (the values will be stored in the buffer in the following order: X, Y, Z)
*
* \return none
**/
extern void ecrobot_get_accel_sensor(U8 port_id, S16 buf[3]) {
    CHECK_INIT
    sensor_accel_get(port_id, buf);
}

/**
* \brief Terminates I2C communication used for Acceleraton Sensor. This function should be implemented in the device terminate hook routine.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_term_accel_sensor(U8 port_id) {
    ecrobot_term_i2c(port_id);
}

/* HiTechnic color sensor API */
/**
* \brief initializes a port for I2C communication for the Color Sensor. This function should be implemented in the device initialize hook routine.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_init_color_sensor(U8 port_id) {
    ecrobot_init_i2c(port_id, LOWSPEED);
}

/**
* \brief Calibrate the HiTechnic color sensor at the specified port
*
* To calibrate the sensor properly, this function has to be called two times. Once with mode set to CAL_WHITE (0x043) and once with mode set to CAL_BLACK (0x42).
* Calibration information is stored directly on the sensor and will be persistent, even if the sensor is no longer provided with power.
* When called with mode set to CAL_WHITE, the sensor should be located in front of a diffuse white surface at a distance of 1.5 cm.
* When called with mode set to CAL_BLACK, the sensor should have nothing in front of it within a distance of about 2 m.
* If the calibration command was received successfully, the sensors LED will blink for confirmation.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param mode - The mode to calibrate the sensor with: CAL_WHITE (0x43) or CAL_BLACK (0x42)
*
* \return 1 if the calibration was successful, 0 otherwise
**/
extern   U8 ecrobot_cal_color_sensor(U8 port_id, U8 mode) {
    CHECK_INIT
    return sensor_hitechnic_color_calibrate(port_id, mode);
}

/**
* \brief Get the red, green and blue values (RGB) meassured by the HiTechnic color sensor at the specified port
*
* For best results, the sensor should be calibrated before calling this function.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param buf - Buffer to store the received data in (the values will be stored in the following order: red, green, blue)
*
* \return none
**/
extern void ecrobot_get_color_sensor(U8 port_id, S16 buf[3]) {
    CHECK_INIT
    sensor_hitechnic_color_get(port_id, buf);
}

/**
* \brief Terminates I2C communication used for the Color Sensor. This function should be implemented in the device terminate hook routine.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_term_color_sensor(U8 port_id) {
    ecrobot_term_i2c(port_id);
}


/* HiTechnic compass sensor API */
/**
* \brief Initializes a port for I2C communication for Compass Sensor. This function should be implemented in the device initialize hook routine.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_init_compass_sensor(U8 port_id) {
	CHECK_INIT;
	ecrobot_init_i2c(port_id, LOWSPEED);
}

/**
* \brief Read the current direction meassured by the HiTechnic compass sensor at the specified port
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return The current direction in degrees meassured by the sensor, ranging from 0 to 360
**/
extern  S16 ecrobot_get_compass_sensor(U8 port_id) {
    return sensor_compass_get(port_id);
}

/**
* \brief Terminates I2C communication used for Compass Sensor. This function should be implemented in the device terminate hook routine.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_term_compass_sensor(U8 port_id) {
	ecrobot_term_i2c(port_id);
}

/**
* \brief Start the HiTechnic compass sensor calibration
*
* You should calibrate a compass sensor when it is mounted on your robot in the way you want to use it. So the sensor will be calibrated for your specific environment/robot. The calibration adjustment is stored persitent on the sensor itself even if it is turned off. For more information see the HiTechnic documentation.
* Calibrating the compass sensor takes 3 steps. (1) Call this function. (2) Move the sensor/robot in a circle (540 degrees  - 720 degrees  within 20 seconds). (3) Call the appropriate end_calibration function.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_cal_start_compass_sensor(U8 port_id){
	sensor_compass_start_calibration(port_id);
}

/**
* \brief Finish the HiTechnic compass sensor calibration
*
* Read the information in the appropriate start_calibration function first.
* This function is the third step and finishs the calibration process.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return 1 if the calibration was successful, 0 otherwise
**/
extern U8 ecrobot_cal_end_compass_sensor(U8 port_id){
	return sensor_compass_end_calibration(port_id);
}

/* NXT temperature sensor API */
/**
* \brief Initializes a port for I2C communication for Temperature Sensor.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_init_temperature_sensor(U8 port_id) {
	CHECK_INIT;
	ecrobot_init_i2c(port_id, LOWSPEED);
}

/**
* \brief Measures and returns the current temperature value.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return The current temperature given in degrees Celsius
**/
extern float ecrobot_get_temperature_sensor(U8 port_id) {
	return sensor_temperature_nxt_get_temperature(port_id);
}

/**
* \brief Set the resolution for the measured temperature values.
*
* The internal Texas Instruments tmp275 temperature sensor can operate in different resolution modes. Lower resolution is faster. See the TEMP9BIT ... TEMP12BIT macros for more information or the official documentation.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
* \param resolution - The resolution. Use on of the macros TEMP9BIT ... TEMP12BIT
*
* \return none
**/
extern void ecrobot_setResolution_temperature_sensor(U8 port_id, U8 resolution) {
	sensor_temperature_nxt_set_resolution(port_id, resolution);
}

/**
* \brief Returns the current resolution setting of the sensor.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return The current resolution. See the macros TEMP9BIT ... TEMP12BIT
**/
extern U8 ecrobot_getResolution_temperature_sensor(U8 port_id) {
	return sensor_temperature_nxt_get_resolution(port_id);
}

/**
* \brief Terminates I2C communication used for Temperature Sensor.
*
* \param port_id - EV3_PORT_A, EV3_PORT_B, EV3_PORT_C, EV3_PORT_D
*
* \return none
**/
extern void ecrobot_term_temperature_sensor(U8 port_id) {
	ecrobot_term_i2c(port_id);
}

/* NXT internal status API */
/**
* \brief Get the voltage of the battery
*
* \return The volatge of the battery
*/
extern  U16 ecrobot_get_battery_voltage(void) {
    return get_battery_voltage();
}

/**
* \brief Get the current of the battery
*
* \return The current of the battery
*/
extern  U16 ecrobot_get_battery_current(void) {
    return get_battery_vurrent();
}

/**
* \brief Get the current tick in milliseconds
*
* \return The current tick in milliseconds
**/
extern  U32 ecrobot_get_systick_ms(void) {
    CHECK_INIT
    return systick_get_ms();
}

/**
* \brief Wait for the specified amount of time
*
* Waiting with this function is an active waiting which will block until the time has elapsed.
*
* \param ms - The time to wait in milliseconds
*
* \return none
**/
extern void ecrobot_wait_ms(U32 ms) {
    CHECK_INIT
    systick_wait_ms(ms);
}

/**
* \brief Returns status of the enter button
*
* \return 1(is pressed), 0(is not pressed)
**/
extern   U8 ecrobot_is_ENTER_button_pressed(void) {
    button_state bstate = button_get_state(BUTTON_CENTER);
    if (bstate == BUTTON_DOWN)
    	return 1;
    else
    	return 0;
}

/**
* \brief Returns status of the run button
*
* \return 1(is pressed), 0(is not pressed)
**/
extern   U8 ecrobot_is_RUN_button_pressed(void) {
    button_state bstate = button_get_state(BUTTON_RIGHT);
        if (bstate == BUTTON_DOWN)
            return 1;
        else
            return 0;
}
