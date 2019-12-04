#include<stdio.h>

#define TAM_STR 12 //um inteiro com sinal vai gerar uma string de no máximo 12 caracteres, contando com o /0

extern void decToAscii(int valorParaConversao, char* string);

int main(){
	int valor;
	char buffer[TAM_STR];
	scanf("%d", &valor);
	decToAscii(valor, buffer);

	printf("%s\n", buffer);//escrevendo como string

	return 0;
}
