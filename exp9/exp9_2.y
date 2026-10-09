%{
#include <stdio.h>
#include <math.h>

int yylex();
void yyerror(char *s);
%}

%token NUMBER INC DEC

%left '+' '-'
%left '*' '/' '%'
%right '^'
%left INC DEC

%%

input:
    input line
    |
    ;

line:
    expr '\n' { printf("Result = %d\n", $1); }
    ;

expr:
      NUMBER
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | expr '%' expr   { $$ = $1 % $3; }
    | expr '^' expr   { $$ = pow($1,$3); }
    | expr INC        { $$ = $1 + 1; }
    | expr DEC        { $$ = $1 - 1; }
    ;

%%

void yyerror(char *s)
{
    printf("Error\n");
}

int main()
{
    yyparse();
    return 0;
}