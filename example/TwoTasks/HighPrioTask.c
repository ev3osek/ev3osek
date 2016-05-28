#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "systick.h"
#include "stdio.h"

DeclareTask(HighPrioTask);
DeclareEvent(TouchEvent);

TASK(HighPrioTask)
{   
    printf("Starting High Prio Task\n\r");
    ecrobot_init_sonar_sensor(EV3_PORT_S2);
    printf("High Prio Task: Waiting for TouchEvent\n\r");
    WaitEvent(TouchEvent);
    ClearEvent(TouchEvent);
    printf("High Prio Task: Got TouchEvent\n\r");
    while (1) {
        unsigned char ultrasonic_range = ecrobot_get_sonar_sensor(EV3_PORT_S2);
        printf("Ultrasonic range: %u\n", ultrasonic_range);
        systick_wait_ms(1000);
    }
    printf("Terminating High Prio Task\n\r");
    TerminateTask();
}