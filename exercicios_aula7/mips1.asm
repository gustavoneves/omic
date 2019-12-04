 .text
 .globl main
main:
	la $a0,ola_mundo
	li $v0,4
	syscall
end:
	li $v0,10
	syscall
	.data
ola_mundo:
	.asciiz "Ola Mundo\n"