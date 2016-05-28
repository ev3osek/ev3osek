;cp15.S
;coprocessor related definitions
;This file contains the API definitions for configuring coprocessor register


; Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
; ALL RIGHTS RESERVED

; Module for CP15 operations
      MODULE  CP15
      
; Text Section 
        SECTION .text: CODE (4)

; This source file is assembled for ARM instructions
        CODE32

;This API disable the Instruction cache.
	PUBLIC	CP15ICacheDisable
CP15ICacheDisable:
	mrc     p15, #0, r0, c1, c0, #0
        bic     r0,  r0, #0x00001000
        mcr     p15, #0, r0, c1, c0, #0
        bx      lr
        
;This API disable the Data cache.
	PUBLIC	CP15DCacheDisable
CP15DCacheDisable:
	mrc     p15, #0, r0, c1, c0, #0
	bic     r0,  r0, #0x00000004
	mcr     p15, #0, r0, c1, c0, #0
        bx      lr


;This API Enables the Instruction cache.
	PUBLIC	CP15ICacheEnable
CP15ICacheEnable:
	mrc     p15, #0, r0, c1, c0, #0
	orr     r0,  r0, #0x00001000
	mcr     p15, #0, r0, c1, c0, #0
        bx      lr


;This API Enables the Data cache.
; Note: MMU shall be enabled before enabling D-Cache
	PUBLIC  CP15DCacheEnable
CP15DCacheEnable:
	mrc     p15, #0, r0, c1, c0, #0
	orr     r0,  r0, #0x00000004
	mcr     p15, #0, r0, c1, c0, #0
        bx      lr

;This API Invalidates data cache.
	PUBLIC  CP15DCacheFlush
CP15DCacheFlush:
	mov     r0, #0
	mcr     p15, #0, r0, c7, c6, #0
        bx      lr



;This API cleans the D-Cache. The cleaning of D-Cache is done
	PUBLIC  CP15DCacheClean
CP15DCacheClean:
clean:
	mrc    p15, 0, r15, c7, c10, 3
        bne clean
        bx      lr

;This API cleans and flushes the D-Cache. This is done  using the
;test clean command
	PUBLIC  CP15DCacheClean
CP15DCacheCleanFlush:
cleanflush:
	mrc    p15, 0, r15, c7, c14, 3        
	bne cleanflush
        bx     lr

;This API Invalidates Instruction cache.
	PUBLIC  CP15ICacheFlush
CP15ICacheFlush:
	mov     r0, #0
	mcr     p15, #0, r0, c7, c5, #0
        bx      lr

;This API flushes the I-cache for a buffer till the specified length
        PUBLIC  CP15ICacheFlushBuff
CP15ICacheFlushBuff:
        bic      r2, r0, #0x1F
        add      r0, r1, r0
        mov      r1, r2
        b        FlushBuffChk
FlushBuffLoop:
        mcr p15, #0, r1, c7, c6, #1
        add      r1, r1, #32
FlushBuffChk:
        cmp      r1, r0
        blt      FlushBuffLoop
        bx       lr

;This API cleans the D-cache for a buffer till the specified length
        PUBLIC  CP15DCacheCleanBuff
CP15DCacheCleanBuff:
        bic      r2, r0, #0x1F
        add      r0, r1, r0
        mov      r1, r2
        b        CleanBuffChk
CleanBuffLoop:
        mcr p15, #0, r1, c7, c10, #1
        add      r1, r1, #32
CleanBuffChk:
        cmp      r1, r0
        blt      CleanBuffLoop
        bx       lr

;This API Configures translation table base register with
;with page table starting address.
; note: Expects r0 to contain the address of the translation table
	PUBLIC	CP15TtbSet
CP15TtbSet:
; Invalidates all TLBs.Domain access is selected as client,in that case 
; access controlled by permission value set by page table entry
	mov r1, #0
	mcr p15, #0, r1, c8, c7, #0
	ldr r1, =0x55555555
	mcr p15, #0, r1, c3, c0, #0
;sets translation table base resgister with page table starting address.
	mcr p15, #0, r0, c2, c0, #0
	bx lr


;This API disables the MMU.
	PUBLIC  CP15MMUDisable
CP15MMUDisable:
	mov r0, #0
	mcr p15, #0, r0, c8, c7, #0
	mrc p15, #0, r0, c1, c0, #0
	mov r1, #0x1
	bic r0, r0, r1
	mcr p15, #0, r0, c1, c0, #0
        bx      lr

; \brief     This API enables the MMU.
	PUBLIC  CP15MMUEnable
CP15MMUEnable:
	mrc p15, #0, r0, c1, c0, #0
	orr r0, r0, #0x00000001
	mcr p15, #0, r0, c1, c0, #0
        bx      lr

      END
