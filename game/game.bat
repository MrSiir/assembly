@echo off
del /f game.img
del /f game.bin

nasm -f bin -o game.bin game.asm

dd if=/dev/zero of=game.img count=2880

dd if=game.bin of=game.img conv=notrunc

qemu-system-x86_64 -drive format=raw,file=game.img -L c:\qemu