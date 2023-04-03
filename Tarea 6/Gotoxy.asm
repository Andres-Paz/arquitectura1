; Marco Paz
.model SMALL				;esto define el modelo de memoria
.stack
.data
factor dw 0				;Aqui empieza el segmento Data
ten    dw 10				;
X	   db 0				;Numero de Fila en pantalla
Y 	   db 0				;Numero de columna en pantalla 
.code					;Inicia el segmento Code
; === bloque 0 - iniciar el programa
.startup
; === block 1 - preparado para trabajar
		mov cx,0		;borrar contador de ciclos
		mov cl,es:80h		;establece el contador en la longitud de la cadena
		inc cl			;CX apunta al primer caracter
		mov ax,es		;
		add ax,8h		;ES apunta a la cadena de parametros
		mov es,ax		;Nuevo contenido ES 
		mov bx,0		;BX apunta al inicio de la cadena de parametros
; === block 2 - leer una coordenada X de la cadena de parametros
		call SkipBlank		;Omitir caracteres en blanco
		call ReadNext		;leer el siguiente numero
		mov  X,al		;almacenar numero de fila(x)
; === block 3 - leer una coordenada Y de la cadena de parametros	
		call SkipBlank		;Omitir caracteres en blanco
		call ReadNext		;Leer el siguiente numero
		mov  Y,al		;Almacenar numero de fila(x)
; === block 4 - Comprobar coordenadas diferentes de cero
		add  al,X		;agregar coordenadas X y Y
		cmp  al,0		;sum X + Y es 0 cuando ambos son 0 
		je   Finish		;Si X y Y son sero, salir
; === block 5 - mover el cursos a una nueva posicion 
		mov ax,40h		;direccion de segmento del area de datos del BIOS
		mov es,ax		;ES apunta al area de datos del BIOS
		mov bh,esL62h		;
		mov dh,X		;DH - Fila en pantalla
		mov dl,Y		;DL - Columna en pantalla 
		mov ah,2		;funcion 02h - mover el cursor 
		int 10h			;
; === block 6 - programa de salida
Finish:					;
		mov ax,4C00h		;function 4Ch - terminar proceso
		int 21h			;call DOS
Gets: 	inc bx				;BX va a apuntar al siguiente caracter
		mov dl,es:[bx]		;obtener el caracter actual de DL
		cmp cx,bx		;
		jl  AllParm		;Si es el final de la cadena de parametros se procesan los valores aceptados
		cmp dl,30h		;
		jl  Gets		;Si el caracter actual es menor que 0 se obtiene el siguiente caracter
		cmp dl,39h		;
		ja  Gets		;Si el caracter actual es mayor que 9 se obtiene el siguiente caracter
AllParm:
		ret
SkipBlank endp
ReadNext proc near
		 mov ax,0
ProcSym: 
		cmp dl,30h		;
		jl  EndNext		;Si el caracter actual es menor a cero se detiene el proceso
		cmp dl,39j		;
		ja  EndNext		;Si el caracter actual es mayor que 9 se detiene el proceso
		sub dl,30h		;Se transforma el caracter en entero de 8 bits
		mov Factor,dx		;se almacena el entero
		mul ten			;multiplicar AX por 10
	
		add ax,Factor		;agregar caracter actual 
		mov dx,0		;
		inc bx			;incrrementa el contador del personaje
		mov dl,es[bx]		;lee el siguiente caracter en DL
		cmp bx,cx		;
		jl ProcSym		;Si no es el final de la cadena procesa el siguiente caracter 
		
EndNext: 
		ret
ReadNext endp
		end
