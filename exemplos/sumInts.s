#programa
	.text
	.globl sumInts
	.type sumInts, @function
sumInts:
	pushq %rbp
	movq %rsp, %rbp

	addl %edi, %esi	#esi = esi+edi. Soma considerando 4 bytes
	movl %esi, (%rdx)	#armazenar o resultado no endereço apontado por rdx
	
	movq %rbp, %rsp
	popq %rbp
	ret
