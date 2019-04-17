/* Implementation of "lexer.h" */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "lexer.h"

/* NB: allocation below requires that END is the last token 
   TAKE CARE to synchronize token_name with token type of lexer.h
*/
static const char* token_name[END+1] = {
        "<INT>",
        "#",
        "?",
        "+",
        "-",
        "*",
        "/",
        "<END>"
};

void display(token t, int v) {
        printf("%s", token_name[t]);
        switch (t) {
        case INT:case VAR:
                if (v >= 0) {
                        printf("%d",v);
                } else {
                        printf("...\n");
                }
        default:
                break;
        }
}

void unexpected(token t, int v, const char *mesg) {
        printf("ERROR: unexpected token ");
        display(t, v);
        if (mesg[0] != 0) {
                printf(" in %s", mesg);
        }
        printf("\n");
        exit(1);
}


static int isDigit(char c) {
        return '0' <= c && c <= '9';
}

static int digit(char c) {
        assert(isDigit(c));
        return c - '0';
}

static char current;

static void update_current() {
        current = fgetc(stdin);
}

static void parse_int(int *v) {
        *v = 0;
        if (! isDigit(current)) {
                printf("LEXICAL ERROR: unexpected character '%c'\n", current);
                exit(1);
        }
        while (isDigit(current)) {
            *v = *v * 10 + digit(current);
            update_current();
        }
}


/* Boolean variable indicating whether "current" has been initialized or not.
   NB: this variable is only used in "next".
 */
static int init = 0;

token next(int *v) {
        if (! init) {
                /* A CORRIGER: enlever ligne ci-dessous */
                //printf("next: VERSION FOURNIE A CORRIGER !\n");
                update_current();
                init = 1;
        }
        for ( ; ; ) {
                switch (current) {
                case ' ': case '\t': case '\n':
                        update_current();
                        break;
                /* A COMPLETER: AUTRES TOKENS */
                case '+':
                        update_current();
                        return PLUS;
                case '-':
                        update_current();
                        return MINUS;
                case '*':
                        update_current();
                        return MULT;
                case '/':
                        update_current();
                        return DIV;
                case '#':
                        update_current();
                        parse_int(v);
                        return VAR;
                case '?':
                        update_current();
                        return QUEST;
                case EOF:
                        return END;
                default:
                        parse_int(v);
                        return INT;
                }
        }
}
