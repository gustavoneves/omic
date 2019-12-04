###
#   Aluno: Gustavo Neves
###
 
# 4) Crie uma funcao recursiva que recebe um valor n, e retorna o valor de n!. Crie um
#main em assembly do x86-64 para chamar a funcao. Voce pode utilizar as funcoes do C
#para E/S no seu programa.
 
    .equ tamPrologo, -32

    .section .rodata
prompt:
    .string "Digite um inteiro: "

stringScanf:
    .string "%d"

stringPrintf:
    .string "resultado: %d\n"


    .text
    .globl main
    .type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp
    addq $tamPrologo, %rsp

    movq %rdi, -8(%rbp)
    movq %rsi, -16(%rbp)
    movl %ecx, -24(%rbp)

    movq $prompt, %rdi
    movq $0, %rax
    call printf

    leaq -28(%rbp), %rsi
    movq $stringScanf, %rdi
    movq $0, %rax
    call scanf

    movl $1, %eax
    movl -28(%rbp), %ecx

FATORIAL:
    cmpl $0, %ecx
    je IMPRIME

    mull %ecx
    addl $-1, %ecx
    jmp FATORIAL

IMPRIME:
    movl %eax, %esi
    movq $stringPrintf, %rdi
    movq $0, %rax
    call printf

FIM:
    movq 8(%rbp), %rdi
    movq -16(%rbp), %rsi
    movl -24(%rbp), %ecx

    movq $0, %rax
    movq %rbp, %rsp
    popq %rbp
    ret
