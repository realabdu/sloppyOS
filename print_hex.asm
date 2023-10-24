print_hex:
    ; Input: AL = byte value to be printed
    ; Output: Hexadecimal representation printed to screen

    ; Save registers
    pusha

    ; Print higher nibble
    mov ah, 0x0E   ; Function 0Eh of int 10h: Teletype output
    shr al, 4      ; Shift right to get higher nibble
    call print_nibble

    ; Print lower nibble
    mov ah, 0x0E
    popa           ; Restore original AL value
    and al, 0x0F  ; Mask higher nibble
    call print_nibble

    ; Restore registers and return
    popa
    ret

print_nibble:
    ; Convert nibble in AL to ASCII
    cmp al, 0x0A
    jl .is_digit
    add al, 'A' - 0x0A
    jmp .done
.is_digit:
    add al, '0'
.done:
    int 0x10  ; Print character in AL
    ret
