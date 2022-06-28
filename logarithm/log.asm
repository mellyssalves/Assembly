%include "io.inc"
extern scanf
extern printf

section .data
scanfValue DB "%d"

section .bss
n resd 1
b resd 1
log resd 1

section .text

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    ; n / b e verif = 0
    ; toda vez q div inc
    
    ; scanf("%d", &n)
    
    push n
    push scanfValue 
    call scanf
    add esp,8
    
    push b
    push scanfValue 
    call scanf
    add esp,8
    
    mov eax, DWORD[n]
    mov ebx, DWORD[b]
    mov ecx, 0
    
    mov edx, 0
    
    .l1: ;label
    div ebx
    cmp eax, 0
    je .l2
    inc ecx
    jmp .l1
    
    .l2:
    mov eax, log
    mov [eax], ecx
    push ecx
    
    push scanfValue
    call printf
    add esp, 8
    
    xor eax, eax
    ret