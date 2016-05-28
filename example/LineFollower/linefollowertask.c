#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"

DeclareTask(LineFollowerTask);
DeclareEvent(TouchEvent);
DeclareEvent(LightValueEvent);
DeclareResource(LightValue);
DeclareCounter(SysTimerCnt);

#define DEBUG_OUTPUT_NOT

#define NORMAL_SPEED 	          40

#define WHITE			  425
#define BLACK			  555
//#define MIDDLE			  (((float)BLACK + (float)WHITE) / 2)
#define MIDDLE                    455

// test purposes
// we need to set the middle more close to white for some reason
// I guess the light sensor does not return linear values between white and black
// instead the values seam to be on an exponential curve between white and black
//#define WHITE				515
//#define BLACK				575
//#define MIDDLE			525 

typedef struct
{
    double dState; // Last position input
    double iState; // Integrator state
    double iMax, iMin; // Maximum and minimum allowable integrator state
    double iGain, // Integral gain
    pGain, // Proportional gain
    dGain; // Derivative gain
} SPid;

void initPIDStruct(SPid *pid);
double UpdatePID(SPid * pid, double error);

void user_1ms_isr_type2(void) {
    SignalCounter(SysTimerCnt);
}

extern U16 lightSensorValue;

TASK(LineFollowerTask)
{
    // variable declaration
    unsigned int isMoving = 0;
    SPid pid;
    // initialize light sensor and PID
    ecrobot_set_light_sensor_active(EV3_PORT_S2);
    initPIDStruct(&pid);
    // start the control loop
#ifdef DEBUG_OUTPUT        
    printf("Initialization passed\n\r");
#endif
    while(1)
    {
        // wait for light our touch event
        EventMaskType eventmask = 0;
#ifdef DEBUG_OUTPUT 
        printf("Waiting for event\n\r");
#endif
        WaitEvent(TouchEvent | LightValueEvent);
        GetEvent(LineFollowerTask, &eventmask);
        
        if (eventmask & TouchEvent) {
#ifdef DEBUG_OUTPUT   
            printf("Got touch event\n\r");
#endif
            // clear event
            ClearEvent(TouchEvent);
            // start or stop the motors
            if (isMoving == 0) {
#ifdef DEBUG_OUTPUT   
                    printf("Starting motors\n\r");
#endif
                // start
                nxt_motor_set_speed(NXT_PORT_A, NORMAL_SPEED, 0);
                nxt_motor_set_speed(NXT_PORT_B, NORMAL_SPEED, 0);
                isMoving = 1;
            }
            else {
#ifdef DEBUG_OUTPUT   
                printf("Stopping motors\n\r");
#endif
                // stop
                nxt_motor_set_speed(NXT_PORT_A, 0, 0);
                nxt_motor_set_speed(NXT_PORT_B, 0, 0);
                isMoving = 0;
            }
        }
        else if (eventmask & LightValueEvent) {
#ifdef DEBUG_OUTPUT   
            printf("Got light event\n\r");
#endif
            // clear event
            ClearEvent(LightValueEvent);
            // get local light sensor value to work with
            GetResource(LightValue);
            U16 localLightSensorValue = lightSensorValue;
            ReleaseResource(LightValue);
            // error is < 0 if we are to far left, error is > 0 if we are to far right
            double error = localLightSensorValue - MIDDLE; 
            // output will have the same signs as error
            double output = UpdatePID(&pid, error);
#ifdef DEBUG_OUTPUT   
            printf("PID output is %i\n\r", (int) output);
#endif
            // check if we are moving - if not, we have nothing to adjust
            if (isMoving == 0)
                continue;
                
            if (output < 0) {
#ifdef DEBUG_OUTPUT   
                printf("Turning right\n\r");
#endif
                // turn right
                int leftMotorSpeed = NORMAL_SPEED - 0.75 * output; // result > NORMAL_SPEED
                int rightMotorSpeed = (NORMAL_SPEED + 1.5 * output); // result < NORMAL_SPEED
                //printf("Left Motor Power: %i, Right Motor Power: %i\n", leftMotorSpeed, rightMotorSpeed);
                nxt_motor_set_speed(NXT_PORT_A, leftMotorSpeed, 0);
                nxt_motor_set_speed(NXT_PORT_B, rightMotorSpeed, 0);
            }
            else if (output > 0) {
#ifdef DEBUG_OUTPUT   
                printf("Turning left\n\r");
#endif
                // turn left
                int leftMotorSpeed = NORMAL_SPEED - 1.5 * output; // result < NORMAL_SPEED
                int rightMotorSpeed = (NORMAL_SPEED + 0.75 * output); // result > NORMAL_SPEED
                //printf("Left Motor Power: %i, Right Motor Power: %i\n", leftMotorSpeed, rightMotorSpeed);
                nxt_motor_set_speed(NXT_PORT_A, leftMotorSpeed, 0);
                nxt_motor_set_speed(NXT_PORT_B, rightMotorSpeed, 0);
            }
            else {
#ifdef DEBUG_OUTPUT   
                printf("Going straight\n\r");
#endif
                // go straight
                nxt_motor_set_speed(NXT_PORT_A, NORMAL_SPEED, 0);
                nxt_motor_set_speed(NXT_PORT_B, NORMAL_SPEED, 0);
            }
        }
        else {
#ifdef DEBUG_OUTPUT   
            printf("An error occurred (wrong event)\n\r");
#endif
            // must not happen - something went wrong
            // log error and stop execution 
            nxt_motor_set_speed(NXT_PORT_A, 0, 0);
            nxt_motor_set_speed(NXT_PORT_B, 0, 0);
            ecrobot_set_light_sensor_inactive(EV3_PORT_S2);
            break;
        }
    }
    // end task if we have to quit the control loop for whatever reason
    TerminateTask();
}

void initPIDStruct(SPid *pid) {
    pid->dState = 0;
    pid->iState = 0;
    pid->iMax = 1000;
    pid->iMin = -1000;
    pid->pGain = 0.75;
    pid->iGain = 0.06;
    pid->dGain = 2.34375;
}

double UpdatePID(SPid * pid, double error)
{
    double pTerm, dTerm, iTerm;
    int hasSignChanged = (pid->dState < 0 && error >= 0) || (pid->dState >= 0 && error < 0);
    
    // calculate the proportional term
    pTerm = pid->pGain * error;
    
    if (hasSignChanged)
        // reset integral if sign of error changed
        pid->iState = 0;
    else {
        // calculate the integral state with appropriate limiting
        pid->iState += error;
        if (pid->iState > pid->iMax) pid->iState = pid->iMax;
        else if (pid->iState < pid->iMin) pid->iState = pid->iMin;
    }
    // calculate the integral term
    iTerm = pid->iGain * pid->iState; 
    
    if (hasSignChanged)
        // reset derivate if sign of error changed
        pid->dState = 0;
    // calculate the derivate term
    dTerm = pid->dGain * (error - pid->dState);
    pid->dState = error;
    
    return pTerm + dTerm + iTerm;
}
