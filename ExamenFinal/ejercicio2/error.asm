SECTION .data
    param_limit         db      "Has enviado mas parametros de los esperados, debes usar ./calc NUM OP NUM", 0H
    lexical_error       db      "Revisa que los tokens sean validos, simbolos validos [0-9] (+, -, x, /)", 0H
    syntax_error        db      "El orden en que has ingresado los valores no es valido, el orden esperado es NUMERO OPERADOR NUMERO", 0H
    arith_error         db      "No se puede dividir por 0", 0H

SECTION .bss

SECTION .text

; imprime el error de los parametros
disp_param_err:
    mov     eax, param_limit
    call    display_error
    ret

; imprime el error lexico
disp_lex_err:
    mov     eax, lexical_error
    call    display_error
    ret

; imprime el error sintactico
disp_synt_err:
    mov     eax, syntax_error
    call    display_error
    ret

disp_arith_err:
    mov     eax, arith_error
    call    display_error
    ret

; imprime el error enviado en eax
display_error:
    call        println
    call        sys_exit