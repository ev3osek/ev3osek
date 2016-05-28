;
;
; init.S - Init code routines
;
; Copyright (c) 2005-2010 Texas Instruments Incorporated.  All rights reserved.
; Software License Agreement
;
; This is part of the SitaraWare Development Package.
;
;

	MODULE  BOOT
	IMPORT bl_start      
	IMPORT __iar_data_init3

	SECTION .text: CODE (4)
	CODE32

        SECTION IRQ_STACK:DATA:NOROOT(3)
        SECTION FIQ_STACK:DATA:NOROOT(3)
        SECTION SVC_STACK:DATA:NOROOT(3)
        SECTION ABT_STACK:DATA:NOROOT(3)
        SECTION UND_STACK:DATA:NOROOT(3)
        SECTION CSTACK:DATA:NOROOT(3)
        SECTION SYSTEMSTART:CODE (4)
;
; to set the mode bits in CPSR for different modes
;        
MODE_USR DEFINE 0x10            
MODE_FIQ DEFINE 0x11
MODE_IRQ DEFINE 0x12
MODE_SVC DEFINE 0x13
MODE_ABT DEFINE 0x17
MODE_UND DEFINE 0x1B
MODE_SYS DEFINE 0x1F            

I_F_BIT DEFINE 0xC0               

;******************************************************************************
;
;******************************************************************************
;
; The reset handler sets up the stack pointers for all the modes. The FIQ and
; IRQ shall be disabled during this. Then clears the BSS section, enters the  
; bl_start function. 
        PUBLIC Entry
Entry:
;
; Set up the Stack for Undefined mode
;
         MSR   cpsr_c, #MODE_UND|I_F_BIT       ; switch to undef  mode
         LDR   sp,=SFE(UND_STACK)             ; load the stack address
;
; Set up the Stack for abort mode
;        
         MSR   cpsr_c, #MODE_ABT|I_F_BIT       ; Change to abort mode
         LDR   sp,=SFE(ABT_STACK)	       ; load the stack address
;
; Set up the Stack for FIQ mode
;       
         MSR   cpsr_c, #MODE_FIQ|I_F_BIT       ; change to FIQ mode
         LDR   sp,=SFE(FIQ_STACK)	       ; load the stack address
;
; Set up the Stack for IRQ mode
;       
         MSR   cpsr_c, #MODE_IRQ|I_F_BIT       ; change to IRQ mode
         LDR   sp,=SFE(IRQ_STACK)              ; load the stack address
;
; Set up the Stack for SVC mode
;        
         MSR   cpsr_c, #MODE_SVC|I_F_BIT       ; change to SVC mode
         LDR   sp,=SFE(SVC_STACK)	       ; load the stack address
;
; Set up the Stack for USer/System mode
;      
         MSR   cpsr_c, #MODE_SYS|I_F_BIT       ; change to system mode
         LDR   sp,=SFE(CSTACK)                 ; load the stack address


;
; Clear the BSS section here
;

Clear_Bss_Section:
         LDR   r10,=__iar_data_init3
         BLX   r10
         MOV   r0, #0                          ; no arguments to main    
         MOV   r1, r0                          ; zero registers r0-r3 and fp
         MOV   r2, r0
         MOV   r3, r0
         MOV   r7, r0 
         MOV   r12, r0    

;
; Enter the bl_start function. 
;

Enter_BootLoader:
         LDR   r10,=bl_start                   ; Get the address of bl_start
         MOV   lr,pc                           ; Dummy return 
         BX    r10                             ; Branch to main 
         SUB   pc, pc, #0x08                   ; looping   

; End of the file
;
         END
    
