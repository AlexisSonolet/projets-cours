/* Implementation of a calculator in prefix notation */

#include <stdio.h>
#include "lexer.h"
#include "list.h" 

int parse_exp(list l) {
        int v1;
        token current = next(&v1);
        switch (current) {
        case INT:
                return v1;
        case MULT:
                return parse_exp(l) * parse_exp(l);
        case DIV:
                return parse_exp(l) / parse_exp(l);
        case PLUS:
                return parse_exp(l) + parse_exp(l);
        case MINUS:
                return parse_exp(l) - parse_exp(l);
        case VAR:
                return pick(l, v1);
        default:
                unexpected(current, v1, "exp");
                return 0; // unreachable code
        }
}

void parse_input(list l) {
        int v;
        /* A CORRIGER: on reconnaît juste une expression (sans '?' devant) */
        //printf("parse_input: VERSION FOURNIE A CORRIGER !\n");
        token current = next(&v);

        switch (current) {
        case QUEST:
            v=parse_exp(l);
            append(l, v); // L'affichage est fait dans "append" (cf. commentaires dans "list.h")
            parse_input(l);
            break;
        case END:
            break;
        default:
            unexpected(current, v, "input");

        }
}

int main() {
        printf("// Mini-calculator.\n//\n") ;
        printf("// Enter below a sequence of integer computations (using prefix notation).\n");
        printf("// Each computation must start with '?'.\n") ;
        printf("// Type Ctrl-D to quit.\n") ;
        parse_input(empty());
        /* Ligne suivante à garder, pour vérifier qu'on sort proprement */
        printf("// End of Input: Bye !\n") ;
        return 0;
}
