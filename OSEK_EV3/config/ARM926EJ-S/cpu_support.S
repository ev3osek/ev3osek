/*
 *  TOPPERS/OSEK Kernel
 *      Toyohashi Open Platform for Embedded Real-Time Systems/
 *      OSEK Kernel
 * 
 *  Copyright (C) 2000-2003 by Embedded and Real-Time Systems Laboratory
 *                              Toyohashi Univ. of Technology, JAPAN
 *  Copyright (C) 2004 by Embedded and Real-Time Systems Laboratory
 *              Graduate School of Information Science, Nagoya Univ., JAPAN
 *  Copyright (C) 2006 by Witz Corporation, JAPAN
 * 
 *  上記著作権者は，以下の (1)～(4) の条件か，Free Software Foundation 
 *  によって公表されている GNU General Public License の Version 2 に記
 *  述されている条件を満たす場合に限り，本ソフトウェア（本ソフトウェア
 *  を改変したものを含む．以下同じ）を使用・複製・改変・再配布（以下，
 *  利用と呼ぶ）することを無償で許諾する．
 *  (1) 本ソフトウェアをソースコードの形で利用する場合には，上記の著作
 *      権表示，この利用条件および下記の無保証規定が，そのままの形でソー
 *      スコード中に含まれていること．
 *  (2) 本ソフトウェアを，ライブラリ形式など，他のソフトウェア開発に使
 *      用できる形で再配布する場合には，再配布に伴うドキュメント（利用
 *      者マニュアルなど）に，上記の著作権表示，この利用条件および下記
 *      の無保証規定を掲載すること．
 *  (3) 本ソフトウェアを，機器に組み込むなど，他のソフトウェア開発に使
 *      用できない形で再配布する場合には，次のいずれかの条件を満たすこ
 *      と．
 *    (a) 再配布に伴うドキュメント（利用者マニュアルなど）に，上記の著
 *        作権表示，この利用条件および下記の無保証規定を掲載すること．
 *    (b) 再配布の形態を，別に定める方法によって，TOPPERSプロジェクトに
 *        報告すること．
 *  (4) 本ソフトウェアの利用により直接的または間接的に生じるいかなる損
 *      害からも，上記著作権者およびTOPPERSプロジェクトを免責すること．
 * 
 *  本ソフトウェアは，無保証で提供されているものである．上記著作権者お
 *  よびTOPPERSプロジェクトは，本ソフトウェアに関して，その適用可能性も
 *  含めて，いかなる保証も行わない．また，本ソフトウェアの利用により直
 *  接的または間接的に生じたいかなる損害に関しても，その責任を負わない．
 *
 *  This program is covered by the TOPPERS License as published
 *  by the  TOPPERS PROJECT (http://www.toppers.jp/en/index.html).
 * 
 */

/*	プロセッサ依存モジュール アセンブリ言語部（AT91SAM7S用） */

/*    Processor Dependent Module (for AM1808)
 *
 *    Copyright (C) 2007  Masaaki Mizuno 
 *    Department of Computing and Information Sciences,
 *    Kansas State University  (masaaki@cis.ksu.edu)
 */
 
#define _MACRO_ONLY

/*	外部参照宣言 */
	.extern	runtsk
	.extern	schedtsk
	.extern	tcxb_pc
	.extern	tcxb_sp
	.extern	tinib_task
	.extern	callevel
	.extern	runisr
	.extern	tinib_exepri
	.extern	tcb_curpri
	.extern	call_pretaskhook
	.extern	call_posttaskhook
	.extern	PreTaskHook
	.extern	PostTaskHook
	.extern	lock_flag
	.extern	__system_stack__
	.extern	tcxb_lr
	.extern	tcxb_spsr

/*	外部公開宣言 */
	.global	dispatch
	.global	dispatch_irq
	.global	start_dispatch
	.global	exit_and_dispatch
	.global	activate_r
	.global	dispatch_r
	.global	nop

	.text
	.code	32
	.align	4

/////////////////////////////////////////////////////////////////////////////////////////////////
//   dispatch:
//      this function is called by a task
//            save the non-distructive registers (r4-r11, lr)
//            save sp in the sp saving area in TCB
//            save "dispatcher_r" in the pc saving area in TCB
//            jump to "dispatcher"
/////////////////////////////////////////////////////////////////////////////////////////////////
dispatch:
	stmfd	sp!, {lr}
dispatch_irq:
	mrs     lr, spsr				// save the status regisgter
	stmfd	sp!, {lr}
	stmfd	sp!, {r0-r12} 		// save the non-distructive registers
	ldr	r0, =tcxb_sp			// save sp in the sp saving area in TCB
	ldr	r1, =runtsk
	ldr	r1, [r1]			// "ldrb" performs zero-extension
	str	sp, [r0, r1, asl #2]		// tcxb_sp[runtsk] = sp
	
	ldr	r2, =dispatcher_r		// save "dispatcher_r" in the pc saving area in TCB
	ldr	r0, =tcxb_pc
	str	r2, [r0, r1, asl #2]		// tcxb_pc[runtsk] = "dispatcher_r"
	b	dispatcher			// jump to "dispatcher"
	
.align	4
////////////////////////////////////////////////////////////////////////////////////////////////
//      dispacth_r:
//          If a task relinquishes the CPU through "dispatch",  
//          it executes this function to be dispatched when it is scheduled again.
//              restore the non-desctructive registers (r4-r11)
//              restore the value of LR (the address  to return from "dispatch") in PC
////////////////////////////////////////////////////////////////////////////////////////////////
dispatcher_r:
        BL      IntMasterIRQEnable              // enable interrupts (disabled in TerminateTask)
        BL      IntMasterFIQEnable 
        ldmfd	sp!, {r0-r12}
        ldmfd	sp!, {lr}
        msrne   spsr_cxsf, lr
        ldmfd		sp!, {lr}^              // the return address  is found abovce the destructive registers in the stack
        bx		lr                         // return to address where programm stopped before IRQ
	
.align	4
////////////////////////////////////////////////////////////////////////////////////////////////
//   activate_r:
//       When a task is scheduled and dispatched for the first time, this function is called
//      Address "activare_r" is set to the PC saving area in TCB by activate_context( ) in cpu_context.h
//           set tinib_exepri[runtsk] to   tcb_curpri[runtsk], where runtsk is the ID of the task to be dispatched
//           enabe interrupt
//           jump to tinib_task[runtsk]
/////////////////////////////////////////////////////////////////////////////////////////////////          
activate_r:
        BL      IntMasterIRQEnable
        BL      IntMasterFIQEnable
	ldr	r0, =tinib_exepri		// tcb_curpri[runtsk] = tinib_exepri[runtsk]
	ldr	r1, =runtsk
	ldr 	r1, [r1]
	ldrb	r0, [r0, r1]			// r0 <- tinib_exepri[runtsk]

	ldr	r2, =tcb_curpri
	strb	r0, [r2, r1]			// tcb_curpri[runtsk] = tinib_exepri[runtsk]
	ldr	r0, =tinib_task
	ldr	r0, [r0, r1, asl #2]		// r0 <- tinib_task[runtsk], which is the address of the function that the task first executes
	mov     pc, r0				// jump to tinib_task[runtsk]
	
.align	4
//////////////////////////////////////////////////////////////////////////////////////////////
//    exit_and_dispatch:
//       this is called from TerminateTask() and ChainTask(), when one task relinquishes CPU
//       and another task is scheduled and dispatched
//             if (PostTaskHook != 0) PosTaskHook();
//             continue on to "start_dispatch"
///////////////////////////////////////////////////////////////////////////////////////////////
exit_and_dispatch:
dispatcher:
	ldr	r0, =PostTaskHook
	cmp	r0, #0
	beq	start_dispatch
	bl	call_posttaskhook
	//   fall  to start_dispatch
	
/////////////////////////////////////////////////////////////////////////////////////////////////
//    start_dispatch:
//       this function is called to dispatch schedtsk (the task that the scheduler has just selected)
//          set schedtsk to runtsk
//          if (runtsk == INVALID_TASK) jump to "pre_idle"
//          restore sp from tcxb_sp[runtsk] 
//          if  (PreTaskHook != 0) call_pretaskhook()
//          continue on to dispatch_task
//////////////////////////////////////////////////////////////////////////////////////////////////
start_dispatch:
	ldr	r0, =schedtsk			// runtsk = schedtsk
	ldr	r0, [r0]
	ldr	r1, =runtsk
	str	r0, [r1]
	
	cmp	r0, #INVALID_TASK		// if (runtsk == INVALID) jump to "pre_idle"
	beq	pre_idle_2
	
	ldr	r1, =tcxb_sp			// sp = tcxb_sp[runtsk]
	ldr	sp, [r1,r0, asl #2]

	ldr	r0, =PreTaskHook		// if (PreTaskHook !=0) call_pretaskhook()
	cmp	r0, #0
	beq	dispatch_task
	bl	call_pretaskhook
	// fall to "dispatch_task"
	
/////////////////////////////////////////////////////////////////////////////////////////////////////
//   dispatch_task:  this is called only from start_dispatch 
//       dispatch to the locatoin saved in tcxb_pc[runtsk]
///////////////////////////////////////////////////////////////////////////////////////////////////
dispatch_task:
	ldr	r0, =tcxb_pc
	ldr	r1, =runtsk
	ldr	r1, [r1]
	ldr	r0, [r0, r1, asl #2]
        mov     pc, r0
	
//////////////////////////////////////////////////////////////////////////////////////////////////////
//     pre_idle:
//        switch the stack from a task stack to the "system_stack"
//        callevel = TCL_ISR2 (type2 interrupt level)
//        fall to idle_loop
///////////////////////////////////////////////////////////////////////////////////////////////////////
pre_idle_2:
        ldr	sp, =__system_stack__
        bic	sp, sp, #7                      // make sure it is 8-byte aligned
        bl      IntMasterIRQEnable
        bl      IntMasterFIQEnable
pre_idle:
	ldr	r0, =callevel
	mov	r1, #TCL_ISR2
	strb	r1, [r0]
	// fall to idle_loop
	
///////////////////////////////////////////////////////////////////////////////////////////////////////
//  idle_loop:
//     the body of the idle task
//         enable interrupt
//         wait  for a while  (wait for an interrupt to arrive)
//         disable interupt
//         if (schedtsk == INVALID)  jump back to "idle_loop"
//         callevel = TCS_TASK
//         jump to "start_dispatch"
///////////////////////////////////////////////////////////////////////////////////////////////////////
idle_loop:
	b	next1				// wait for a while
next1:
	b	next2
next2:
	b	next3
next3:
	mov	r0, #INVALID_TASK		// if (schedtsk == INVALID) jump back to "idle_loop"
	ldr	r1, =schedtsk
	ldr	r1, [r1]		
	cmp	r0, r1
	beq	idle_loop
	mov	r0, #TCL_TASK			//  callevel = TCL_TASK
	ldr	r1, =callevel
	strb	r0, [r1]
	b	start_dispatch			// jump to "start_dispatch"
	
nop:
	bx	lr


/* 定数の定義 */
.equ TCL_TASK , 1
.equ TCL_ISR2 , 2
.equ INVALID_TASK, 0xFF

.end
