#posições na stack
	.equ	inteiro1, -4
	.equ	inteiro2, -8
	.equ	localSize, -16
	
	.section .rodata
prompt:
	.string "Digite um inteiro: "
scanFormat:
	.string "%i"
printFormat:
	.string	"O resultado da soma eh %i\n"

	.text
	.globl main
	.type main, @function
main:
	pushq %rbp	#salvar rbp
	movq %rsp,%rbp	#estabelecer novo frame pointer
	addq $localSize, %rsp	#alocar espaço na pilha

	movq $prompt, %rdi	#endereço da string em edi
	movq $0, %rax	#0 em rax para ausência de argumentos em ponto flutuante
	call printf	#jump and link para printf

	leaq inteiro1(%rbp), %rsi	#endereço do inteiro na pilha para rsi
	movq $scanFormat, %rdi #endereço da string em edi
	movq $0, %rax	#sem ponto flutuante
	call scanf	#jump and link para scanf

	movq $prompt, %rdi	#endereço da string em edi
	movq $0, %rax	#0 em rax para ausência de argumentos em ponto flutuante
	call printf	#jump and link para printf

	leaq inteiro2(%rbp), %rsi	#endereço do inteiro na pilha para rsi
	movq $scanFormat, %rdi #endereço da string em edi
	movq $0, %rax	#sem ponto flutuante
	call scanf	#jump and link para scanf

	movl inteiro1(%rbp), %esi	#copia o inteiro da pilha para esi
	addl inteiro2(%rbp), %esi	#soma inteiro2 com o valor em esi
	movq $printFormat, %rdi		#endereço da string de formatação em edi
	movq $0, %rax	#sem ponto flutuante
	call printf		#jump and link para printf

	movl $0, %eax	#return 0
	movq %rbp, %rsp	#retornar a pilha para posição inicial + 8
	popq %rbp		#retornar rbp para a posição inicial e pilha -8
	ret
