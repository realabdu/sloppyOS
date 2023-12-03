os-image: kernel.bin
	cat boot_sect.bin kernel.bin > os-image.bin
	dd if=os-image.bin of=os-image.flp
	# qemu-system-x86_64 -fda os-image -boot a #boot from floppydisk
	qemu-system-x86_64 -drive file=os-image.flp,format=raw,if=floppy #boot from floppydisk
kernel.bin: boot_sect.bin 
	nasm kernel.asm -f bin -o kernel.bin
	# i686-elf-gcc -ffreestanding -c kernel.c -o kernel.o
	# i686-elf-ld -o kernel.bin -Ttext 0x9000 kernel.o --oformat binary
boot_sect.bin:load_test.asm
	nasm load_test.asm -f bin -o boot_sect.bin
clean:
	rm -f boot_sect.bin kernel.bin os-image

# boot_sect.bin: load_test.asm disk_load.asm
# 	nasm load_test.asm -f bin -o boot_sect.bin
# 	qemu-system-x86_64 -fda boot_sect.bin -boot a #boot from floppydisk
# 	
# clean:
# 	rm -f boot_sect.bin 
