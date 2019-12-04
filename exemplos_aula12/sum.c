#include <stdio.h>

extern void sumInts(int a, int b, int *soma);

int main(){
	int a = 2;
	int b = 3;
	int res;

	sumInts(a, b, &res);

	printf("%d\n", res);
	return 0;
}
