###
#   Aluno: Gustavo Neves
###



#posicoes na stack
	.equ endLocal, -48
	.equ tamPrologo, -48
	
	.section .rodata
prompt:
	.string "Digite um inteiro: "

scanFormat:
	.string "%d"

printFormat:
	.string "Resultado %d\n"

msgErro:
    .string "Numero negativo\n"

	.text
	.globl main
	.type main, @function

main:
	pushq %rbp
    movq %rsp,%rbp
    addq $tamPrologo, %rsp

    movq %rdi, 0(%rbp)
    movq %rsi, -8(%rbp)
    movq %rdx, -16(%rbp)
    movq %rcx, -24(%rbp)
    movq %r8, -32(%rbp)

LOOP:
	movq $prompt, %rdi #endereco da string em edi
	movq $0, %rax	#0 em rax para ausência de argumentos em ponto flutuante
	call printf		#jump and link para printf

	leaq endLocal(%rbp), %rsi	#endereco do inteiro na pilha para rsi
	movq $scanFormat, %rdi #endereco da string em edi
	movq $0, %rax	#sem ponto flutuante
	call scanf	#jump and link para scanf

    leaq endLocal(%rbp), %rsi

    cmpb $0, (%rsi)            # se for negativo vai para o fim
    jl IMPRIME_MSG_ERRO

    movq $1, %rdi # 
    movq $1, %rdx #  
    movq $1, %rcx # contador
    movq $0, %r8

    cmpb $2, (%rsi)
    jb IMPRIME

FUNC:
    cmpq %rcx, (%rsi)
    je IMPRIME

    movq %rdi,%r8
    movq %rdx, %rdi
    addq %r8, %rdx
    addq $1,%rcx

    jmp FUNC

IMPRIME:
    movq %rdx, %rsi
	movq $printFormat, %rdi	#endereço da string de formatação em edi
	movq $0, %rax	#sem ponto flutuante
	call printf	#jump and link para printf
    jmp LOOP

FIM:
    movq 0(%rbp), %rdi
    movq -8(%rbp), %rsi
    movq -16(%rbp), %rdx
    movq -24(%rbp), %rcx
    movq -32(%rbp), %r8

	movl $0, %eax	#return 0
	movq %rbp, %rsp	#retornar a pilha para posição inicial
	popq %rbp		#retornar rbp para a posição inicial e pilha
	ret

IMPRIME_MSG_ERRO:
	movq $msgErro, %rdi	#endereço da string de formatação em edi
	movq $0, %rax	#sem ponto flutuante
    call printf
    jmp FIM
