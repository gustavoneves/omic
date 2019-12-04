 .text
 .globl main
main: 
	li $t1,2
	 
COMECA:
	li $v0,5
	syscall
	
	move $t0, $v0
	beq $t0, $zero, END
	
	div $t0, $t1
	mfhi $t0
	
	beq $t0, $zero, PAR
	J IMPAR
	
PAR:
	la $a0, sPAR
	li $v0, 4
	syscall
	J COMECA
	
IMPAR:
	la $a0, sIMPAR
	li $v0, 4
	syscall
	J main 
	
END:
	li $v0,10
	syscall
	.data
sPAR:
	.asciiz "e' par\n"
sIMPAR:
	.asciiz "e' impar\n"