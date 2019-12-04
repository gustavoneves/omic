	.text
	.globl dividir
	.type dividir, @function
dividir:
	pushq %rbp
	movq %rsp, %rbp	#fim do prólogo

	movq %rdx,%rcx #copiando rdx para auxiliar
	movl %edi,%eax #os 4 bytes para eax
	cdq				#estender o sinal de eax para rdx
	idivl %esi		#divisor em %esi
	#o resultado já foi armazenado em eax pelo idivl
	movl %edx, (%rcx) #copia o resto para o endereço em rcx

	movq %rbp, %rsp
	popq %rbp	#fim do epílogo
	ret
