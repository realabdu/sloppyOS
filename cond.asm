

mov bx,3

cmp bx,4
jle first_b 
cmp bx, 40
jl second_b 
jmp third_b

first_b:
mov al,'A'
second_b:
mov al,'B'
third_b:
mov al,'C'

mov ah, 0x0e
int 0x10

jmp $ ; infinite loop

; padding with zeros
times 510-($-$$) db 0

dw 0xaa55

; magic number at the boot sector
