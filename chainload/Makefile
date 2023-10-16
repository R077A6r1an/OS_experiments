# -- Makefile for the chainload experiment -- #

all: Test-Kernel.elf

Test-Kernel.elf: boot.o Loadfile.o
	ld -o Test-Kernel.elf -T linker.ld boot.o Loadfile.o -melf_i386

boot.o:
	nasm -felf boot.asm

Loadfile.o: Loadfile.bin
	objcopy -I binary -O elf32-i386 Loadfile.bin Loadfile.o

Loadfile.bin:
	nasm -fbin raw.asm -o Loadfile.bin

clean:
	rm *.o
	rm *.bin
	rm *.elf

boot: Test-Kernel.elf
	qemu-system-x86_64 -kernel Test-Kernel.elf

.PHONY: all
.PHONY: boot
.PHONY: clean

.SILENT: all
.SILENT: Test-Kernel.elf
.SILENT: boot.o
.SILENT: Loadfile.o
.SILENT: Loadfile.bin
.SILENT: clean
.SILENT: boot
