; load from driver DL

disk_load:
push dx ;store dx on the stack so we can retrieve it later
mov ah, 0x02 ;bios read sector function
mov al,dh    ;read DH sectors
mov ch, 0x00 ;select cylinder 0
mov dh, 0x00 ;select head 0
mov cl, 0x02 ;start reading from second sector 

int 0x13 ;bios intrrupt

jc disk_error ; jump to this if error


pop dx ; get back dx from the stack
cmp dh,al : if al (sector read) != DH (sector expected)
jne disk_error ; display error messsage 


disk_error:
mov bx, DISK_ERROR
call print_string ; cause this is still 16-bits realmode 
jmp $

DISK_ERROR db "disk read error !",0
