SECTIONS
{
 /* For EV3: 0xC1000000 = RAM, for QEMU: 0x10000 = Start of Execution */
 . = 0xC1000000;
 .ro : {
  startup.o (.text)
  *(.text)
  *(.rodata)
 }
 .rw : {
  *(.data)
  *(.bss)
  *(COMMON)
 }
 . = ALIGN(8);
 heap_low = .; /* for _sbrk */
 . = . + 0x10000; /* 64 KB of heap memory */
 heap_top = .; /* for _sbrk */
 . = . + 0x10000; /* 64 KB of stack memory */
 stack_top = .; /* for startup.s */
}
