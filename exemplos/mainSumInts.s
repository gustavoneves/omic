#posições na stack
	.equ localSize,-16
	.equ inteiro1,-16
#constantes
	.section .rodata
formatoPrintInteiro:
	.string "%d\n"	
#programa
	.text
	.globl main
	.type main, @function
main:	
	pushq %rbp
	movq %rsp, %rbp
	addq $localSize, %rsp
		
	movl $42, %edi
	movl $10, %esi
	leaq inteiro1(%rbp), %rdx
	call sumInts

	movl inteiro1(%rbp), %esi	#copia o inteiro da pilha para rsi
	movq $formatoPrintInteiro, %rdi	#endereço da string de formatação em edi
	movq $0, %rax	#sem ponto flutuante
	call printf	#jump and link para printf
	
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
