;
; cpu.S
; CPU related definitions
; This file contains the API definitions for configuring CPU
;

; Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
; ALL RIGHTS RESERVED
;

		MODULE	CPU
		SECTION .text : CODE(4)
		PUBLIC  CPUSwitchToPrivilegedMode
		PUBLIC  CPUSwitchToUserMode
		PUBLIC  CPUAbortHandler
		PUBLIC  CPUIntStatus
		PUBLIC  CPUirqd
		PUBLIC  CPUirqe
		PUBLIC	CPUfiqd
		PUBLIC	CPUfiqe
;***************************************************************************
;                   FUNCTION DEFINITIONS
;***************************************************************************
; This source file is assembled for ARM instructions
        CODE32


;This API can be used to switch from user mode to privileged mode
;The priviledge mode will be system mode. System mode will share 
;the same resources as user mode, but with privileges.
;All the access to system configuration which needs privileged access
;can be done after calling this API.
;
CPUSwitchToPrivilegedMode:
	SWI   458752
	bx lr
;
;This API can be used to switch from any previleged mode of ARM to 
;user mode. After this API is called, the program will continue
;to operate in non-privileged mode, until any exception occurs.
;After the exception is serviced, execution will continue in user mode.
;All the access to system configuration which needs privileged access
;shall be done before this API is called.
;
CPUSwitchToUserMode:
	mrs     r0, cpsr
	bic     r0, r0, #0xF
	orr     r0, r0, #0x10
	msr     cpsr_c, r0
	bx 	lr

;
;This API is called when the CPU is aborted or during execution
;of any undefined instruction. Both IRQ and FIQ will be disabled
;when the CPU gets an abort and calls this API. 
;The user can perform error handling such as an immediate reset 
;inside this API if required.
;
CPUAbortHandler:
	nop
	nop
	nop
	nop
	bx lr

;
; Wrapper function for the IRQ status
;
CPUIntStatus:
	mrs     r0, CPSR	; IRQ and FIQ in CPSR ;
        and     r0, r0, #0xC0
	bx 	lr
;
; Wrapper function for the IRQ disable function
;
CPUirqd:
	mrs     r0, CPSR	; Disable IRQ in CPSR ;
	orr     r0, r0, #0x80
	msr     cpsr_c, r0
	bx 	lr

;
; Wrapper function for the IRQ enable function
;
CPUirqe:
	mrs     r0, CPSR	; Enable IRQ in CPSR ;
	bic     r0, r0, #0x80
	msr     cpsr_c, r0
	bx	lr

;
; Wrapper function for the FIQ disable function
;
CPUfiqd
	mrs     r0, cpsr	; Disable FIQ in CPSR ;
	orr     r0, r0, #0x40
	msr     cpsr_c, r0
	bx	lr

;
; Wrapper function for the FIQ enable function
;
CPUfiqe
	mrs     r0, cpsr	; Enable FIQ in CPSR ;
	bic     r0, r0, #0x40
	msr     cpsr_c, r0
	bx	lr

	END
;************************** End Of File ***********************************;
