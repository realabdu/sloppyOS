print_hex:
    ; Save registers
    pusha
    mov cx,4 ;counter to print 4 chars
    ; full hex values lives in dx register

char_loop:
    dec cx ; dec one step ( one char )
    mov ax,dx ; move dx to ax to save it later 
    shr dx,4 ;shift right by 4 bits
    and ax,0xf ; to get the last 4 bits

    mov bx,HEX_OUT
    add bx,2
    add bx,cx ; set the current counter to our address

    cmp ax,0xa ; if it's a number we need to convert it to letter
    jl set_letter
    add al,0x27

    jl set_letter

set_letter:
;adding 0x30 will convert number to letter 
    add al, 0x30
    mov byte [bx],al  ; Add the value of the byte to the char at bx

    cmp cx,0          ; check the counter, compare with 0
    je print_hex_done ; if the counter is 0, finish
    jmp char_loop     ; otherwise, loop again

print_hex_done:
    mov bx, HEX_OUT   ; print the string pointed to by bx
    call print_string

    popa              ; pop the initial register values back from the stack
    ret               ; return the function

HEX_OUT: db '0x0000', 0
