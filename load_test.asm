[org 0x7c00] ; the origin everything will be relative to this address

mov [BOOT_DRIVE], dl ;boot drive is stored in DL which is the lower byte of DX
; ; mov dl,[BOOT_DRIVE] ;boot drive is stored in DL which is the lower byte of DX
;
mov bp, 0x8000 ;setup the stack. 8000 or 9000 ? 
mov sp,bp 
;
mov bx,0x9000
mov dh, 5 
mov dl, [BOOT_DRIVE] 
[bits 16]
call disk_load

call switch_to_pm
mov dx,[0x9000]  
call print_hex

mov dx,[0x9000 + 512]  
call print_hex
;
[bits 32]
BEGIN_PM:
mov ebx, MSG
call print_string_pm

jmp $
; after loading disk we need to printout last address
%include "print_string.asm"
%include "switch_to_pm.asm"
%include "print_string_pm.asm"
%include "gdt.asm"
%include "disk_load.asm"
%include "print_hex.asm"

BOOT_DRIVE db 0
MSG db "hey",0
times 510-($-$$) db 0
dw 0xaa55
;
; times 256 dw 0xdada
; times 256 dw 0xface
