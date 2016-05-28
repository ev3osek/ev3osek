#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"

#define DEBUG_OUTPUT_NOT

DeclareTask(LineFollowerTask);
DeclareEvent(LightValueEvent);
DeclareResource(LightValue);

U16 lightSensorValue;

TASK(LightValueEventDispatcherTask)
{
#ifdef DEBUG_OUTPUT
    printf("Starting LightEventTask\n\r");
#endif
    GetResource(LightValue);
    lightSensorValue = sensor_light_get(EV3_PORT_S2);
#ifdef DEBUG_OUTPUT
    printf("Light sensor value: %u\n\r", (unsigned int) lightSensorValue);
#endif
    ReleaseResource(LightValue);
    SetEvent(LineFollowerTask, LightValueEvent);
    TerminateTask();
}
