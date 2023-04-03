;  Libreria stdio 32 bits
;  ---------- funcion longitud de cadena-------
;  void strlen(cadena)
strlen:
	push 	ebx
	mov 	ebx, eax
siguiente:
	cmp	byte[eax], 0
	jz	finConteo
	inc	eax
	jmp	siguiente

	finConteo:
	sub	eax, ebx
	pop	ebx
	ret

;--------Despligue en pantalla------
;void printStr(cadena)
printStr:
	push 	edx
	push	ecx
	push	ebx
	push	eax
	
	call	strlen
	mov 	edx, eax
	pop	eax
	mov	ecx, eax
	mov	ebx, 1
	mov	eax, 4
	int	80h

	pop	ebx
	pop 	ecx
	pop 	edx
	ret

;------Despligue con salto de linea-----
;void printStrln(cadena)
printStrln:
	call	printStr

	push	eax
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	printStr
	pop 	eax
	pop	eax
	ret

;------InputStr(cadena)-----
; void InputStr(cadena)
InputStr:
	push 	edx
	push	ecx
	push	ebx
	push	eax


	mov	edx, eax
	mov	ecx, ebx
	mov	ebx, 0
	mov	eax, 3
	int	80h


	pop 	eax
	pop	ebx
	pop	ecx
	pop 	edx
	ret

;------InputInt(cadena)-----
;void printInt(cadnea)
printInt:
	push	edx
	push	ecx
	push	ebx
	push	eax

cicloDiv:

	inc	ecx
	mov 	esi, 10
	mov	edx, 0
	idiv	esi
	add	edx, 48
	push	edx
	cmp	eax, 0
	jnz	cicloDiv

cicloPrint:

	dec	ecx
	mov	eax, esp
	call 	printStr
	pop	eax
	cmp	ecx, 0
	jnz	cicloPrint

	mov	eax, 03
	push	eax
	mov	eax, esp
	call	printStr
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret


;------InputInt(cadena)-----
;void printIntln(cadnea)
printIntln:
	push	edx
	push	ecx
	push	ebx
	push	eax

cicloDiv2:

	inc	ecx
	mov 	esi, 10
	mov	edx, 0
	idiv	esi
	add	edx, 48
	push	edx
	cmp	eax, 0
	jnz	cicloDiv2

cicloPrint2:

	dec	ecx
	mov	eax, esp
	call 	printStr
	pop	eax
	cmp	ecx, 0
	jnz	cicloPrint2

	mov	eax, 03
	push	eax
	mov	eax, esp
	call	printStrln
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret
;--Salida del programa

;============== Funcion convertir ascii a decimal ============
;void convertir(cadena)
asciidecimal:
	push	ecx
	push 	esi
	push	ebx

	mov	esi, eax		;eax = 15 20 +
	mov	eax, 0
	mov 	ecx, 0
	mov	edi, 0


convertidor:
	mov 	ebx, 0			;bx, ebx, bl apuntan a la misma direccion
	mov 	bl, [esi + ecx]		;bl es char
	cmp	bl, 10
	je	fin
	cmp 	bl, 0
	je 	fin
	cmp	bl, 48		;48 es cero en ascii, saltar si bl es menor a cero
	jl	error
	cmp	bl, 57		;57 es nueve en ascii, saltar si bl es mayor a 9
	jg	error
	sub	bl, 48		;bl= 49(1) - 48 entonces bl=1 ; segundavuelta = 53(5) - 48 = 5
	add	eax, ebx	;eax = eax + ebx entonces eax = 0+1 entonces eax = 1 	; segundavuelta= eax=10 + 5 = 15
	mov	ebx, 10		; ebx = 10
	mul	ebx		;eax = eax * ebx entonces eax = 1 * 10 entonces eax= 10		;segundavuelta = eax = 15 * 10 = 150
	inc 	ecx		;ecx = 0+1, inc entonces exc = 1 entonces es como esc++
	jmp	convertidor

error:
	mov	edi, 1
	jmp	salirconvertidor

fin:
	mov 	ebx, 10
	div	ebx
	jmp	salirconvertidor

salirconvertidor:
	pop	ebx
	pop	esi
	pop	ecx

	ret
; void exit
exit:

	mov	ebx, 0
	mov	eax, 1
	int	80h
