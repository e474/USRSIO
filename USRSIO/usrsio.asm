;
; usrsio.asm
;
; Call Atari 8-bit (400/800/XL/XE) OS 
; SIO routine from Basic or other high level language
; 
; 6502 code 
; (c) E474, 2019, United Kingdom
;
; Further examples are given in:
;  - Compute's Second Book of Atari
;  - AtariAge thread on calling Assembler code from Basic at:
;    - http://atariage.com/forums/blog/576/entry-13175-part-1-of-11-simple-assembly-for-atari-basic/
;
;
; USRSIO
;
; The return value for BASIC is the $0303 status byte, which is 
; copied into FR0
; If any parameters are passed, the routine returns 172 to BASIC
;
;
FR0 =  $D4					; FR0 $D4/$D5 Return value
SIOV = $E459				; OS SIO entry point

;	.OPT OBJ
	
	*=  $600
;
; Arbitrary start address, this is relocatable code, so can go in a string or memory
;

USRSIO
	PLA         			; argument count, should be 0
	BEQ CALL_SIO			; correct number of arguments, so call SIO

	ASL A					; convert number of (2 byte) arguments into byte count

	TAY
	
DISPOSE						; remove any arguments passed, as number should be 0
	PLA
	DEY
	BNE DISPOSE				; still bytes to remove from stack
	
	LDY #172				; 172 is next available BASIC error code, standard 
							; error codes are between 2 and 171 

	BNE RETURN_TO_BASIC		; always true, but better than a JMP as this code is
							; relocatable

CALL_SIO
	JSR SIOV				; assume $300 DCB set up OK in BASIC
	LDY $303				; need to preserve return value from SIO

RETURN_TO_BASIC				; return value in Y to BASIC
	STY FR0
	LDA #0 
	STA FR0+1
	RTS

	.END 
