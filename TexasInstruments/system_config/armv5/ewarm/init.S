;******************************************************************************
;
; init.S - Init code routines
;
; Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
; All rights reserved.
;
;******************************************************************************

	MODULE EXCEPTIONS
;****************************** Global Symbols*********************************
        PUBLIC Entry
        IMPORT start_boot      
        IMPORT __iar_data_init3
        
        SECTION IRQ_STACK:DATA:NOROOT(3)
        SECTION FIQ_STACK:DATA:NOROOT(3)
        SECTION SVC_STACK:DATA:NOROOT(3)
        SECTION ABT_STACK:DATA:NOROOT(3)
        SECTION UND_STACK:DATA:NOROOT(3)
        SECTION CSTACK:DATA:NOROOT(3)
        SECTION SYSTEMSTART:CODE (4)
;************************ Internal Definitions ********************************

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
; Clear the BSS section here. Use IAR library functions to init data sections.
; Do so because the linker script is not friendly enough for access this section
;
         LDR   r10,=__iar_data_init3
         BLX   r10

;
; Enter the start_boot function. The execution still happens in system mode
;
Enter_main:
         LDR   r10,=start_boot		       ; Get the address of start_boot
         MOV   lr,pc                           ; Dummy return 
         BLX    r10                             ; Branch to start_boot
         SUB   pc, pc, #0x08                   ; looping   

;
; End of the file
;
         END    
    



