del /f bootloader.iso
del /f bootloader.bin

nasm -f bin -o bootloader.bin bootloader.asm

dd if=/dev/zero of=bootloader.iso count=2880

dd if=bootloader.bin of=bootloader.iso conv=notrunc

qemu-system-x86_64 -drive format=raw,file=bootloader.iso -L c:\qemu