# USRSIO
Atari 8-bit (400/800/XL/XE) 6502 Assembly Language routine to support calling SIO from Atari Basic via USR statement.

Assembled with ATASM, using WUDSN and Eclipse on Linux.

Files in this project:
- USRSIO.atr : ATR format disk image contaning DOS, BASIC and XEX files ready to run on an Atari 8-bit computer.
- usrsio.asm : 6502 Assembly code callable from Atari BASIC using the USR statement. The assembly code calls the OS SIO routine.
- usrsio.xex : Object code produced by ATASM from usrsio.asm
- USRSIO.BAS : Example program in Atari BASIC to show how to call the assembly code.
- build_atr_disk.sh : Bash shell script to create an ATR file containing Atari DOS 2.5 and the example programs.
