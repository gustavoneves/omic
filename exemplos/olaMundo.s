	#constantes
	.equ STDOUT,1
	.section  .rodata	#seção de dados somente leitura
ola_mundo:				#nome da string
	.string "Ola Mundo\n"	#string terminada com \0
	.equ ola_mundoSz, .-ola_mundo-1
	.text				#seção de texto
	.globl main			#main visível globalmente
	.type  main, @function
main:					#inicio do main
	pushq  %rbp			#salva stack frame na pilha
	movq %rsp, %rbp		#define novo stack frame
	movl $ola_mundoSz, %edx		#terceiro argumento
	movl $ola_mundo, %esi	#segundo argumento
	movl $STDOUT, %edi	#primeiro argumento
	call write			#chama a função write
	movl $0, %eax		#return 0
	movq %rbp, %rsp		#restaura a pilha
	popq %rbp			#restaura o stack frame
	ret					#retorna ao chamador

