###
#   Aluno: Gustavo Neves
###


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
####        Estrutura da pilha
#
#   %rdi   0 - 7
#   %rsi   8 - 15
#   %rdx   16 - 23
#   %rcx   24 - 31
#   caracteres lidos 32 - 48
###



#constantes
	.equ STDIN,0                                    
	.equ STDOUT,1
	.equ READ,0
	.equ WRITE,1
	.equ EXIT,60

    .equ tamPrologo,-48
    .equ toMaiusculo,-32

    .section .rodata
msgErro:
    .string "Sao permitidos no maximo 15 caracteres!\n"
    .equ tamMsgErro,.-msgErro-1

    .text
	.globl __start

__start:
	pushq %rbp
	movq %rsp,%rbp
    addq $tamPrologo, %rbp

    movq %rdi, 0(%rbp)
    movq %rsi, -8(%rbp)
    movq %rdx, -16(%rbp)
    movq %rcx, -24(%rbp)


    movq $16,%rdx                # ler ate' quinze caracteres + \n
	leaq tamPrologo(%rbp),%rsi   # endereco onde salvar
	movq $STDIN, %rdi            # id do arquivo de entrada em rdi
	movl $READ, %eax             # codigo da syscall em rax
	syscall                      # chama o S.O.

    cmpq $15, %rax               # compara com 15
    ja IMPRIME_MSG_ERRO          # se for maior imprime a msg de erro e vai para o fim

    movq %rax, %rcx
    leaq tamPrologo(%rbp), %rsi

  
LEITURA:
    cmpq $0,%rcx
    je IMPRIME

    cmpb $10,(%rsi)                 # Se o caracter lido for o \n termina a leitura
    je IMPRIME

    addq $-1, %rcx

    cmpb $123,(%rsi)            # Se o caracter lido for maior que 122, nao altera
    jb MENOR_q123
    addq $1, %rsi
    jmp LEITURA
  
MENOR_q123:
    cmpb $96,(%rsi)              # Se o caracter lido for menor que 97 nao altera
    ja MAIUSCULO
    addq $1, %rsi
    jmp LEITURA


MAIUSCULO:
    addl $toMaiusculo,(%rsi)        # passa o caracter lido para maiusculo
    addq $1, %rsi
    jmp LEITURA


IMPRIME:
    movq %rax, %rdx               # escreve o numero de caracteres + \n
	leaq tamPrologo(%rbp),%rsi     # endereço dos caracteres
	movq $STDOUT,%rdi           # id do arquivo de saida em rdi
	movl $WRITE,%eax            # codigo da syscall em rax
	syscall                     # chama o S.O.

END:
    movq 0(%rbp), %rdi
    movq -16(%rbp), %rsi
    movq -32(%rbp), %rdx
    movq -48(%rbp), %rcx

	movq %rbp,%rsp              # restaura a pilha
	popq %rbp                   # restaura o stack pointer
	movq $0, %rdi               # valor que sera retornado ao S.O.
	movl $EXIT,%eax             # codigo da syscall exit em rax
	syscall                     # syscall para terminar o programa



IMPRIME_MSG_ERRO:
    movq $tamMsgErro, %rdx
    movq $msgErro,%rsi
    movq $STDOUT, %rdi
    movl $WRITE, %eax
    syscall
    jmp END
