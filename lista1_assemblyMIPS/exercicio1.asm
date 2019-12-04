	.text
	.globl main
main:
	ori $t0,$zero,9
	ori $t1,$zero,1
	ori $s0,$zero,1
L1:
	beq $t0,$zero,end #verifica se acabou
	mul $s0,$s0,$t0 #multiplica o que esta em s0 e t0 grava em s0
	sub $t0,$t0,$t1 #subtrai 1 em t0 
	j L1
end:
	li $v0, 10 #finaliza o programa
	syscall