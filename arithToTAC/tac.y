
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
int temp = 1;
%}

%union {
    int num;
    char *str;
}

%token <num> NUMBER
%token <str> ID
%type <str> expr

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
    expr
    {
        printf("Result stored in: %s\n", $1);
    }
    ;

expr:
    expr '+' expr
    {
        char *t = malloc(20);
        sprintf(t, "t%d", temp++);
        printf("%s = %s + %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '-' expr
    {
        char *t = malloc(20);
        sprintf(t, "t%d", temp++);
        printf("%s = %s - %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '*' expr
    {
        char *t = malloc(20);
        sprintf(t, "t%d", temp++);
        printf("%s = %s * %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '/' expr
    {
        char *t = malloc(20);
        sprintf(t, "t%d", temp++);
        printf("%s = %s / %s\n", t, $1, $3);
        $$ = t;
    }
    | '-' expr %prec UMINUS
    {
        char *t = malloc(20);
        sprintf(t, "t%d", temp++);
        printf("%s = -%s\n", t, $2);
        $$ = t;
    }
    | '(' expr ')'
    {
        $$ = $2;
    }
    | NUMBER
    {
        char *t = malloc(20);
        sprintf(t, "%d", $1);
        $$ = t;
    }
    | ID
    {
        $$ = $1;
    }
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid arithmetic expression\n");
}

int main()
{
    printf("Enter an arithmetic expression: ");
    yyparse();
    return 0;
}
