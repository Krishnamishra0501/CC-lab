%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR ID NUMBER INC DEC
%token LE GE EQ

%%

input:
    for_loop
    ;

for_loop:
    FOR '(' expr1 ';' expr2 ';' expr3 ')'
    {
        printf("Valid FOR loop\n");
    }
    ;

expr1:
    ID '=' NUMBER
    ;

expr2:
    ID '<' NUMBER
    | ID '>' NUMBER
    | ID LE NUMBER
    | ID GE NUMBER
    | ID EQ NUMBER
    ;

expr3:
    ID INC
    | ID DEC
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid for loop\n");
}

int main()
{
    printf("Enter a for loop: ");
    yyparse();
    return 0;
}

