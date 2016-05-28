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

// This task is started automatically when the OSEK kernel has finished booting
TASK(Task2)
{
    printf("Starting Task2 (Autostart)\n\r");
    while (1) {
        //ecrobot_wait_ms(250); // Problem occurs in context switch back when the dispatched task was activly waiting this way
        //for (int i = 0; i < 500000; ++i); // Waiting in a loop is okay as far as the loop is finished between two dispatches
        systick_wait_ms(250); // Calling systick_wait_ms directly seem to work as well
        printf("Task2 is still doing nothing\n\r");
    }
    printf("Terminating Task2 (Autostart)\n\r");
    TerminateTask();
}


