#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "systick.h"
#include "stdio.h"

DeclareTask(OneTaskButtons);

void user_1ms_isr_type2(void) {
	
}

TASK(OneTaskButtons)
{
#ifndef print_binary(n)
#define print_binary(n) { unsigned i; for (i = 1 << 31; i > 0; i = i / 2) { (n & i)? printf("1") : printf("0"); } printf("\n\r"); }
#endif print_binary(n)


	ecrobot_init_temperature_sensor(NXT_PORT_S4);
	ecrobot_setResolution_temperature_sensor(NXT_PORT_S4, TEMP12BIT);
	ecrobot_wait_ms(2000);
	U8 t = ecrobot_getResolution_temperature_sensor(NXT_PORT_S4);
	print_binary(t);

	while (1) {
		ecrobot_wait_ms(500);

		//multiplied by 10000 because float2uart doesn't work. Last
		printf("Temp=%i\n\r",(int) (ecrobot_get_temperature_sensor(NXT_PORT_S4) * 10000));
	}

	printf("Finished\n\r");

}
