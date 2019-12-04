#constantes
	.equ STDIN,0 
	.equ STDOUT,1
	.equ READ,0
	.equ WRITE,1
	.equ EXIT,60
#posições na stack
	.equ aLetter,-16
	.equ localSize,-16

	.section .rodata
prompt:
	.string	"Digite um caractere: "
	.equ promptSz,.-prompt-1
msg:
	.string "Voce digitou: "
	.equ msgSz,.-msg-1

	.text
	.globl __start
__start:
	pushq %rbp
	movq %rsp,%rbp
	addq $localSize,%rsp #final do prólogo

	movq $promptSz,%rdx #tamanho da string em rdx
	movq $prompt,%rsi #endereço da string em rsi
	movq $STDOUT,%rdi #id arquivo saída em rdi
	movl $WRITE, %eax #código syscall em rax
	syscall #chama o S.O.

	movq $2,%rdx #ler um caractere+\n
	leaq aLetter(%rbp),%rsi #endereço onde salvar
	movq $STDIN, %rdi #id do arquivo de entrada em rdi
	movl $READ, %eax #código da syscall em rax
	syscall #chama o S.O.

	movq $msgSz,%rdx #tamanho da string em rdx
	movq $msg,%rsi #endereço da string em rsi
	movq $STDOUT,%rdi #id do arquivo de saída em edi
	movl $WRITE,%eax #código da syscall em rax
	syscall #chama o S.O.

	movq $2, %rdx #escrever 2 caracteres
	leaq aLetter(%rbp),%rsi #endereço dos caracteres
	movq $STDOUT,%rdi #id do arquivo de saída em rdi
	movl $WRITE,%eax #código da syscall em rax
	syscall #chama o S.O.

	movq %rbp,%rsp #restaura a pilha
	popq %rbp #restaura o stack pointer
	movq $0, %rdi #valor que será retornado ao S.O.
	movl $EXIT,%eax #código da syscall exit em rax
	syscall #syscall para terminar o programa
