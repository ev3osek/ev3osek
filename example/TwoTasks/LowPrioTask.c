#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"

DeclareTask(LowPrioTask);
DeclareTask(HighPrioTask);
DeclareEvent(TouchEvent);

void user_1ms_isr_type2(void) {
	
}

TASK(LowPrioTask)
{
    printf("Starting Low Prio Task\n\r");
    ecrobot_get_touch_sensor(EV3_PORT_S3); // TODO: touch sensor returns 1 on first call - Why?
    while (ecrobot_get_touch_sensor(EV3_PORT_S3) == 0)
        ;
    printf("Low Prio Task: Sending TouchEvent\n\r");
    SetEvent(HighPrioTask, TouchEvent);
    printf("This code should not be reached!");
    printf("Terminating Low Prio Task\n\r");
    TerminateTask();
}


