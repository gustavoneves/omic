###
#   Aluno: Gustavo Neves
###

#   6) Crie uma funcao que recebe um inteiro e um ponteiro para uma string. A funcao deve
#   converter o inteiro para ASCII, escrevendo a string ASCII no endereco apontado pelo
#   ponteiro.

    .equ tamPrologo, -32

    .section .rodata
prompt:
    .string "Digite um inteiro: "

stringScanf:
    .string "%d"

stringPrintf:
    .string "resultado: %c\n"


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

IMPRIME:
    movl -28(%rbp), %esi
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
