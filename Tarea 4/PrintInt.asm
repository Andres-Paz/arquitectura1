;Imprimir datos enteros
;autor: Marco Paz

%include 	'libreria.asm'

SECTION .text
	global _start

_start:
	mov	eax, 143
	mov	ecx, 0
	call 	printIntln
	call	exit
