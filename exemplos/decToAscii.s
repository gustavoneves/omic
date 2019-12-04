#Dados na memória
	.section .rodata
endValor10:
	.long 10	#div só aceita posição na memória ou reg

	.text
	.globl decToAscii
	.type decToAscii,@function
decToAscii:
	pushq %rbp
	movq %rsp, %rbp #fim do prólogo

	movl %edi,%eax	#copia o parâmetro par eax
	movq %rsi,%rcx	#base da string copiada para rcx
	cmpl $0, %eax #verifica se é zero
	jne verificaNegativo
	movb $48, (%rcx) #código ASCII do zero
	incq %rcx	#próximo end. do array
	jmp inverterArray
verificaNegativo:
	jg loopPrincipal #vai para o loop principal se maior que zero
	negl %eax	#complemento de 2 de eax para positivo
	movb $'-',(%rcx) #código ASCII do '-' no primeiro caractere
	incq %rcx	#próximo end. do array
	incq %rsi	#modifica a base da string (necessário para inverter o vetor sem trocar o lugar do sinal)
loopPrincipal:
	movl $0, %edx	#zerar a parte alta do dividendo (garantimos que não é negativo)
	divl endValor10 #resultado da divisão vai para eax
	addb $48, %dl	#soma 30 no resto da divisão para obter ASCII
	movb %dl, (%rcx) #salva o ascii na posição de memória
	incq %rcx	#próximo end. do array
	cmpl $0, %eax	#chegamos em zero?
	jne	loopPrincipal #se não zero, continuar no loop
inverterArray:
	movb $0, (%rcx) #'/0' no final da string gerada
	decq %rcx	#volta um endereço para não inverter o \0
loopPrincipalInversao:
	cmpq %rcx,%rsi	#compara o ponteiro do fim com o do início da string
	jae saidaInverteArray	#termina quando os ponteiros se encontram no meio ou fim passa início
	movb (%rsi), %al #carrega o byte do inicio para al
	movb (%rcx), %dl #carrega o byte do fim para dl
	movb %al, (%rcx) #troca as posições
	movb %dl, (%rsi) #troca as posiçoes
	incq %rsi	#avança o inicio
	decq %rcx	#retrocede o fim 
	jmp loopPrincipalInversao
saidaInverteArray:
	movq %rbp, %rsp
	popq %rbp	#fim do epílogo
	ret
