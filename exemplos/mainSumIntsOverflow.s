#posições na stack
	.equ localSize,-16
	.equ inteiro1,-16
#constantes
	.section .rodata
formatoPrintInteiro:
	.string "%d\n"
strOverflow:
	.string "Overflow"
#programa
	.text
	.globl main
	.type main, @function
main:	
	pushq %rbp
	movq %rsp, %rbp
	addq $localSize, %rsp
		
	#movl $0x7FFFFFFF, %edi
	#movl $0x7FFFFFFF, %esi
	movl $10, %edi
	movl $20, %esi
	leaq inteiro1(%rbp), %rdx
	call sumInts

	cmp $0, %rax	#verifica o retorno de sumInts
	jne imprimeOverflow
	movl inteiro1(%rbp), %esi	#copia o inteiro da pilha para rsi
	movq $formatoPrintInteiro, %rdi	#endereço da string de formatação em edi
	movq $0, %rax	#sem ponto flutuante
	call printf	#jump and link para printf
	jmp saidaBranch
imprimeOverflow:
	movq $strOverflow, %rdi	#end. string overflow
	call puts	#imprime a string via puts
saidaBranch:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
