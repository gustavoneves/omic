 	.text
	.globl  main
 	.type  main, @function
 main:
	 pushq  %rbp  		# salvar o frame pointer na pilha
	 movq  %rsp, %rbp	# copiar o stack pointer para o frame pointer
	 movl  $0, %eax 	# o valor retornado deve estar em EAX (return 0)
	 movq  %rbp, %rsp 	# voltar a pilha para a posição original
	 popq  %rbp 	 	# carregar o valor salvo do frame pointer da pilha
	 ret 				# retornar ao chamador