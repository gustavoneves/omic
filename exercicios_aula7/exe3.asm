#3.Faça um programa que leia a idade do usuário em dias, e a exiba e anos, meses e dias no
#formato anos/meses/dias
	
	.text
	.globl MAIN
	
MAIN:
# 9927 dias = 27 anos(9855 dias) + 2 meses(60 dias) + 12 dias

	li $t0, 365 # numero dias no ano
	li $t1, 30 # numero dias no mes
	li $t2, 1  # dia
	
	li $v0, 5 #leio a idade em dias
	syscall
	move $s0, $v0
	
	div $s0, $t0 # entrada / 365
	mflo $t0 # $t0 recebera o quociente da divisao
	mfhi $s0 # $s0 recebera o resto da divisao
	
	div $s0, $t1 # entrada / 12
	mflo $t1 # $t1 recebera o quociente da divisao
	mfhi $s0 # $s0 recebera o resto da divisao
	
	div $s0, $t2 # entrada / 30
	mflo $t2 # $t2 recebera o quociente da divisao
	
	move $a0, $t0 #numero de anos
	li $v0, 1
	syscall
	
	la $a0, barra
	li $v0, 4
	syscall
	
	move $a0, $t1 #numero de meses
	li $v0, 1
	syscall
	
	la $a0, barra
	li $v0, 4
	syscall
	
	move $a0, $t2 #numero de dias
	li $v0, 1
	syscall
		
	
END:
	li $v0, 10
	syscall
	.data
barra:
	.ascii "/"
        
