ENTRY(_start)

SECTIONS {
  . = 0x00000000;
  .text : { *(.text) }
  .rodata : { *(.rodata) }
  .data : { *(.data) }
  .bss : { *(.bss COMMON) }

  . = ALIGN(4);
  . = . + 0x1000;   /* 4KB stack */
  _stack_top = .;
}
