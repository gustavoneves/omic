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

    .equ tamLocal,-16
    .equ tamChar,-16
    .equ toMaiusculo,-32

    .text
    .globl __start

__start:
    pushq %rbp          # salvar o frame pointer na pilha
    movq %rsp, %rbp     # copiar o stack pointer para o frame pointer
    addq $tamLocal, %rbp

    movq $2,%rdx                # ler um caractere + \n
	leaq tamChar(%rbp),%rsi     # endereço onde salvar
	movq $STDIN, %rdi           # id do arquivo de entrada em rdi
	movl $READ, %eax            # codigo da syscall em rax
	syscall                     # chama o S.O.

    cmpb $97,tamChar(%rbp)
    jb INTACTO                  # Se o caracter lido for menor que 97, nao altera

    cmpb $122,tamChar(%rbp)
    ja INTACTO                  # Se o caracter lido for maior que 122, nao altera


    addq $toMaiusculo, tamChar(%rbp) # passa o caracter lido para maiusculo
INTACTO:
    movq $2, %rdx               # escrever 2 caracteres
	leaq tamChar(%rbp),%rsi     # endereço dos caracteres
	movq $STDOUT,%rdi           # id do arquivo de saída em rdi
	movl $WRITE,%eax            # codigo da syscall em rax
	syscall                     # chama o S.O.

END:
	movq %rbp,%rsp              # restaura a pilha
	popq %rbp                   # restaura o stack pointer
	movq $0, %rdi               # valor que será retornado ao S.O.
	movl $EXIT,%eax             # codigo da syscall exit em rax
	syscall                     # syscall para terminar o programa
