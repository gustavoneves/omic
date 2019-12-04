#Faça um programa que solicita continuamente valores inteiros ao usuário. O programa
#termina quando o usuário digita -1. Ao final, o programa deve exibir a soma e a média
#dos valores digitados.
	.data
	soma: .asciiz  "A soma e': "
	media: .asciiz "A media e': "
	.text
	.globl MAIN
MAIN:
	li $s0, -1
	li $s1, 0 # Vai receber a quantidade de numero lidos
	li $s2, 0 # acumula a soma dos numeros lidos
	
LOOP:
	li $v0,5 # le o numero
	syscall  #
	move $t0,$v0 # armazena o numero lido no reg $t0
	
	beq $t0,$s0,END # Se a entrada for igual a -1, termina o programa
	addi $s1, $s1, 1
	add $s2, $s2, $t0 # acrescenta $t0 ao acumulador($s2)
	J LOOP
	
END:
	li $v0, 4 #4 em $v0 para S.O escrever $a0 na tela como string
	la $a0, soma # carrega o endereço da string soma para $a0
	syscall
	
	move $a0, $s2 # imprime a soma dos numeros fornecidos
	li $v0, 1     # 1 em $v0 para S.O escrever $a0 na tela como int
	syscall       #
	
	li $a0, 10 # 10 e' o código ascii para o \n
	li $v0, 11 # 11 em $v0 para S.O escrever $a0 na tela como char
	syscall    # 
	
	
	div $s2, $s1  # calcula a media aritmetica entre $s2 e $s1
	mflo $t0
	
	li $v0, 4 #4 em $v0 para S.O escrever $a0 na tela como string
	la $a0, media # carrega o endereço da string media para $a0
	syscall
	
	
	move $a0, $t0 # imprime a media dos numeros fornecidos
	li $v0, 1     # 
	syscall       # 
	
	li $v0, 10 #finaliza o programa
	syscall
