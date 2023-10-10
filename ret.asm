

mov al,'H'
call my_print_function



my_print_function:
pusha
mov ah,0x0e
int 0x10
popa
ret
