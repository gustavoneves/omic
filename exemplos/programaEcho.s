#constantes
	.equ STDIN, 0
	.equ STDOUT, 1
#posições na STACK
	.equ aLetter, -16
	.equ localSize, -16

	.section .rodata
prompt:
	.string "Entre com o caractere: "
	#o tamamho da mensagem é o tamanho da string -1
	.equ promptSz,.-prompt-1
msg:
	.string "Voce entrou: "
	.equ msgSz,.-msg-1

	.text
	.globl main
	.type main, @function
main:
	pushq %rbp				#salvar o frame pointer do caller
	movq %rsp, %rbp			#setar o frame pointer do main
	addq $localSize, %rsp	#ajustar a pilha
	
	movl $promptSz, %edx	#tamanho da string em edx
	movl $prompt, %esi		#endereço da string em esi
	movl $STDOUT, %edi		#stdout em edi
	call write				#syscall para função write

	movl $2, %edx		#ler 1 caractere + \n
	leaq aLetter(%rbp), %rsi	#calcular o endr de aLetter e armazenar em rsi
	movl $STDIN, %edi	#stdin
	call read				#lê e armazena no endereço apontado por rsi
	
	movl $msgSz, %edx
	movl $msg, %esi
	movl $STDOUT, %edi
	call write

	movl $2, %edx
	leaq aLetter(%rbp), %rsi
	movl $STDOUT, %edi
	call write

	movl $0, %eax	#return 0
	movq %rbp, %rsp	#remover as variáveis locais
	popq %rbp		#restaurar o frame pointer
	ret
