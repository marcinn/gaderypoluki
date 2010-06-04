#include <stdio.h>

/* deklaracja procedury w asemblerze */

extern int translate(char *dest, char *src, char *cipher);

int main(int argc, char **argv) 
{
    int rc = 0; /* return code */
    char *defcipher = "gaderypolukiGADERYPOLUKI";
    char zrodlo[255], cel[255], cipher[64];  /* bufor we/wy */

    if(argc>2) {
        printf("Nieprawidlowe wywolanie\n");
        return 1;
    } else if(argc==2) {
        strcpy((char *) &cipher, (char *) argv[1]);
    } else {
        strcpy((char *) &cipher, (char *) defcipher);
    }


    




    while(!feof(stdin)) {
        fgets(zrodlo, 255, stdin);
        if((rc=translate((char *) &cel, zrodlo, cipher))==0) {
            fputs(cel, stdout); 
        } else {
            printf("Blad zamiany (nieprawidlowy ciag znakow szyfrujacych), rc: %d\n", rc);
            break;
        }
    }
    return rc;
}


