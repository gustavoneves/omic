	.text
	.globl main
main:
	ori $t0,$zero,9
	ori $s0,$zero,1
L1:
	beq $t0,$zero,end #verifica se acabou
	mul $s0,$s0,$t0 #multiplica o que esta em s0 e t0 grava em s0
	addi $t0,$t0,-1 #subtrai 1 em t0 
	j L1
end:
	li $v0, 10 #finaliza o programa
	syscall