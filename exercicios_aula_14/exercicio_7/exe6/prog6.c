#include <stdio.h>
#include <stdlib.h>

extern char funcMinusculo(int tam, char *s);


int main(){
    char *s;

    s = malloc(sizeof(char) * 6);
    s = "TESTE\0";

    //func1(6,s);
    //funcMinusculo(0,s);
    //char *s = malloc(sizeof(char));

    //funcMinusculo(6, s);
    /*
    char *r = malloc(sizeof(char) * 6);
    r = "TESTE\0";

    printf("%s\n", r);
*/
    //funcMinusculo(1, r);
    printf("Retorno: %c\n", funcMinusculo(3, s));

   // printf("%s\n", r);
    //funcMinusculo(6, &r);

    return 0;
}