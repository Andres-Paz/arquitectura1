; chrSearch examen final
; creaador: Marco
; fecha 28/04/2023
; operacion indicada sobre sus operandos

%include        'stdio32.asm'

SECTION .data
	msg	db	'----------- Bienvenido a chrSearch ----------', 0h
	msg1	db	'Escriba la cadena a utilizar: ', 0h
	msg2	db	'Ingrese el caracter a buscar: ', 0h
	msg3	db	'Numero de ocurrencias: ', 0h

SECTION .bss
	cadena		resb	100
	caracter	resb	100
	numeroDeVeces	resb	100

SECTION .text
	global	_start

_start:
;=========== imprimir mensaje de bienvenida =============
	mov	eax, msg
	call	printStrln
;============== imprimir mensaje de ingreso de cadena==============
	mov	eax, msg1
	call	printStrln

;========== input cadena desde la terminal =====================
	mov	eax, 100
	mov	ebx, cadena
	call	input
;=============== imprimir mensaje 2 ===============
	mov	eax, msg2
	call	printStrln

;============= input cadena 2 desde la terminal =======================
	mov	eax, 100
	mov	ebx, caracter
	call	input
;===================== llamada a la funcion chrSearch =================
	mov	eax, cadena
	mov	ebx, caracter
	mov	ecx, numeroDeVeces
	call	chrSearch

;============== imprimir mensaje del numero de ocurrencias ============
	mov	eax, msg3
	call	printStrln

;============= imprimir en pantalla la cadena concatenada ===========
	mov	eax, numeroDeVeces
	call	printInt

;============== salir del programa =============
	call	exit