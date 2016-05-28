#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"

DeclareTask(Task1);

// This task will be started by an alarm
TASK(Task1)
{   
    printf("Starting Task1 (Alarm)\n\r");
    U8 touch_state = ecrobot_get_touch_sensor(EV3_PORT_S3);
    printf("Touch Sensor State: %u\n", touch_state);
    printf("Terminating Task1 (Alarm)\n\r");
    TerminateTask();
}