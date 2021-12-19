cd iso
copy ..\game.img .
mkisofs -b game.img -no-emul-boot -boot-load-seg 1984 -boot-load-size 4 -iso-level 2 -J -l -D -N -joliet-long -relaxed-filenames -V "MYOS" -o ../game.iso .
cd ..
qemu-system-i386 -cdrom game.iso -L c:\qemu