; this is a boot sector, that helps booting a kernel in 32-bit protected mode.
[org 0x7c00]

KERNEL_OFFSET equ 0x1000 ;memory offset of which we will load our kernel

mov [BOOT_DRIVE], dl 

mov bp, 0x9000 ;setup the stack.
mov sp,bp 

mov bx, MSG_SWITCH_REALMODE
call load_kernel

call switch_to_pm

jmp $

;routines

% include "print_string.asm"
% include "gdt.asm"
% include "print_string_pm.asm"
% include "switch_to_pm.asm"

[bits 16]

load_kernel:
mov bx, MSG_LOAD_KERNEL
call print_string

mov bx, KERNEL_OFFSET
mov dh, 15
