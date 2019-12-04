# 5.Escreva um programa para ler as coordenadas (x,y) de um ponto no plano cartesiano e
#  escreve o quadrante ao qual o ponto pertence. Caso o ponto não pertença a nenhum
#  quadrante, escrever se ele está sobre o eixo X, eixo Y, ou na origem (pode escrever “eixo x
#  eixo y” nesse caso se facilitar sua vida).

	.text
	.globl MAIN
MAIN:
	li $v0, 5
	syscall
	move $t0, $v0 # $t0 recebe a coordenada x
	
	li $v0, 5
	syscall
	move $t1, $v0 # $t1 recebe a coordenada y
	
	beq $t0, $zero, NoEixoY
	beq $t1, $zero, NoEixoX
	
QUADRANTE1:
	
	
NoEixoX:
	la $a0, sEixoX
	li $v0, 4
	syscall
	J END
	 
NoEixoY:
	la $a0, sEixoY
	li $v0, 4
	syscall
	J END

NaOrigem:
	la $a0, sOrigem
	li $v0, 4
	syscall

END:
	li $v0, 10
	syscall
	.data
sQuad1:
	.asciiz "Primeiro quadrante"
sQuad2:
	.asciiz "Segundo quadrante"
sQuad3:
	.asciiz "Terceiro quadrante"
sQuad4:
	.asciiz "Quarto quadrante"
sEixoX:
	.asciiz "Esta sobre o eixo x"
sEixoY:
	.asciiz "Esta sobre o eixo x"
sOrigem:
	.asciiz "Esta na origem dos espacos"	