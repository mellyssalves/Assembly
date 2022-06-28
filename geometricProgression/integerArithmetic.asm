%include "io.inc"

extern scanf ;bib padrao C
extern printf ;bib padrao C

section .data
scanfValue DB "%d"

section .bss
a resd 1
q resd 1
n resd 1
res resd 1 ;variavel p/ guardar result

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ; res = (a(eax^n - 1)) /  ecx
    
    ;c: scanf("%d", &a);
    ;assembly: direita p/ esquerda
    
    push a
    push scanfValue ;%d
    call scanf ;chamando func scanf
    add esp,8 ;esvaziando pilha (cada push 4b)
    
    push q
    push scanfValue ;%d
    call scanf ;chamando func scanf
    add esp,8 ;esvaziando pilha (cada push 4b)
    
    mov eax, DWORD[q]
    mov ecx, 9
    
    ; eax^n
    l1:
        mul DWORD[q]
        loop l1
        
    
    ; a(eax-1)/(q-1)
    dec eax
    mov ebx, DWORD [q]
    dec ebx
    mul DWORD[a]
    div ebx
    
    push eax
    push scanfValue
    call printf
    add esp, 8

    
   
   
    ret