print_string:
    ; here we want to parse a string of charcters. and print each one of them.
    pusha
    mov si, bx; si is an index registers, we process arrays through it. bx is a string 
.next_char:
    mov al, [si] ; load next index
    test al,al ; test if al is not the termination charcter
    jz .done ; if yes, that means the string is done. so jump
    int 0x10 ; if not, print it 
    inc si
    jmp .next_char ; jump to the next charcter
.done:
    popa 
    ret

