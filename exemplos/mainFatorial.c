#include<stdio.h>

extern unsigned int fatorial(unsigned int n);

int main(){
	int n;
	printf("Digite n: ");
	scanf("%d", &n);
	printf("%d! = %d", n, fatorial(n));

	return 0;
}

