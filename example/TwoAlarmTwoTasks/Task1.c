#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"

DeclareTask(Task1);

TASK(Task1)
{   
    unsigned int tick = systick_get_ms();
    printf("Starting Task1 (Prio 2): %u\n\r", tick);
    TerminateTask();
}