[org 0x7c00]

mov dx, 0x1fb7
mov ah,0x0e
call print_hex
%include "print_hex.asm"
%include "print_string.asm"
jmp $

times 510-($-$$) db 0
dw 0xaa55

