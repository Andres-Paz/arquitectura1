;programa: Hola mundo
;autor: Claudia Chum
;Ingreso de datos

%include	'libreria.asm'

SECTION .data
	msgIngreso	db	'Ingrese su nombre: ', 0h
	msgSalida	db	'Hola ', 0h

SECTION .bss
	cadena:	resb	100

SECTION	.text
	global	_start

_start:
	mov	eax, msgIngreso	;ebx = msg = Direccion de la cadena (posicion de memoria)
	call	printStr
	mov	eax, 100
	mov	ebx, cadena
	call	InputStr
	mov	eax, msgSalida
	call	printStr
	mov	eax, cadena
	call	printStrln
	call	exit
