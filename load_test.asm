[org 0x7c00] ; the origin everything will be relative to this address

mov [BOOT_DRIVE], dl ;boot drive is stored in DL which is the lower byte of DX

mov ax, [BOOT_DRIVE] ; move boot drive value to register to be printned
call print_string

