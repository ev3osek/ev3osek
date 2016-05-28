#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"
#include "systick.h"

DeclareTask(Task2);
DeclareCounter(SysTimerCnt);

void user_1ms_isr_type2(void) {
    SignalCounter(SysTimerCnt);
}

TASK(Task2)
{
    unsigned int tick = systick_get_ms();
    printf("Starting Task2 (Prio 1): %u\n\r", tick);
    TerminateTask();
}


