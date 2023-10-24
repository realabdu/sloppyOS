[org 0x7c00] ; the origin everything will be relative to this address

mov [BOOT_DRIVE], dl ;boot drive is stored in DL which is the lower byte of DX
mov ah,0x0e

mov bp, 0x8000 ;setup the stack. 8000 or 9000 ? 
mov sp,bp 

mov bx,0x9000
mov dh,5 ; we are loading 5 sectors HOPE IT'S ENOUGH
mov dl,[BOOT_DRIVE] ; floppydisk
call disk_load

mov dx,[0x9000]  
call print_hex

mov dx,[0x9000 + 512]  
call print_hex

; after loading disk we need to printout last address
%include "print_string.asm"
%include "disk_load.asm"
%include "print_hex.asm"
jmp $

MSG db "trying to load floppy disk",0
BOOT_DRIVE db 0x00 ;this means we are loading from floppy disk 
times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
