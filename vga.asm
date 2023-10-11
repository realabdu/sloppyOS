[bits 32] ; switch to 32-bits protected mode. 

VIDEO_MEMORY equ 0xb8000 ; constant using equ ( this is at assembly time not runtine )
WHITE_ON_BLACK equ 0x0f ; constanct TODO: explore more 


mov ebx, HEY 
call print_string_pm_loop
print_string_pm_loop:
pusha
mov edx, VIDEO_MEMORY; we want to save the start of the video memeroy
    mov al, [ebx] ; store the char at ebx to al
    mov ah, WHITE_ON_BLACK ; store it in ah register

    test al,al
    je print_string_pm_done 
    mov [edx], ax ; store char at edx which is the video memeroy

    add ebx,1
    add edx,2
    jmp print_string_pm_loop

print_string_pm_done:
popa
ret 

HEY:
db 'hey abdo',0


jmp $

times 510-($-$$) db 0

dw 0xaa55
