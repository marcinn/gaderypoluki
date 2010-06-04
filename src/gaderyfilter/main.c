#include <stdio.h>

/* deklaracja procedury w asemblerze */

extern int translate(char *dest, char *src, char *cipher);

int main(int argc, char argv[]) 
{
    int rc = 0; /* return code */
    char *cipher = "gaderypolukiGADERYPOLUKI";
    char zrodlo[255], cel[255];  /* bufor we/wy */

    while(!feof(stdin)) {
        fgets(zrodlo, 255, stdin);
        if((rc=translate((char *) &cel, zrodlo, cipher))==0) {
            fputs(cel, stdout); 
        } else {
            printf("Blad zamiany (nieprawidlowy ciag znakow szyfrujacych), rc: %d\n", rc);
        }
    }
    return rc;
}


