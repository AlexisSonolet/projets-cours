/* Implementation of a calculator in infix notation */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "lexer.h"
#include "list.h" 

/* look a-head */
static token current;
static int att; /* attribute of current */ 

/* parsing of token */
void parse_token(token expected) {
        if (current != expected) {
                printf("ERROR: expected token ");
                display(expected, -1);
                printf(" but found ");
                display(current, att);
                printf("\n");
                exit(1);
        }
        if (current != END) {
                current = next(&att);
        }
}

/* A COMPLETER */


int main() {
        printf("// Mini-calculator.\n//\n") ;
        printf("// Enter below a sequence of integer computations (using infix notation).\n");
        printf("// Each computation must end with '?'.\n") ;
        printf("// Type Ctrl-D to quit.\n") ;
        /* A FAIRE */
        printf("calc.c: VERSION FOURNIE A COMPLETER !\n"); 
        current = next(&att); /* init de current */
        /* Ligne suivante à garder, pour vérifier qu'on sort proprement */
        printf("// End of Input: Bye !\n") ;
        return 0;
}
