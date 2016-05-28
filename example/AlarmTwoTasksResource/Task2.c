#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"
#include "systick.h"

DeclareTask(Task2);
DeclareCounter(SysTimerCnt);
DeclareResource(Test);

void user_1ms_isr_type2(void) {
    SignalCounter(SysTimerCnt);
}

// This task is started automatically when the OSEK kernel has finished booting
TASK(Task2)
{
    printf("Starting Task2 (Autostart)\n\r");
    while(1) {
        GetResource(Test);
        printf("Task2 is blocking resource...\n\r");
        systick_wait_ms(3000);
        printf("Task2 releases resource...\n\r");
        ReleaseResource(Test);
    }
    printf("Terminating Task2 (Autostart)\n\r");
    TerminateTask();
}


