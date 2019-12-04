#Modifique o exercício anterior para que o índice do número de fibonacci a ser impresso
#seja requisitado do usuário, e o resultado seja impresso no console

	.data
	fibonacciA: .asciiz "O termo de numero: " 
	fibonacciB: .asciiz " da sequencia de Fibonacci e': "

	.text
	.globl MAIN
MAIN:
	li $s0, 1 # fibonacci de 1
	li $s2, 1 # fibonacci de 2
	li $s1, 0 # acumulador
	li $t1, 2 # contador, igual a 2 porque ja' tenho dois numeros prontos, o de 1 e de 2
	
	li $v0,5 # le o numero
	syscall  #
	move $t0, $v0 # armazena o numero do termo no reg $t0
	
	beq $t0, $s0, MENOR3 # Se o numero lido for igual a 1, va para MENOR3
	beq $t0, $t1, MENOR3 # Se o numero lido for igual a 2, va para MENOR3
	beq $t0, $s1, END    # Se o numero lido for igual a 0, va para END
	
	
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610
LOOP:
	addi $t1, $t1, 1 # acrescenta 1 ao contador
	add $s1, $s0, $s2 # acum = $s0 + $s2
	
	move $s0, $s2 # $s0 = $s2
	move $s2, $s1 # $s2 = acum
	
	bne $t1, $t0, LOOP # se contador != numero do termo vai para LOOP

END:	
	li $v0, 4 #4 em $v0 para S.O escrever $a0 na tela como string
	la $a0, fibonacciA # carrega o endereço da string fibonacciA para $a0
	syscall
	
	move $a0, $t1 # printa o numero do termo
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $v0, 4 #4 em $v0 para S.O escrever $a0 na tela como string
	la $a0, fibonacciB # carrega o endereço da string fibonacciB para $a0
	syscall
	
	move $a0, $s1
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $v0, 10 #finaliza o programa
	syscall
	
MENOR3:
	li $s1, 1
	J END
		
