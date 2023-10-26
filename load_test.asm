[org 0x7c00] ; the origin everything will be relative to this address

; ; mov [BOOT_DRIVE], dl ;boot drive is stored in DL which is the lower byte of DX
; ; mov dl,[BOOT_DRIVE] ;boot drive is stored in DL which is the lower byte of DX
;
; ; mov bp, 0x8000 ;setup the stack. 8000 or 9000 ? 
; ; mov sp,bp 
;
mov bx,0x9000
mov es,bx

mov dh, 5 
mov dl, 0x0
mov ch, 0x0
mov cl,0x02

call disk_load

mov dx,[0x9000]  
call print_hex

mov dx,[0x9000 + 512]  
call print_hex

jmp $
; after loading disk we need to printout last address
%include "print_string.asm"
%include "disk_load.asm"
%include "print_hex.asm"

MSG db "trying to load floppy disk",0

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
