# USRSIO
Atari 8-bit (400/800/XL/XE) 6502 Assembly Language routine to support calling SIO from Atari Basic via USR statement.

Assembled with ATASM, using WUDSN and Eclipse on Linux.

Files in this project:
- USRSIO.atr : ATR format disk image contaning DOS, BASIC and XEX files ready to run on an Atari 8-bit computer.
- usrsio.asm : 6502 Assembly code callable from Atari BASIC using the USR statement. The assembly code calls the OS SIO routine. USR statement should only specify the address of the assembly code, and pass no other arguments. See USRSIO.BAS for example usage.
- usrsio.xex : Object code produced by ATASM from usrsio.asm
- USRSIO.BAS : Example program in Atari BASIC to show how to call the assembly code.
- build\_atr\_disk.sh : Bash shell script to create an ATR file containing Atari DOS 2.5 and the example programs. Uses dir2atr from <https://www.horus.com/~hias/atari/#atarisio>




Return value

usrsio.asm returns 1 for success or the SIO error code for failure. If any parameters are passed, error 200 is returned and the OS SIO routine is not called. See page 238 of
<http://sdx.atari8.info/sdx_files/4.48/SDX448_User_Guide.pdf> for comprehensive list of standard error codes.
