#4.Considere os polinômios de terceiro grau, que são da seguinte forma:
#   ax³ + bx² + cx + d
#  Crie uma função que recebe como parâmetro os coeficientes a,b,c e d, e também um ponto x, e devolve o valor de x no
#    ponto especificado
# Considere que todos os valores são inteiros
	.text
	.globl MAIN
	
MAIN:
	li $s0, 6
	li $s1, 6
	li $s2, 6
	li $s3, 6
	
	li $v0, 5
	syscall
	move $a0, $v0 #coeficiente a
	
	li $v0, 5
	syscall
	move $a1, $v0 #coeficiente b
	
	li $v0, 5
	syscall
	move $a2, $v0 #coeficiente c
	
	li $v0, 5
	syscall
	move $a3, $v0 #coeficiente d
	
	addi $sp, $sp, -4 # desloco o topo da pilha em 4 bytes(para baixo)
	sw $s0, 0($sp)
	
	li $v0, 5
	syscall
	move $s0, $v0 # ponto x	

	
	jal CALCULA
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	lw $s0, 0($sp)
	addi $sp, $sp, 4 # desloco o topo da pilha em 4 bytes(para cima)
	
	J END

CALCULA:

  #   ax³ + bx² + cx + d
  	# $a0   coeficiente a
	# $a1   coeficiente b
	# $a2   coeficiente c
	# $a3   coeficiente d
	# $s0   ponto x
	
	addi $sp, $sp, -12 # desloco o topo da pilha em 12 bytes(para baixo)
	sw $s1, 0($sp)
	sw $s2, 4($sp)
	sw $s3, 8($sp)
	
	li $s1, 0
	li $s2, 0
	
	add $s3, $zero, $a3   # $s3 = d
	
	mult $a2, $s0  # c*x   $a2 * $s0
	mfhi $s1
	mflo $s2
	add $s1, $s1, $s2 # $s1 = $s1 + $s2  HI + LO
	
	add $s3, $s3, $s1 # $s3 = $s3 + $s1   $s3 = c*x + d
	
	mult $s0, $s0 # x * x
	mfhi $s1
	mflo $s2
	add $s1, $s1, $s2 # $s1 = $s1 + $s2  HI + LO
	
	mult $s1, $a1 # b * x^2
	mfhi $s1
	mflo $s2
	add $s1, $s1, $s2 # $s1 = $s1 + $s2  HI + LO
	
	add $s3, $s3, $s1 # $s3 = $s3 + $s1   $s3 = b*x^2 + c*x + d
	
	mult $s0, $s0 # x * x
	mfhi $s1
	mflo $s2
	add $s1, $s1, $s2 # $s1 = $s1 + $s2  HI + LO
	mult $s0, $s1 # x * x * x
	mfhi $s1
	mflo $s2
	add $s1, $s1, $s2 # $s1 = $s1 + $s2  HI + LO
	
	mult $s1, $a0
	mfhi $s1
	mflo $s2
	add $s1, $s1, $s2 # $s1 = $s1 + $s2  HI + LO
	
	add $s3, $s3, $s1 # $s3 = $s3 + $s1   $s3 = a*x^3 + b*x^2 + c*x + d
	
	move $v0, $s3

	lw $s1, 0($sp)
	lw $s2, 4($sp)
	lw $s3, 8($sp)
	addi $sp, $sp, 8 # desloco o topo da pilha em 12 bytes(para cima)
	jr $ra
	
END:
	li $v0, 10
	syscall
