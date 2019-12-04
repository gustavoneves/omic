# 4.Crie uma função que retorna o enésimo número da sequência de Fibonacci. Considere que N é passado
#    como parâmetro. Crie um main em assembly que pede o valor de N para o usuário repetidas vezes, e chama
#    a função de Fibonacci passando esse valor de N. O programa deve exibir o número retornado pela função na
#    tela. O programa termina quando o usuário digitar um valor negativo para N.

#constantes
    .equ STDIN,0                                    
    .equ STDOUT,1
    .equ READ,0
    .equ WRITE,1
    .equ EXIT,60

    .equ tamPrologo,-32
    .equ toMaiusculo,-32

   .section .rodata
msgErro:
    .string "Numero negativo\n"
    .equ tamMsgErro,.-msgErro-1

    .text
    .globl __start

__start:
    pushq %rbp
    movq %rsp,%rbp
    addq $tamPrologo, %rbp

    movq %rdi, 0(%rbp)
    movq %rsi, -8(%rbp)
    movq %rdx, -16(%rbp)
    movq %rcx, -24(%rbp)

FUNC:
    movq $3,%rdx                 # ler um caracter + \n
    leaq tamPrologo(%rbp),%rsi   # endereco onde salvar
    movq $STDIN, %rdi            # id do arquivo de entrada em rdi
    movl $READ, %eax             # codigo da syscall em rax
    syscall                      # chama o S.O.

    cmpb $45,(%rsi)  # se for negativo vai para o FIM
    je IMPRIME_MSG_ERRO

    addl $-48,(%rsi) # converto de ascii para decimal
    cmpb $2,(%rsi)
    jb MENOR_q2

    jmp IMPRIME

MENOR_q2:
    movl $1,(%rsi)

IMPRIME:
    addl $48,(%rsi)  # converto de decimal para ascii
    movq $3, %rdx             # escreve o caracter + \n
	leaq tamPrologo(%rbp),%rsi  # endereço dos caracteres
	movq $STDOUT,%rdi           # id do arquivo de saida em rdi
	movl $WRITE,%eax            # codigo da syscall em rax
	syscall                     # chama o S.O.

FIM:
    movq 0(%rbp), %rdi
    movq -16(%rbp), %rsi
    movq -32(%rbp), %rdx
    movq -48(%rbp), %rcx

	movq %rbp,%rsp              # restaura a pilha
	popq %rbp                   # restaura o stack pointer
	movq $0, %rdi               # valor que sera retornado ao S.O.
	movl $EXIT,%eax             # codigo da syscall exit em rax
	syscall                     # syscall para terminar o programa


IMPRIME_MSG_ERRO:
    movq $tamMsgErro, %rdx
    movq $msgErro,%rsi
    movq $STDOUT, %rdi
    movl $WRITE, %eax
    syscall
    jmp FIM
