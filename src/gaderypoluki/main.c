#include <stdio.h>

/* deklaracja procedury w asemblerze */

extern int translate(char *dest, char *src, char *cipher);

int main(int argc, char argv[]) 
{
    int rc = 0; /* return code */
    char *zrodlo = "Chcd epstgc zgukczdnkd ng okgtid";
    char *cipher = "gaderypolukiGADERYPOLUKI";
    char cel[255];  /* bufor wyjsciowy */

    printf("(De)szyfrowanie tekstu: %s\n", zrodlo);
    
    if((rc=translate((char *) &cel, zrodlo, cipher))==0) {
        printf("Wyjscie: %s\n", cel);
    } else {
        printf("Blad zamiany (nieprawidlowy ciag znakow szyfrujacych), rc: %d\n", rc);
    }
    return rc;
}


