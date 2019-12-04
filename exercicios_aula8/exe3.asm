# 3.Crie uma função que recebe um valor inteiro N, e retorne quantos dígitos N possui
#   Exemplo: 12345 possui 5 dígitos
#   Dica: utilize sucessivas divisões por 10 para obter o valor

	.text
	.globl MAIN
MAIN:
	li $s1, 10
	li $v0, 5
	syscall
	
	move $a0, $v0
	beq $a0, $zero, END
	
	jal N_Digitos
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	J END

N_Digitos:
	addi $sp, $sp, -8 # desloco o topo da pilha em 8 bytes(para baixo)
	sw $s0, 0($sp)
	sw $s2, 4($sp)
	move $s0, $a0
	li $s2, 0 
DIVIDE:
	div $s0, $s1
	mflo $s0 #
	addi $s2, $s2, 1
	bne $s0, $zero, DIVIDE
	move $v0, $s2
	lw $s0, 0($sp) #restauro $s0
	lw $s2, 4($sp) #restauro $s1
	addi $sp, $sp, 8 # desloco o topo da pilha em 8 bytes(para cima)
	jr $ra

	

END:
	li $v0, 10
	syscall