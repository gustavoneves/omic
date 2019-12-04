#constantes
	.equ STDIN,0 
	.equ STDOUT,1
	.equ READ,0
	.equ WRITE,1
	.equ EXIT,60

#posicoes na pilha
	.equ aLetter,-16
	.equ tamPrologo,-16
	.equ charC1, -8
	.equ charC2, -4

	.section .rodata
prompt:
	.string	"Digite uma string: "
	.equ promptSz,.-prompt-1

primeiroChar:
	.string "Digite o caractere a ser substituido: "
	.equ tamPrimeiroChar,.-primeiroChar-1

segundoChar:
	.string "Digite o caractere 'substituidor': "
	.equ tamSegundoChar,.-segundoChar-1

	.text
	.globl __start
__start:
	pushq %rbp
	movq %rsp,%rbp
	
	movq $promptSz,%rdx #tamanho da string em rdx
	movq $prompt,%rsi #endereço da string em rsi
	movq $STDOUT,%rdi #id arquivo saída em rdi
	movl $WRITE, %eax #código syscall em rax
	syscall #chama o S.O.


### le o endereco da string
	movq $9, %rdx # le o endereco da string
	leaq aLetter(%rbp),%rsi #endereco onde salvar
	movq $STDIN, %rdi #id do arquivo de entrada em rdi
	movl $READ, %eax #codigo da syscall em rax
	syscall #chama o S.O.
###

    movq $tamPrimeiroChar,%rdx #tamanho da string em rdx
	movq $primeiroChar,%rsi #endereço da string em rsi
	movq $STDOUT,%rdi #id arquivo saída em rdi
	movl $WRITE, %eax #código syscall em rax
	syscall #chama o S.O.

### le o primeiro caractere c1
	movq $2, %rdx # le o primeiro caractere
	leaq charC1(%rbp),%rsi #endereco onde salvar
	movq $STDIN, %rdi #id do arquivo de entrada em rdi
	movl $READ, %eax #codigo da syscall em rax
	syscall #chama o S.O.
###


    movq $tamSegundoChar,%rdx #tamanho da string em rdx
	movq $segundoChar,%rsi #endereço da string em rsi
	movq $STDOUT,%rdi #id arquivo saída em rdi
	movl $WRITE, %eax #código syscall em rax
	syscall #chama o S.O.

### le o segundo caractere c2
	movq $2, %rdx # le o segundo caractere
	leaq charC2(%rbp),%rsi #endereco onde salvar
	movq $STDIN, %rdi #id do arquivo de entrada em rdi
	movl $READ, %eax #codigo da syscall em rax
	syscall #chama o S.O.	
###

#   %rdi end da string
 #   %esi caracter 1
 #   %edx caracter 2

    leaq aLetter(%rbp), %rdi
    movb charC1(%rbp), %sil
    movb charC2(%rbp), %dl

LOOP:
    cmpb $0, (%rdi)
    je FIM

    cmpb %sil,(%rdi)
    je SUBSTITUI

    addq $1, %rdi
    jmp LOOP

SUBSTITUI:
    movb %dl, (%rdi)
    addq $1, %rdi
    jmp LOOP

FIM:
    movq $8, %rdx
    leaq aLetter(%rbp), %rsi
 	movq $STDOUT,%rdi
	movl $WRITE,%eax
	syscall

    movq %rbp,%rsp 
	popq %rbp 
	movq $0, %rdi
	movl $EXIT,%eax
	syscall
