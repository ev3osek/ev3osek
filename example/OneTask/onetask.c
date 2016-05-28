#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "systick.h"
#include "stdio.h"

DeclareTask(OneTask);

void user_1ms_isr_type2(void) {
    
}

TASK(OneTask)
{
    ecrobot_set_light_sensor_active(EV3_PORT_S2);
    while (1) {
        unsigned short light = sensor_light_get(EV3_PORT_S2);
        printf("%u\n", light);
        systick_wait_ms(10);
    }
    ecrobot_set_light_sensor_inactive(EV3_PORT_S2);
}