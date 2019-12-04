#programa
	.text
	.globl sumInts
	.type sumINts, @function
sumInts:
	pushq %rbp
	movq %rsp, %rbp

	movq $0, %rax #retorna 0 caso tudo ok
	addl %edi, %esi	#esi = esi+edi. Soma considerando 4 bytes
	jno saidaOverflow
	movq $1, %rax
saidaOverflow:
	movl %esi, (%rdx)	#armazenar o resultado no endereço apontado por rdx
	
	
	movq %rbp, %rsp
	popq %rbp
	ret
