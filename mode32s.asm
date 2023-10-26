[org 0x7c00] 
mov bp, 0x9000
mov sp,bp
mov ah, 0x0e
mov bx,MSG_REAL_MODE
call print_string

mov dx, 0x1fb7
call print_hex

call switch_to_pm
jmp $

%include "gdt.asm"
%include "print_string.asm"
%include "switch_to_pm.asm"
%include "print_string_pm.asm"
%include "print_hex.asm"
[bits 32]

BEGIN_PM:
mov ebx, MSG_PROT_MODE
call print_string_pm

jmp $

MSG_REAL_MODE db " started in 16-bit real mode",0
MSG_PROT_MODE db "landed in 32-bit protected mode",0

times 510-($-$$) db 0

dw 0xaa55
