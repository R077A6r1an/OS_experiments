# chainloading

This directory includes a experiment, where the file is loading another file and executing it.

This works as following:

The boot.asm file is loaded first by a multiboot compatible bootloader (such as grub), and will first get the address, where the second file (source in raw.asm) is stored in this loaded image. Then it copies the Loadfile.bin , pasted via objcopy in the main kernel binary, on the address the raw.asm file defines in the first line with `org 0xFFFFFF`. Then it begins executing on the load address at 0xFFFFFF, where the code will write on the screen via VGA `hello` in red, and after jumping back to the original kernel, the kernel will write via VGA at the end of the message `OK` in green.

## For what it serves?

Loading and then executing a binary file like this is required for exsample for getting in longmode, it is for exsample with qemu required to first load a file 32 bit file, for getting in longmode, and then executing the real 64 bit kernel in longmode.

## Run this exsample

Just execute `$ make boot`, and then make builds, and runs the output file in qemu.
