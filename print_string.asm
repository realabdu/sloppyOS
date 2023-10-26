; NOT SO GOOD PRINT IMPLEMENTATION 
; print_string:
;     ; here we want to parse a string of charcters. and print each one of them.
;     pusha
;     mov si, bx; si is an index registers, we process arrays through it. bx is a string 
; .next_char:
;     mov al, [si] ; load next index
;     test al,al ; test if al is not the termination charcter
;     jz .done ; if yes, that means the string is done. so jump
;     int 0x10 ; if not, print it 
;     inc si
;     jmp .next_char ; jump to the next charcter
; .done:
;     popa 
;     ret
; BETTER IMPLEMENTATION THANKS TO THE INTERNET
print_string:     ; Push registers onto the stack
  pusha

string_loop:
  mov al, [bx]    ; Set al to the value at bx
  cmp al, 0       ; Compare the value in al to 0 (check for null terminator)
  jne print_char  ; If it's not null, print the character at al
                  ; Otherwise the string is done, and the function is ending
  popa            ; Pop all the registers back onto the stack
  ret             ; return execution to where we were

print_char:
  mov ah, 0x0e    ; Linefeed printing
  int 0x10        ; Print character
  add bx, 1       ; Shift bx to the next character
  jmp string_loop ; go back to the beginning of our loop
