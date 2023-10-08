;
; boot sctor program that loops forever. 
;



mov ah,0x0e ; indicate teletype scrolling bios routine mode 


mov al, the_secret
int 0x10

mov al, [the_secret]
int 0x10

mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

mov al, [0x7c1e]
int 0x10

mov al, hey
int 0x10
jmp $ ;jump to the current address ( this is the new infinte loop
;loop:                           define a label loop, and we will jump back to it forever ( infinite loop )
;    jmp loop
the_secret:
    db "X"

hey:
    db 'Booting OS',0

times 510-($-$$) db 0           ;tell the assembler to pad enough zeros (db 0), of 510 bytes to bring us to the last two 

dw 0xaa55                       ;magic number, that indicates this is the boot sector ( one word 16-bits )
