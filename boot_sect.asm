; this is a boot sector, that helps booting a kernel in 32-bit protected mode.
[org 0x7c00]

KERNEL_OFFSET equ 0x9000 ;memory offset of which we will load our kernel
mov [BOOT_DRIVE], dl ;to save the value of dl register, which is the boot drive


mov bp, 0x8000 ;setup the stack.
mov sp,bp 

mov bx, MSG_SWITCH_REALMODE ;printing message that we are starting in 16-bit realmode
call print_string

call load_kernel ;loading kernel routine from disk

call switch_to_pm ;switch to 32-bit protected mode 

jmp $
; booting problem is probaby that i am not fetching enough sectors.
;routines
%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"
%include "disk_load.asm"
%include "print_hex.asm"
[bits 16]

load_kernel:
; mov bx, MSG_LOAD_KERNEL ;print that we are loading into 32-bit protected mode 
; call print_string
;
; mov bx, KERNEL_OFFSET ;parameters for disk_load routine so that we load the first 15 sectors
mov bx, 0x9000 ;parameters for disk_load routine so that we load the first 15 sectors
mov dh, 0x01            ; from the boot disk which is our kernel code, to address KERNEL_OFFSET
mov dl, [BOOT_DRIVE]
call disk_load
mov dx, [ 0x9000 ]
call print_hex
mov dx, [ 0x9000 + 512 ]
call print_hex
ret

[bits 32]
;after switching to 32-bit protected mode we arrive here 
BEGIN_PM:
; mov ebx, MSG_PROT_MODE
; call print_string_pm

; call KERNEL_OFFSET ;now we jump to the address of our loaded kernel code.
jmp $ ;we hang and hoping that kernel is loaded

BOOT_DRIVE db 0
MSG_PROT_MODE db "switched to 32-bits protected mode",0
MSG_SWITCH_REALMODE db "loading in  16-bits realmode",0
MSG_LOAD_KERNEL db "loading kernel", 0

times 510-($-$$) db 0
dw 0xaa55
