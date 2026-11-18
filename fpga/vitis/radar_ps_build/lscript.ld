ENTRY(_vector_table)
MEMORY
{
  ps7_ddr_0 (rwx) : ORIGIN = 0x00100000, LENGTH = 0x3FF00000
}
SECTIONS
{
  .text : { KEEP(*(.vectors)) *(.text*) *(.rodata*) } > ps7_ddr_0
  .init : { KEEP(*(.init)) } > ps7_ddr_0
  .fini : { KEEP(*(.fini)) } > ps7_ddr_0
  .preinit_array : { KEEP(*(.preinit_array*)) } > ps7_ddr_0
  .init_array : { KEEP(*(.init_array*)) } > ps7_ddr_0
  .fini_array : { KEEP(*(.fini_array*)) } > ps7_ddr_0
  .ARM.extab : { *(.ARM.extab*) } > ps7_ddr_0
  .ARM.exidx : { *(.ARM.exidx*) } > ps7_ddr_0
  .mmu_tbl ALIGN(0x4000) : { KEEP(*(.mmu_tbl)) } > ps7_ddr_0
  .data : { *(.data*) } > ps7_ddr_0
  .bss (NOLOAD) : { __bss_start__ = .; *(.bss*) *(COMMON); __bss_end__ = .; } > ps7_ddr_0
  .heap (NOLOAD) : { . = ALIGN(16); _heap_start = .; . += 0x20000; _heap_end = .; } > ps7_ddr_0
  .stack (NOLOAD) : { . = ALIGN(16); . += 0x10000; _stack_end = .; __stack = _stack_end; __irq_stack = _stack_end; __supervisor_stack = _stack_end; __abort_stack = _stack_end; __fiq_stack = _stack_end; __undef_stack = _stack_end; } > ps7_ddr_0
}
