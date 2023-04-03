;autor: Claudia Chum

%include	'libreriaCadenas.asm'

SECTION .data
	msg1	db	'---- Menu ----', 0h
	msg2	db	'Ingrese una palabra', 0h
	msg3	db	'Palabra convertida: ', 0h

SECTION	.bss
	cadena	resb	100

SECTION	.text
	global _start

_start:
	mov	eax, msg1
	call	printStrln
	mov	eax, msg2
	call	printStrln
	mov	ebx, cadena
	call	InputStr
	mov	eax, msg3
	call	printStrln
	mov	eax, cadena
	push	eax
	call	strInvertir
	mov	eax, cadena
	call	printStrln
	call exit
