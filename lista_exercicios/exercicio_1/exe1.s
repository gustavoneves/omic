	.equ tamPrologo, -48
    .equ soma, -24
    .equ acum, -32
	
	.section .rodata
prompt:
	.string "Digite um inteiro: "

scanFormat:
	.string "%d"

printFormat:
	.string "Soma: %d Media: %d\n"

    .text
    .globl main
    .type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp
    addq $tamPrologo, %rsp

    movq %rdi, 0(%rbp)
    movq %rsi, -8(%rbp)
    movq %rdx, -16(%rbp)

    movq $0, soma(%rbp)
    movq $0, acum(%rbp)

LOOP:
    movq $prompt, %rdi 
	movq $0, %rax	
	call printf		

    leaq -40(%rbp), %rsi	
	movq $scanFormat, %rdi 
	movq $0, %rax	
	call scanf

    leaq -40(%rbp), %rsi

    cmpl $0, (%rsi)
    jl IMPRIME

    movq soma(%rbp), %rdx
    
    addq (%rsi), %rdx
    movq %rdx, soma(%rbp)

    addq $1, acum(%rbp)

    cmpl $2047, soma(%rbp)
    ja IMPRIME

    jmp LOOP
    	

IMPRIME:
    movq $0, %rdx             # parte baixa do dividendo
    movq soma(%rbp), %rax     # parte alta do dividendo
    divq acum(%rbp)           # divide a soma pela quantidade de numeros lidos

    movq soma(%rbp), %rsi     # primeiro parametro printf
    movq %rax, %rdx           # segundo parametro printf

    movq $printFormat, %rdi   # string de formato do printf
    movq $0, %rax
    call printf

FIM:
    movq 0(%rbp), %rdi
    movq -8(%rbp), %rsi
    movq -16(%rbp), %rdx

    movq $0, %rax
    movq %rbp, %rsp
    popq %rbp
    ret
