extern printf
extern scanf

section .data
formato DB "%d",0ah,0dh,0

tabela DB 1
DD Domingo
tamEntrada EQU ($ - tabela)
DB 2
DD Segunda
DB 3
DD Terca
DB 4
DD Quarta
DB 5
DD Quinta
DB 6
DD Sexta
DB 7
DD Sabado
tamTabela EQU ($ - tabela) / tamEntrada
msg1 DB "Domingo", 0
msg2 DB "Segunda-feira", 0
msg3 DB "Terça-feira", 0
msg4 DB "Quarta-feira", 0
msg5 DB "Quinta-feira", 0
msg6 DB "Sexta-feira", 0
msg7 DB "Sabado", 0

section .bss
entrada RESB 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    
    push entrada
    push formato
    call scanf
    add esp, 8
    
    mov ecx,tamTabela

    mov eax,tabela
l1:
    mov bl,[eax] ;primeiro conteudo da tabela (bx pq definimos como word)
    cmp [entrada],bl
    je imprime
    add eax, tamEntrada
    loop l1
    
imprime:
    call [eax+1] ;(+2 pq é word) -> (Endereço de eax + byte)
    push edx
    call printf
    pop edx
    ;PRINT_STRING [edx]

    xor eax, eax
    ret










Domingo:
mov edx, msg1
ret

Segunda:
mov edx, msg2
ret

Terca:
mov edx, msg3
ret

Quarta:
mov edx, msg4
ret

Quinta:
mov edx, msg5
ret

Sexta:
mov edx, msg6
ret

Sabado:
mov edx, msg7
ret