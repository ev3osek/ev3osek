#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"

#define DEBUG_OUTPUT_NOT

DeclareTask(LineFollowerTask);
DeclareEvent(TouchEvent);

TASK(TouchEventDispatcherTask)
{
#ifdef DEBUG_OUTPUT
    printf("Starting TouchEventTask\n\r");
#endif
    if (ecrobot_get_touch_sensor(EV3_PORT_S3) == 1) {
#ifdef DEBUG_OUTPUT
        printf("Sending touch event\n\r");
#endif
        SetEvent(LineFollowerTask, TouchEvent);
    }
    TerminateTask();
}
