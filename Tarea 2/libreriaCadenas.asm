;Libreria para manejo de cadenas

%include	'libreria.asm'

;--------------------funcion para convertir la cadena ingresada a mayusculas--------------------
strUpcase:
	push	ebx
	push	eax
	mov	ebx, eax

comparadorMayusculas:
	cmp	byte[ebx], 0
	jz	finComparadorMay
	cmp	byte[ebx], 32
	je	espacioMay
	cmp	byte[ebx], 'z'
	jg	espacioMay
	cmp	byte[ebx], 'a'
	jge	convertirMay
	inc	ebx
	jmp	comparadorMayusculas

convertirMay:
	sub	byte[ebx], 32
	inc	ebx
	jmp	comparadorMayusculas

espacioMay:
	inc	ebx
	jmp	comparadorMayusculas

finComparadorMay:
	call	printStrln
	pop	ebx
	pop	eax
	int	80h
	ret

;--------------------funcion para convertir la cadena ingresada a minusculas--------------------
strLocase:
	push	ebx
	push	eax
	mov	ebx, eax

comparadorMinusculas:
	cmp	byte[ebx], 0
	jz	finComparadorMin
	cmp	byte[ebx], 32
	je	espacioMin
	cmp	byte[ebx], 'A'
	jl	espacioMin
	cmp	byte[ebx], 'Z'
	jle	convertirMin
	inc	ebx
	jmp	comparadorMinusculas

convertirMin:
	add	byte[ebx], 32
	inc	ebx
	jmp	comparadorMinusculas

espacioMin:
	inc	ebx
	jmp	comparadorMinusculas

finComparadorMin:
	call	printStrln
	pop	ebx
	pop	eax
	int	80h
	ret

;--------------------funcion para invertir la cadena--------------------
strInvertir:
	push	ebp
	mov	ebp, esp
	mov	eax, [ebp + 8]

cadenaEnPila:
	mov	bl, byte[eax]
	cmp	bl, 0
	jz	finCadenaEnPila

	push	bx
	inc	eax
	jmp	cadenaEnPila

finCadenaEnPila:
	mov	eax, [ebp + 8]
	jmp	invertirCadena

invertirCadena:
	pop	bx
	mov	byte[eax], bl
	cmp	bl, 0
	jz	finInvertirCadena
	inc	eax
	jmp	invertirCadena

finInvertirCadena:
	leave
	ret
