#Modifique o exercício 1 para que seja calculado n!, onde n é solicitado do usuário. Além
#disso, utilize a instrução mult no lugar de mul. Como mult funciona? Por que o resultado
#é armazenado em dois registradores?
	.text
	.globl main
main:
	li $v0,5
	syscall
	move $t0,$v0
	ori $s0,$zero,1
L1:
	beq $t0,$zero,end #verifica se acabou
	mult $s0,$t0
	mfhi $t1
	mflo $t2
	add $s0,$t1,$t2
	#mul $s0,$s0,$t0 #multiplica o que esta em s0 e t0 grava em s0
	addi $t0,$t0,-1 #subtrai 1 em t0 
	j L1
end:
	li $v0, 10 #finaliza o programa
	syscall
