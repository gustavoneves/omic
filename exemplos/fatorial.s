	.text
	.globl fatorial
	.type fatorial,@function
fatorial:
	pushq %rbp
	movq %rsp, %rbp

	movl %edi,%eax #valor a ser multiplicado em %eax
loopPrincipal:
	decl %edi #decrementa o multiplicador
	cmp $1, %edi
	je saidaFatorial
	mull %edi #multiplica %edi por %eax e armazena o resultado em %eax %edx
	jmp loopPrincipal
saidaFatorial:
	movq %rbp, %rsp
	popq %rbp
	ret
