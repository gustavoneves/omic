#Crie um programa para um caixa eletrônico que calcula o menor
#número possível de cédulas que deve ser entregue a um usuário
#quando ele fizer um saque. Considere que a entrada do programa é o
#valor do saque, e a saída são as notas que o usuário receberá. Exiba
#as quantidades de notas como inteiros simples na tela, na seguinte
#ordem: notas de 50, 20, 10 e 5 reais, e moedas de 1 real. Exemplo se
#o usuário solicitar um saque de 87 reais:
#
#	1 1 1 1 2

	.text
	.globl MAIN
MAIN:
	li $s0, 50 #
	li $s1, 20 #
	li $s2, 10 #
	li $s3, 5  #
	li $s4, 1  #
	
	li $v0,5 # le o numero
	syscall  #
	move $t0, $v0 # armazena o numero do termo no reg $t0
	
	beq $t0, $zero, END  # testo se $t0 == zero, se for vou para END


DIV50:
	div $t0, $s0 # $t0 divido por 50
	mfhi $t0     # movo o resto da divisao para o $t0
	mflo $t1      # movo o numero de notas para o $t1
	
	beq $t1, $zero, DIV20 # Se $t0 for menor que 50, vou para DIV20 
	
	move $a0, $t1 # imprime o numero de notas de 50
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $a0, 32 # 32 e' o código ascii para o " " (espaco)
	li $v0, 11 # 11 em $v0 para S.O escrever $a0 na tela como char
	syscall    # 

DIV20:
	div $t0, $s1 # $t0 divido por 20
	mfhi $t0     # movo o resto da divisao para o $t0
	mflo $t1      # movo o numero de notas para o $t1
	
	beq $t1, $zero, DIV10 # Se $t0 for menor que 20, vou para DIV10 
	
	move $a0, $t1 # imprime o numero de notas de 20
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $a0, 32 # 32 e' o código ascii para o " " (espaco)
	li $v0, 11 # 11 em $v0 para S.O escrever $a0 na tela como char
	syscall    # 

DIV10:
	div $t0, $s2 # $t0 divido por 10
	mfhi $t0     # movo o resto da divisao para o $t0
	mflo $t1      # movo o numero de notas para o $t1
	
	beq $t1, $zero, DIV5 # Se $t0 for menor que 10, vou para DIV5
	
	move $a0, $t1 # imprime o numero de notas de 10
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $a0, 32 # 32 e' o código ascii para o " " (espaco)
	li $v0, 11 # 11 em $v0 para S.O escrever $a0 na tela como char
	syscall    # 

DIV5:
	div $t0, $s3 # $t0 divido por 5
	mfhi $t0     # movo o resto da divisao para o $t0
	mflo $t1      # movo o numero de notas para o $t1
	
	beq $t1, $zero, DIV1 # Se $t0 for menor que 5, vou para DIV5 
	
	move $a0, $t1 # imprime o numero de notas de 5
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $a0, 32 # 32 e' o código ascii para o " " (espaco)
	li $v0, 11 # 11 em $v0 para S.O escrever $a0 na tela como char
	syscall    # 
	
DIV1:
	div $t0, $s4 # $t0 divido por 1
	mfhi $t0     # movo o resto da divisao para o $t0	
	mflo $t1      # movo o numero de notas para o $t1
	
	beq $t1, $zero, END # Se $t0 for menor que 1, vou para END
	
	move $a0, $t1 # imprime o numero de notas de 50
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $a0, 32 # 32 e' o código ascii para o " " (espaco)
	li $v0, 11 # 11 em $v0 para S.O escrever $a0 na tela como char
	syscall    # 
	
END:
	li $v0, 10 #finaliza o programa
	syscall
