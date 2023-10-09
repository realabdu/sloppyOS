;
; boot sctor program that loops forever. 
;



mov ah, 0x0e ; indicate teletype scrolling bios routine mode 

mov bp, 0x8000 ; this will set the base of the stackk, a little above where the BIOS 
mov sp, bp ; this should mean that we load our boot sector, so it wont overwrite ??

push 'A' ; we push some characters, on the stack for later retreival, these are 16-bit values. as our stack is 16-bit stack
push 'B' 
push 'C'


pop bx ; pop to px
mov al, bl ; copy bl to al for printing
int 0x10

pop bx ; pop the next value 
mov al, bl ; copy bl to al for printing
int 0x10
; now we want to prove that our stack actually moves downward, so we are going to fetch the value of the base of the stack

mov al, [0x7ffe]
int 0x10

jmp $ ;jump to the current address ( this is the new infinte loop
;loop:                           define a label loop, and we will jump back to it forever ( infinite loop )
;    jmp loop
times 510-($-$$) db 0           ;tell the assembler to pad enough zeros (db 0), of 510 bytes to bring us to the last two 

dw 0xaa55                       ;magic number, that indicates this is the boot sector ( one word 16-bits )
