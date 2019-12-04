#Faça um programa que calcule o vigésimo número da sequência de Fibonacci e o
#armazene o registrador $s1.

	.data
	fibonacci: .asciiz "O vige'simo termo da sequencia de Fibonacci e': "

	.text
	.globl MAIN
MAIN:
	li $s0, 1 # fibonacci de 1
	li $s2, 1 # fibonacci de 2
	li $s1, 0 # acumulador
	li $t1, 2 # contador, igual a 2 porque ja' tenho dois numeros prontos, o de 1 e de 2
	li $t0, 20 # numero do termo
	
	
	
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610
LOOP:
	addi $t1, $t1, 1 # acrescenta 1 ao contador
	add $s1, $s0, $s2 # acum = $s0 + $s2
	
	move $s0, $s2 # $s0 = $s2
	move $s2, $s1 # $s2 = acum
	
	bne $t1, $t0, LOOP # se contador != numero do termo vai para LOOP

END:	
	li $v0, 4 #4 em $v0 para S.O escrever $a0 na tela como string
	la $a0, fibonacci # carrega o endereço da string soma para $a0
	syscall
	
	move $a0, $s1
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $v0, 10 #finaliza o programa
	syscall