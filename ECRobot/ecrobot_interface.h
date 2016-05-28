/**
*  \file ecrobot_interface.h
*
*  \brief This file contains the function declarations for the users ECRobot-API. This API is used to interact with sensors and actuators.
*
*  \author Christian Soward, Tobias Schießl
*/
#ifndef _ECROBOT_INTERFACE_H_
#define _ECROBOT_INTERFACE_H_

/* Include statements */
#include "mytypes.h"
#include "systick.h"
#include "adc_sensors.h"
#include "digi_sensors.h"
#include "ev3_motors.h"
#include "i2c.h"
#include "gpio.h"
#include "init.h"
#include "adc.h"
#include "power.h"
#include "ninja/button.h"
#include "stdio.h"
#include "ecrobot_types.h"

/* Macro definitions */
/**
 * \brief I2C sensor mode used for 9V sensors
 */
#define LOWSPEED_9V 1

/**
 * \brief I2C sensor mode used for sensors with standard voltage
 */
#define LOWSPEED    2

/* NXT servo motor API */
extern  S32 ecrobot_get_motor_rev(U8 port_id);
extern void ecrobot_set_motor_speed(U8 port_id, S8 speed);
extern void ecrobot_set_motor_mode_speed(U8 port_id, S32 mode, S8 speed);
extern void ecrobot_set_motor_rev(U8 port_id, S32 rev);

/* NXT light sensor API */
extern  U16 ecrobot_get_light_sensor(U8 port_id);
extern void ecrobot_set_light_sensor_active(U8 port_id);
extern void ecrobot_set_light_sensor_inactive(U8 port_id);

/* NXT touch sensor API */
extern   U8 ecrobot_get_touch_sensor(U8 port_id);

/* NXT sound sensor API */
extern  U16 ecrobot_get_sound_sensor(U8 port_id);

/* NXT I2C API */
extern void ecrobot_init_i2c(U8 port_id, U8 type);
extern   U8 ecrobot_wait_i2c_ready(U8 port_id, U32 wait);
extern SINT ecrobot_send_i2c(U8 port_id, U32 address, SINT i2c_reg, U8 *buf, U32 len);
extern SINT ecrobot_read_i2c(U8 port_id, U32 address, SINT i2c_reg, U8 *buf, U32 len);
extern void ecrobot_term_i2c(U8 port_id);

/* NXT ultrasonic sensor API */
extern void ecrobot_init_sonar_sensor(U8 port_id);
extern  S32 ecrobot_get_sonar_sensor(U8 port_id);
extern void ecrobot_get_sonar_sensor_single_shot(U8 port_id, U8 data_buffer[8]);
extern void ecrobot_term_sonar_sensor(U8 port_id);

/* HiTechnic gyro sensor API */
extern  U16 ecrobot_get_gyro_sensor(U8 port_id);
extern  S16 ecrobot_get_gyro_sensor_degrees(U8 port_id);

/* HiTechnic acceleration sensor API */
extern void ecrobot_init_accel_sensor(U8 port_id);
extern void ecrobot_get_accel_sensor(U8 port_id, S16 buf[3]);
extern void ecrobot_term_accel_sensor(U8 port_id);

/* HiTechnic color sensor API */
extern void ecrobot_init_color_sensor(U8 port_id);
extern   U8 ecrobot_cal_color_sensor(U8 port_id, U8 mode);
extern void ecrobot_get_color_sensor(U8 port_id, S16 buf[3]);
extern void ecrobot_term_color_sensor(U8 port_id);

/* HiTechnic compass sensor API */
extern void ecrobot_init_compass_sensor(U8 port_id);
extern  S16 ecrobot_get_compass_sensor(U8 port_id);
extern void ecrobot_term_compass_sensor(U8 port_id);
extern void ecrobot_cal_start_compass_sensor(U8 port_id);
extern U8 ecrobot_cal_end_compass_sensor(U8 port_id);

/* NXT temperature sensor API */
extern void ecrobot_init_temperature_sensor(U8 port_id);
extern float ecrobot_get_temperature_sensor(U8 port_id);
extern void ecrobot_setResolution_temperature_sensor(U8 port_id, U8 resolution);
extern U8 ecrobot_getResolution_temperature_sensor(U8 port_id);
extern void ecrobot_term_temperature_sensor(U8 port_id);

/* NXT internal status API */
extern  U16 ecrobot_get_battery_voltage(void);
extern  U16 ecrobot_get_battery_current(void);
extern  U32 ecrobot_get_systick_ms(void);
extern void ecrobot_wait_ms(U32 ms);
extern   U8 ecrobot_is_ENTER_button_pressed(void);
extern   U8 ecrobot_is_RUN_button_pressed(void);

#endif
