#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"

DeclareTask(Task1);
DeclareResource(Test);

// This task will be started by an alarm
TASK(Task1)
{   
    printf("Starting Task1 (Alarm)\n\r");
    printf("Task1 is waiting for resource...\n\r");
    GetResource(Test);
    systick_wait_ms(1000);
    printf("Task1 releases resource...\n\r");
    ReleaseResource(Test);
    printf("Terminating Task1 (Alarm)\n\r");
    TerminateTask();
}