@echo off

fasm os/boot.asm build/boot.bin
if errorlevel 1 exit /b 1

i686-elf-g++ -ffreestanding -nostdlib -fno-rtti -c os/kernel/kernel.cpp -o build/kernel.o -fpermissive

rem -finstrument-functions
rem -finstrument-functions -finstrument-functions-exclude-file-list=os/kernel/cpu/trace.cpp
if errorlevel 1 exit /b 1

gcc os/kernel/kernel.cpp -o prep.cpp -E -fpermissive
gcc os/kernel/kernel.cpp -o prep.asm -S -fpermissive
if errorlevel 1 exit /b 1

i686-elf-ld -o build/kernel.bin -Ttext 0x10000 --oformat binary build/kernel.o
if errorlevel 1 exit /b 1

rem i686-elf-nm -nC text build/kernel.bin > kernel.syms


dd if=/dev/zero of=os.img bs=512 count=4096
if errorlevel 1 exit /b 1

dd if=build/boot.bin of=os.img bs=512 count=1 conv=notrunc
if errorlevel 1 exit /b 1

dd if=build/kernel.bin of=os.img bs=512 seek=1 conv=notrunc
if errorlevel 1 exit /b 1


qemu-system-i386 -drive format=raw,file=os.img -monitor stdio