###
#   Aluno: Gustavo Neves
###



#posicoes na stack
	.equ endLocal, -48
	.equ tamPrologo, -48
	
	.section .rodata
prompt:
	.string "Digite uma string: "

scanFormat:
	.string "%s"

printFormat:
	.string "Resultado %s\n"

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
	movq $scanFormat, %rdi #endereco da string em rdi
	movq $0, %rax	#sem ponto flutuante
	call scanf	#jump and link para scanf

    leaq endLocal(%rbp), %rsi

    movq %rsi, %rdx
    movq $2314885530818453536, %rax
    xor %rax, (%rdx)

    jmp IMPRIME

IMPRIME:
    movq %rdx, %rsi
	movq $printFormat, %rdi	#endereço da string de formatação em edi
	movq $0, %rax	#sem ponto flutuante
	call printf	#jump and link para printf

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
