cd iso
copy ..\bootloader.img .
mkisofs -b bootloader.img -no-emul-boot -boot-load-seg 1984 -boot-load-size 4 -iso-level 2 -J -l -D -N -joliet-long -relaxed-filenames -V "MYOS" -o ../bootloader.iso .
cd ..