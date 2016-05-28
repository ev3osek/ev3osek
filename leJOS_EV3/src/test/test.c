/**
*  \file test.c
*    
*  \brief This file was used to test the functionality of our leJOS EV3 driver. It contains some initialization code as well.
* 
*  \author Project team
*/

/* Inlcude statements */
#include "stdio.h"
#include "../ev3/systick.h"
#include "../ev3/i2c.h"
#include "../ev3/mytypes.h"
#include "cpu.h"
#include "hw_syscfg0_AM1808.h"
#include "hw_syscfg1_AM1808.h"
#include "soc_AM1808.h"
#include "evmAM1808.h"
#include "hw_types.h"
#include "interrupt.h"
#include "../ev3/init.h"
#include "../ev3/adc_sensors.h"
#include "../ev3/digi_sensors.h"
#include "../ev3/ninja/motor.h"
#include "../ev3/ninja/led.h"
#include "../ev3/ninja/button.h"
#include "../ev3/power.h"
#include "../ev3/ev3_motors.h"

/* Local function declarations */
unsigned int 	start_boot		(void);
void 			copyVectorTable	(void);
void 			checkEV3Buttons	(void);
void 			c_entry			(void);
/* Test functions */
void testSystick(void);
void testUltrasonic(void);
void testCompass(void);
void testTouch(void);
void testLight(void);
void testSWI(void);
void testAccel(void);
void testMotor(void);
void testLed(void);
void testSound(void);
void testGyro(void);
void testPowerDown(void);
void testButton(void);
void testColor(void);

/* This is the function is necessary to initialize the interrupt vector table properly */
extern void ExceptionHandler(void);

/**
* \brief This is the function called in the assemlber startup code (see startup.S) which acts as the main entry point to our C application
* 
* Some low level initialization will be done here before calling the entry point of the actual application.
*
* \return none (This function never returns - if the main application ends without shuting down the EV3, it will go into an infinite loop)
**/
unsigned int start_boot(void) {
    /* Unlock system config registers - no sure if this is required */
    SysCfgRegistersUnlock();
    
    /* Initialize the vector table with opcodes */
    copyVectorTable();

	/* Jumps to the actual application */
    c_entry();
    
	/* Go into an infinite loop if the main application returns */
    while(1);
}

/**
* \brief Copy the vector table to it's destination at 0xFFFF0000
* 
* The address 0xFFFF0000 is specified in the SoC's documentation. This is the address were the CPU will branch to if an exception (interrupt) occurs. Ths address maps to the local RAM of the ARM CPU.
* Note: It's important that the data copied to this address represents branch instructions which will branch to the actual exception handler. Copying the address of the exception handlers
* to said location will not work!
* Note: We also have to copy the actual code of the exception handler into the local RAM of the ARM CPU since the branch instructions in the ExceptionHandler (B ...) will not work otherwise.
*
* \return none
**/
void copyVectorTable(void) {
    unsigned int *dest = (unsigned int *)0xFFFF0000;
    /* The address of the assembler exception vector */
    unsigned int *addrExceptionHandler = (unsigned int *)ExceptionHandler;
    int i;
    
    /* We only set vector 1 to 7 and leave the Reset vector in peace */
    /* Important: don't set the address of the vectors - we need to write the operation (i.e. the machine code) to that location */
    for (i = 1; i < 8; ++i) {
        dest[i] = addrExceptionHandler[i];
    }
    
    /* This code is required in order for the branch instructions (B ...) to work (for some reasons it seems not to be possible to branch back to SoC RAM from ARM CPU RAM) */
    for (; i < 2048; ++i) {
        dest[i] = addrExceptionHandler[i];
    }
}

/**
* \brief Check if a button of the EV3 was pressed and in case it was the back button, shutdown the EV3
* 
* This function is called from the IRQ handler (see exceptionhandler.S) whenever the systick (timer) interrupt occurs.
*
* \return none
**/
void checkEV3Buttons(void) {
    button_id b = button_get_pressed();
    switch (b) {
        case BUTTON_BACK:
            power_off();
            break;
        default:
            // Nothing to do
            break;
    }
}

/**
* \brief This is the entry point of the actual application
* 
* This function will be called after the low level initialization in start_boot is done.
* Usually this function should never return.
*
* \return none
**/
void c_entry(void) {
	// First of all, initialize the leJOS driver
    leJOS_init();
    
    //testSystick();
    //testUltrasonic();
    //testCompass();
    //testTouch();
    //testLight();
    //testSWI();
    //testAccel();
    //testSound();
    //testGyro();
    //testButton();
    //testColor();
    //testMotor();
    //testLed();   
    
    testPowerDown();
}

/**
* \brief Test the motor functionality of the leJOS driver
*
* \return none
**/
void testMotor(void) {
    nxt_motor_command(MOTOR_PORT_A,0,180,10);
    systick_wait_ms(10000);
    nxt_motor_command(MOTOR_PORT_A,1,720,50);
    systick_wait_ms(10000);
    nxt_motor_command(MOTOR_PORT_A,1,1080,100);
    systick_wait_ms(10000);
	
	/*
    nxt_motor_command(MOTOR_PORT_B,0, 1080, 100);
    nxt_motor_set_speed(MOTOR_PORT_A, 70, 0);
    systick_wait_ms(5000);
    nxt_motor_set_speed(MOTOR_PORT_A, 0, 0);
    systick_wait_ms(1000);
    nxt_motor_set_speed(MOTOR_PORT_A, 70, 1);
    systick_wait_ms(5000);
    nxt_motor_set_speed(MOTOR_PORT_A, 0, 1);
    systick_wait_ms(1000);
    nxt_motor_set_speed(MOTOR_PORT_A, 70, 1);
    systick_wait_ms(5000);
    nxt_motor_set_speed(MOTOR_PORT_A, 0, 0);
    SetPower(MOTOR_PORT_A, -50);
    SetPower(MOTOR_PORT_B, -50);
    SetPower(MOTOR_PORT_C, -50);
    SetPower(MOTOR_PORT_D, -50);
    systick_wait_ms(5000);
    SetPower(MOTOR_PORT_A, 0);
    systick_wait_ms(1000);
    SetPower(MOTOR_PORT_A, 50);
    systick_wait_ms(5000);
    SetPower(MOTOR_PORT_A, 0);
    nxt_motor_command(MOTOR_PORT_D,0, 1080, 100);
    systick_wait_ms(5000);
    nxt_motor_command(MOTOR_PORT_C,0,180,10);
    systick_wait_ms(5000);
	*/
	
	/*
    nxt_motor_set_speed(MOTOR_PORT_A, 20, 0);
    systick_wait_ms(1000);
    nxt_motor_set_speed(MOTOR_PORT_A, 0, 1);
    int count = nxt_motor_get_count(MOTOR_PORT_A);
    printf("count = %d\n",count);
	*/
}

/**
* \brief Test the HiTechnic color sensor V2 functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testColor(void) {
    printf("Testing HiTechnic Color Sensor V2\n\r");
    int port = EV3_PORT_S2;
    sensor_digi_enable(port);
    printf("Sensor enabled - Starting Calibration in 3 seconds: BLACK\n\r");
    systick_wait_ms(3000);
    int success = sensor_hitechnic_color_calibrate(port, CAL_BLACK);
    if (!success) {
        printf("Failed to calibrate...\n\r");
        power_off();
    }
    printf("Calibratin for BLACK done - Starting Calibration in 3 seconds: WHITE\n\r");
    systick_wait_ms(3000);
    success = sensor_hitechnic_color_calibrate(port, CAL_WHITE);
    if (!success) {
        printf("Failed to calibrate...\n\r");
        power_off();
    }
	
    while (1) {
        signed short data_buffer[3];
        unsigned char color_ID = sensor_hitechnic_color_get_color_id(port);
        sensor_hitechnic_color_get(port, data_buffer);
        char string_buffer[15];
        sensor_hitechnic_color_id_to_string(color_ID, string_buffer);
        printf("Color-ID: %u (%s)\n   RED: %i\n   GREEN: %i\n   BLUE: %i\n", (unsigned int) color_ID, string_buffer, data_buffer[0], data_buffer[1], data_buffer[2]);
        systick_wait_ms(250);
    }
}

/**
* \brief Test the LED functionality of the leJOS driver
*
* \return none
**/
void testLed(void) {
    led_set(LED_BOTH, LED_ORANGE);
    systick_wait_ms(100);
    led_set(LED_BOTH, LED_RED);
    systick_wait_ms(100);
    led_set(LED_BOTH, LED_GREEN);
    systick_wait_ms(10);    
    led_set(LED_LEFT, LED_RED);    
    systick_wait_ms(10);    
    led_set(LED_RIGHT, LED_ORANGE);
    systick_wait_ms(100);
    led_set(LED_BOTH, LED_GREEN);
}

/**
* \brief Test the systick functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testSystick(void) {
    unsigned int counter = 1;
    
    /* Switch to non privileged mode - this is done for demonstration purposes */
    CPUSwitchToUserMode();  
    
    U32 local_systick = systick_get_ms();
    printf("Current tick: %lu (%u)\n", local_systick, counter);
    do {
        systick_wait_ms(1000);
        ++counter;
        local_systick = systick_get_ms();
        printf("Current tick: %lu (%u)\n", local_systick, counter);
    } while (1);
}

/**
* \brief Test the Lego ultrasonic sensor functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testUltrasonic(void) {
    int port = EV3_PORT_S2;
    sensor_digi_enable(port);
    
    CPUSwitchToUserMode();
       
    do {
        printf("Switching to sinle shot mode\n\r");
        sensor_ultrasonic_set_mode(port, ULTRASONIC_MODE_SINGLE_SHOT);
        for (int i = 0; i < 10; ++i) {
            unsigned char ultrasonic_value[8];
            sensor_ultrasonic_get_range(port, ultrasonic_value);
            printf("Ultrasonic values at port %i:\n", port + 1);
            for (int j = 0; j < 8; ++j)
                printf("Value %i: %u\n", j + 1, ultrasonic_value[j]);
            systick_wait_ms(1000);

        }
        printf("Switching to continous measurement mode\n\r");
        sensor_ultrasonic_set_mode(port, ULTRASONIC_MODE_CONTINOUS);
        for (int i = 0; i < 10; ++i) {
            unsigned char ultrasonic_value[8];
            sensor_ultrasonic_get_range(port, ultrasonic_value);
            printf("Ultrasonic value at port %i: %u\n", port + 1, ultrasonic_value[0]);
            systick_wait_ms(1000);
        }
    } while (1);
}

/**
* \brief Test the HiTechnic compass sensor functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testCompass(void) {
    sensor_digi_enable(EV3_PORT_S2);
    
    CPUSwitchToUserMode();
       
    do {
        unsigned short compass_value = sensor_compass_get(EV3_PORT_S2);
        printf("Compass value at port 2: %u\n", compass_value);
        systick_wait_ms(1000);
    } while (1);
}

/**
* \brief Test the Lego touch sensor functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testTouch(void) {
    while (1) {
        int state = sensor_touch_get_state(EV3_PORT_S2);
        printf("State: %i\n", state);
        systick_wait_ms(10);
    }
}

/**
* \brief Test the Lego light sensor functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testLight(void) {
    sensor_light_set_active(EV3_PORT_S2);
    while (1) {
        unsigned short light_value_NXT = sensor_light_get(EV3_PORT_S2);
        printf("Light sensor value NXT: %u\n", light_value_NXT);
        systick_wait_ms(1000);
    }
}

/**
* \brief Test the software interrupt handler in exceptionhandler.S
*
* The software interrupt handler is required in order to switch back to privileged mode once we entered user mode.
*
* \return none
**/
void testSWI(void) {
    CPUSwitchToUserMode();
    systick_wait_ms(1000);
    CPUSwitchToPrivilegedMode();
    printf("We are back in Privileged Mode\n\r");
}

/**
* \brief Test the HiTechnic acceleration sensor functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testAccel(void) {
    sensor_digi_enable(EV3_PORT_S2);
    
    CPUSwitchToUserMode();
       
    do {
        short data_buffer[3];
        sensor_accel_get(EV3_PORT_S2, data_buffer);
        printf("Accel X value at port 2: %i\n", data_buffer[0]);
        printf("Accel Y value at port 2: %i\n", data_buffer[1]);
        printf("Accel Z value at port 2: %i\n", data_buffer[2]);
        systick_wait_ms(1000);
    } while (1);
}

/**
* \brief Test the Lego sound sensor functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testSound(void) {
    CPUSwitchToUserMode();
       
    do {
        unsigned short sound_value_NXT = sensor_sound_get(EV3_PORT_S2);
        printf("Sound Sensor Value NXT: %u\n", sound_value_NXT);
        systick_wait_ms(100);
    } while (1);
}

/**
* \brief Test the HiTechnic gyro sensor functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testGyro(void) {
    CPUSwitchToUserMode();
       
    do {
        signed short gyro_value = sensor_gyro_get(EV3_PORT_S2);
        printf("Gyro Sensor Value: %i\n", gyro_value);
        systick_wait_ms(100);
    } while (1);
}

/**
* \brief Test the button functionality of the leJOS driver
*
* This function will never return.
*
* \return none
**/
void testButton(void) {
    CPUSwitchToUserMode();
    
    while(1) {
        unsigned char button = button_get_pressed();
        printf("Button pressed: %u\n", button);
        systick_wait_ms(500);
    }
}

/**
* \brief Test the power management of the leJOS driver
*
* This function will shutdown the EV3.
*
* \return none
**/
void testPowerDown(void) {
    printf("Turning off brick!\n\r");
    power_off();
}