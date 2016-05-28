        .global ExceptionHandler
		.global FIQHandler
        .global IRQHandler
        .global SWIHandler
        
        .equ MASK_SWI_NUM, 0xFF000000

        .text

        .code 32

@ Default entry for all vecotrs except Reset is "B ExceptionHandler" so each interrupt would cause a reset
@ Since I can only say that the IRQ Handler works, we leave the remaining ones as they are
ExceptionHandler:
        B Entry
        B ExceptionHandler
        B SWIHandler
        B ExceptionHandler
        B ExceptionHandler
        B ExceptionHandler
        B IRQHandler
        NOP	@ Fall to FIQHandler (saves one branch instruction)

@******************************************************************************
@*                  Function Definition of FIQ Handler
@******************************************************************************    
@
@ The IRQ handler jumps to the ISR of highest priority pending FIQ. The address
@ is taken from the HIPVR1 (0xFFFEF600) register, which contains the ISR address of highest
@ pending FIQ. This handler doesnot support nesting.
@        
FIQHandler:
        STMFD    r13!, {r0-r7, lr}
        LDR      r0, =0xFFFEF600
        LDR      r0, [r0]
        MOV      lr, pc
        LDR      pc, [r0]
        LDMFD    r13!, {r0-r7, lr}
        SUBS     pc, lr, #0x4        
        
@******************************************************************************
@*                  Function Definition of SWI Handler
@******************************************************************************    
@
@ The SWI Handler switches to system mode if the SWI number is 458752. If the
@ SWI number is different, no mode switching will be done. No other SWI are 
@ handled here
@
SWIHandler:
        STMFD    r13!, {r0-r1, r14}       @ Save context in SVC stack
        LDR      r0, [r14, #-4]           @ R0 points to SWI instruction
        BIC      r0, r0, #MASK_SWI_NUM    @ Get the SWI number
        CMP      r0, #458752
        MRSEQ    r1, spsr                 @ Copy SPSR  
        ORREQ    r1, r1, #0x1F            @ Change the mode to System
        MSREQ    spsr_cf, r1              @ Restore SPSR
        LDMFD    r13!, {r0-r1, pc}^       @ Restore registers from IRQ stack

@******************************************************************************
@*                  Function Definition of IRQ Handler
@******************************************************************************    
@
@ The IRQ handler jumps to the ISR of highest priority pending IRQ. The address
@ is taken from the HIPVR2 (0xFFFEF604) register, which contains the ISR address of highest
@ pending IRQ. This handler doesnot support nesting.
@
IRQHandler:
        STMFD    r13!, {r0-r12, lr}             @ Save context in IRQ stack
        LDR      r0, =0xFFFEF604                @ AINTC HIPVR2 Register
        LDR      r0, [r0]                       @ Get Entry of ISR-Vector-Table
        PUSH     {r0}                           @ Save r0 (required after ISR)
        MOV      lr, pc                         @ Save return address in LR 
        LDR      pc, [r0]                       @ Jump to ISR
        POP      {r0}                           @ Check if ISR was systick_isr_C
        LDR      r1, [r0]
        LDR      r2, =systick_isr_C
        CMP      r1, r2
        BNE      SkipButtons                    @ If not we can return from IRQ-Handler
        MOV      lr, pc                         @ Otherwise check if any button was pressed
        LDR      pc, =checkEV3Buttons
SkipButtons:
        LDMFD    r13!, {r0-r12, lr}  @ Restore registers from IRQ stack
        SUBS     pc, r14, #0x4            @ Return to program before IRQ

@*****************************************************************************
@
@ End of the file
@
		.end