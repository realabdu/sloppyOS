ENTRY(kmain)
SECTIONS
{
    . = 0x1000; /* Kernel starts at 0x1000, based on your boot sector */

    .text : { *(.text) }
    .data : { *(.data) }
    .bss  : { *(.bss)  }
}

