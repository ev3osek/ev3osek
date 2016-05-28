#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"

DeclareTask(OneTask);
DeclareCounter(SysTimerCnt);

void user_1ms_isr_type2(void) {
    SignalCounter(SysTimerCnt);
}

TASK(OneTask)
{
    U32 systick = ecrobot_get_systick_ms();
    U8 touch_state = ecrobot_get_touch_sensor(EV3_PORT_S3);
    printf("touch_state: %u (systick: %u)\n", touch_state, (unsigned int) systick);
    TerminateTask();
}