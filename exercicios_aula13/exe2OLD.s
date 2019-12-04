# 2.Faça as seguintes alterações no programa
#    Leia uma a string do teclado
#    Considere que a string tem no máximo 15 caracteres
#    Utilize read via syscall
#    read lê até o limite de especificado, ou até o usuário entrar com ‘\n’ (enter)
#    A quantidade de caracteres lido pelo read é retornado em rax
#    Utilize esse valor como critério de parada
#    Converta todos os caracteres entre [a-z] para maiúsculo. Os demais caracteres devem permanecer inalterados.
#    Escreva os caracteres (já convertidos) na tela utilizando uma única syscall para write
#    Monte com o GAS (as) e faça a linkedição com o GNU Linker (ld)
#    Não utilize o GCC
#    Não se esqueça de terminar seu programa via syscall
#    Analise o seu programa rodando com o GDB
#    Compare sua resposta com a disponibilizada no Moodle


# valores ascii: a-z 97 a 122  para maiusculo(-32)

#constantes
	.equ STDIN,0 
	.equ STDOUT,1
	.equ READ,0
	.equ WRITE,1
	.equ EXIT,60

    #.equ tamLocal,-16
    .equ tamChar,-16
    .equ toMaiusculo,-32
    .equ tamTotal,-272

    .text
    .globl __start

__start:
    pushq %rbp          # salvar o frame pointer na pilha
    movq %rsp, %rbp     # copiar o stack pointer para o frame pointer
    addq $tamTotal, %rsp

    movq %rdx, 0(%rbp)
    movq %rsi, -16(%rbp)
    movq %rdi, -32(%rbp)

    leaq -32(%rbp),%rsi     # endereço onde salvar

LOOP:
    addq $1, %rdx
    cmpq $15, %rdx
    ja END

    #addq $-16, %rcx
    addq $-16,%rsi

    movq $2,%rdx                # ler um caractere + \n

    #leaq %rcx(%rbp),%rsi     # endereço onde salvar
    #movq rcx(%rbp),%rsi     # endereço onde salvar

	movq $STDIN, %rdi           # id do arquivo de entrada em rdi
	movl $READ, %eax            # codigo da syscall em rax
	syscall                     # chama o S.O.

    #cmpb $10,rcx(%rbp)     # Se o caracter lido for \n vai para o fim
    cmpb $10,rsi(%rbp)     # Se o caracter lido for \n vai para o fim
    je IMPRIME

COMPARACAO_1:
    #cmpb $97,rcx(%rbp)
    cmpb $97,rsi(%rbp)
    jb LOOP                  # Se o caracter lido for menor que 97, nao altera

COMPARACAO_2:
    #cmpb $122,rcx(%rbp)
    cmpb $122,rsi(%rbp)
    ja LOOP                  # Se o caracter lido for maior que 122, nao altera

    #addq $toMaiusculo, rcx(%rbp) # passa o caracter lido para maiusculo
    addq $toMaiusculo, rsi(%rbp) # passa o caracter lido para maiusculo
    jmp LOOP

IMPRIME:
    movq $2, %rdx               # escrever 2 caracteres
	leaq tamChar(%rbp),%rsi     # endereço dos caracteres
	movq $STDOUT,%rdi           # id do arquivo de saída em rdi
	movl $WRITE,%eax            # codigo da syscall em rax
	syscall                     # chama o S.O.

END:
    leaq 0(%rbp), %rdx
    leaq -16(%rbp), %rcx
    leaq -32(%rbp), %rsi
    leaq -48(%rbp), %rdi

	movq %rbp,%rsp              # restaura a pilha
	popq %rbp                   # restaura o stack pointer
	movq $0, %rdi               # valor que será retornado ao S.O.
	movl $EXIT,%eax             # codigo da syscall exit em rax
	syscall                     # syscall para terminar o programa



#    cmpb $97,tamChar(%rbp)
#    jb INTACTO                  # Se o caracter lido for menor que 97, nao altera

#    cmpb $122,tamChar(%rbp)
#    ja INTACTO                  # Se o caracter lido for maior que 122, nao altera
