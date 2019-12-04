#constantes
	.equ STDIN, 0
	.equ STDOUT, 1
#posições na STACK
	.equ posStr1, -14
	.equ posStr2, -16
	.equ localSize, -16

	.section .rodata
prompt:
	.string "Entre com a string: "
	#o tamamho da mensagem é o tamanho da string -1
	.equ promptSz,.-prompt-1
msg:
	.string "Strings em ordem inversa: "
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

	movl $4, %edx			#ler 3 caracteres + \n
	leaq posStr1(%rbp), %rsi	#calcular o endr de aLetter e armazenar em rsi
	movl $STDIN, %edi		#stdin
	call read				#lê e armazena no endereço apontado por rsi

	movl $promptSz, %edx	#tamanho da string em edx
	movl $prompt, %esi		#endereço da string em esi
	movl $STDOUT, %edi		#stdout em edi
	call write				#syscall para função write

	movl $2, %edx		#ler 2 caracteres
	leaq posStr2(%rbp), %rsi
	movl $STDIN, %edi
	call read
	
	movl $msgSz, %edx
	movl $msg, %esi
	movl $STDOUT, %edi
	call write

	movl $6, %edx
	leaq posStr2(%rbp), %rsi
	movl $STDOUT, %edi
	call write

	movl $0, %eax	#return 0
	movq %rbp, %rsp	#remover as variáveis locais
	popq %rbp		#restaurar o frame pointer
	ret
