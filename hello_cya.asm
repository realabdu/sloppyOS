; printing a string from a function 
[org 0x7c00] ; tell the assembler where to put this  code ( location counter ) 

mov ah, 0x0e ; indicate teletype scrolling bios routine mode 
mov bx, hello_msg ; using general purpose bx register as a parameter. 
call print_string ; calling the function 

mov bx, goodbye_msg ;again we use bx s parameter
call print_string ;call the function

jmp $ ; jump to this location indefinetly, ( infinte loop )
hello_msg:
db 'hello world ',0

goodbye_msg:
db 'good bye',0
%include  "print_string.asm" ; it's like importing external function
; regular boot_sector stuff


times 510-($-$$) db 0 ;zeros padding to make 521 byets.

dw 0xaa55
