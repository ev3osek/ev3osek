#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "stdio.h"

#define LOOP1(ID,End) if(ID==1){a++;}else if(ID==2){b++;}else if(ID==3){c++;} for(int k=0; k<End; k++){j|=j<<1;}
#define LOOP2(ID,End) if(ID==1){a++;}else if(ID==2){b++;}else if(ID==3){c++;} for(int l=0; l<End; l++){j|=j<<1;}
#define getTime() current_time = systick_get_ms()-first_start;

DeclareTask(Task1);
DeclareTask(Task2);
DeclareTask(Task3);
DeclareCounter(SysTimerCnt);

void user_1ms_isr_type2(void){
    (void)SignalCounter(SysTimerCnt);
}

static U32 current_time;
static U32 first_start = 0;
static int j = 100;
static int End;
static int a,b,c = 0;

TASK(Task1)
{ 
	
  getTime();
  printf("Task 1(%i) start at %i.\n\r",a,current_time);
  LOOP1(1,562*500);
  //printf("Task 1 intermediate ends.\n\r");
  LOOP2(1,562*1500);
  getTime();
  printf("Task 1(%i) end at %i.\n\r",a,current_time);
  TerminateTask();
}

TASK(Task2)
{   
  getTime();
  printf("Task 2(%i) start at %i.\n\r",b,current_time);
  LOOP1(2,562*500);
  //printf("Task 2 intermediate ends.\n\r");
  LOOP2(2,562*1500);
  getTime();
  printf("Task 2(%i) end at %i.\n\r",b,current_time);
  TerminateTask();
}

TASK(Task3)
{   
  getTime();
  printf("Task 3(%i) start at %i.\n\r",c,current_time);
  LOOP1(3,562*500);
  //printf("Task 3 intermediate ends.\n\r");
  LOOP2(3,562*1500);
  getTime();
  printf("Task 3(%i) end at %i.\n\r",c,current_time);
  TerminateTask();
}


