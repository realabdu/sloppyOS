os-image: kernel.bin
	cat boot_sect.bin kernel.bin > os-image
	qemu-system-i386 os-image
kernel.bin: boot_sect.bin 
	i686-elf-gcc -ffreestanding -c kernel.c -o kernel.o
	i686-elf-ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
boot_sect.bin:boot_sect.asm 
	nasm boot_sect.asm -f bin -o boot_sect.bin

clean:
	rm -f boot_sect.bin kernel.bin os-image

