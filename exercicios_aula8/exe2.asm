# 2.Crie uma função que retorna o enésimo número da sequência de Fibonacci. Considere que n é passado como parâmetro.
#   O seu programa principal deve ser um loop que pede o valor de n para o usuário repetidas vezes, e chama a função de
#    Fibonacci passando esse valor de n.
#   O programa deve exibir o número retornado pela função na tela.
#   O programa termina quando o usuário digitar um valor negativo

	.text
	.globl MAIN
MAIN:
	ori $s0, $zero, 1 # fibonacci de 1
	ori $s1, $zero, 1 # fibonacci de 2
	ori $s2, $zero, 0 # acumulador
	ori $s3, $zero, 2 # contador, igual a 2 porque ja' tenho dois numeros prontos, o de 1 e de 2
	li $v0, 5 # leio o termo
	syscall
	move $a0, $v0
	
	slti $t1, $a0,1 #se $a0 for menor que 1, $t1 recebe 1
	bne $t1, $zero, END #se $t1 for diferente de 0 vai para o END
	jal F_FIBONACCI
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $a0, 10 # 10 e' o código ascii para o \n
	li $v0, 11 # 11 em $v0 para S.O escrever $a0 na tela como char
	syscall    # 
	
	J MAIN
	
F_FIBONACCI:
	addi $sp, $sp, -12 #desloco o topo da pilha em 12 bytes            # Pilha
	sw $s0, 0($sp) #armazeno $s0 nos ultimos 4 bytes da pilha           # $s3
	sw $s1, 4($sp) #armazeno $s1 nos 4 bytes apos $s0                   # $s2
	sw $s2, 8($sp) #armazeno $s2 nos 4 bytes apos $s1                   # $s1
	sw $s3, 12($sp) #armazeno $s3 nos 4 bytes apos $s2                  # $s0
	
LOOP:
	addi $s3, $s3, 1 # acrescenta 1 ao contador
	add $s2, $s0, $s1 # acum = $s0 + $s1
	
	move $s0, $s1 # $s0 = $s1
	move $s1, $s2 # $s1 = acum
	
	bne $s3, $a0, LOOP # se contador != numero do termo vai para LOOP
	
	move $v0, $s1
	lw $s0, 0($sp) #restauro $s0 
	lw $s1, 4($sp) #restauro $s1 
	lw $s2, 8($sp) #restauro $s2 
	lw $s3, 12($sp) #restauro $s3
	
	addi $sp, $sp, 12
	jr $ra
	  
		
	
END:
	li $v0, 10
	syscall
	
	
