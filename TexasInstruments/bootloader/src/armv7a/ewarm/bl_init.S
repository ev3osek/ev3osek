;******************************************************************************
;
; init.S - Init code routines
;
;******************************************************************************
;
; Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
;
;
;  Redistribution and use in source and binary forms, with or without
;  modification, are permitted provided that the following conditions
;  are met:
;
;    Redistributions of source code must retain the above copyright
;    notice, this list of conditions and the following disclaimer.
;
;    Redistributions in binary form must reproduce the above copyright
;    notice, this list of conditions and the following disclaimer in the
;    documentation and/or other materials provided with the
;    distribution.
;
;    Neither the name of Texas Instruments Incorporated nor the names of
;    its contributors may be used to endorse or promote products derived
;    from this software without specific prior written permission.
;
;  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;
;******************************************************************************
;
;******************************************************************************

	MODULE EXCEPTIONS
;****************************** Global Symbols*********************************
        PUBLIC Entry
        IMPORT bl_start
        IMPORT __iar_data_init3

        IMPORT stack_end$$Base
 
        SECTION .bss:CODE:NOROOT(3)
        SECTION SYSTEMSTART:CODE (4)
;************************ Internal Definitions ********************************

;
; to set the mode bits in CPSR for different modes
;        
UND_STACK_SIZE DEFINE 0x8
ABT_STACK_SIZE DEFINE 0x8
FIQ_STACK_SIZE DEFINE 0x8
IRQ_STACK_SIZE DEFINE 0x500
SVC_STACK_SIZE DEFINE 0x8

MODE_USR DEFINE 0x10            
MODE_FIQ DEFINE 0x11
MODE_IRQ DEFINE 0x12
MODE_SVC DEFINE 0x13
MODE_ABT DEFINE 0x17
MODE_UND DEFINE 0x1B
MODE_SYS DEFINE 0x1F            

I_F_BIT DEFINE 0xC0               

;******************************************************************************
; This source file is assembled for ARM instructions
        CODE32
;******************************************************************************
;
; The reset handler sets up the stack pointers for all the modes. The FIQ and
; IRQ shall be disabled during this. Then, clearthe BSS sections, switch to the
; main() function. 
;
Entry:
;
; Set up the Stack for Undefined mode
;
         LDR   r0, =stack_end$$Base             ; Read the stack address
         MSR   cpsr_c, #MODE_UND|I_F_BIT       ; switch to undef  mode
         MOV   sp,r0                           ; write the stack pointer
         SUB   r0, r0, #UND_STACK_SIZE         ; give stack space
;
; Set up the Stack for abort mode
;
         MSR   cpsr_c, #MODE_ABT|I_F_BIT       ; Change to abort mode
         MOV   sp, r0                          ; write the stack pointer
         SUB   r0,r0, #ABT_STACK_SIZE          ; give stack space
;
; Set up the Stack for FIQ mode
;
         MSR   cpsr_c, #MODE_FIQ|I_F_BIT       ; change to FIQ mode
         MOV   sp,r0                           ; write the stack pointer
         SUB   r0,r0, #FIQ_STACK_SIZE          ; give stack space
;
; Set up the Stack for IRQ mode
;
         MSR   cpsr_c, #MODE_IRQ|I_F_BIT       ; change to IRQ mode
         MOV   sp,r0                           ; write the stack pointer
         SUB   r0,r0, #IRQ_STACK_SIZE          ; give stack space
;
; Set up the Stack for SVC mode
;
         MSR   cpsr_c, #MODE_SVC|I_F_BIT       ; change to SVC mode
         MOV   sp,r0                           ; write the stack pointer
         SUB   r0,r0, #SVC_STACK_SIZE          ; give stack space
;
; Set up the Stack for USer/System mode
;
         MSR   cpsr_c, #MODE_SYS|I_F_BIT       ; change to system mode
         MOV   sp,r0                           ; write the stack pointer

;
; Clear the BSS section here. Use IAR library functions to init data sections.
; Do so because the linker script is not friendly enough for access this section
;
         LDR   r10,=__iar_data_init3
         BLX   r10


         LDR   r0, =SFB(.bss)                    ; Start address of BSS
         LDR   r1, =SFE(.bss)                    ; End address of BSS
         MOV   r2, #0
loop_zi_copy:
         STR   r2, [r0], #4                    ; Clear one word in BSS
         CMP   r0, r1
         BLE   loop_zi_copy                    ; Clear till BSS end

;
; Enter the main function. The execution still happens in system mode
;
Enter_main:
         LDR   r10, =bl_start		           ; Get the address of main
         MOV   lr,pc                           ; Dummy return to main
         BLX    r10                             ; Branch to main 
         SUB   pc, pc, #0x08                   ; looping   

;
; End of the file
;
         END    
    



