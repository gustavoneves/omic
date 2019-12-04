###
#   Aluno: Gustavo Neves
###



# valores ascii: A-Z 65 a 90  para minusculo(+32)
####        Estrutura da pilha
#
#   %rdi   0 - 7
#   %rsi   8 - 15
#   %rdx   16 - 23
#   %rcx   24 - 31
#   caracteres lidos 32 - 48
###

    .equ tamPrologo,-48
    .equ toMinusculo,32

    .text
    .type main, @function
    .globl funcMinusculo
    .type funcMinusculo, @function

funcMinusculo:
	pushq %rbp
	movq %rsp,%rbp
    addq $tamPrologo, %rsp

 #   movq %rdi, 0(%rbp)
 #   movq %rsi, -8(%rbp)
 #   movq %rdx, -16(%rbp)
 #   movq %rcx, -24(%rbp)

    movq %rsi, tamPrologo(%rbp)

    leaq tamPrologo(%rbp), %rsi

LEITURA:
    cmpq $0,%rdi
    je END

    cmpb $0,(%rsi)                 # Se o caracter lido for o \0 termina a leitura
    je END

    addq $-1, %rdi

    cmpb $91,(%rsi)            # Se o caracter lido for maior que 91 nao altera
    jb MENOR_q91
    addq $1, %rsi
    jmp LEITURA
  
MENOR_q91:
    cmpb $64,(%rsi)              # Se o caracter lido for menor que 64 nao altera
    ja MINUSCULO
    addq $1, %rsi
    jmp LEITURA


MINUSCULO:
    addl $toMinusculo,(%rsi)        # passa o caracter lido para maiusculo
    addq $1, %rsi
    jmp LEITURA

END:
    movq $0,%rax

   # movq 0(%rbp), %rdi
   # movq -8(%rbp), %rsi
   # movq -16(%rbp), %rdx
   # movq -24(%rbp), %rcx

	movq %rbp,%rsp              # restaura a pilha
	popq %rbp                   # restaura o stack pointer
    ret

