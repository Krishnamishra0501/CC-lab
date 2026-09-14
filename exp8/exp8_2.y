%{
#include <stdio.h>

int yylex();
void yyerror(char *s);
%}

%token NUMBER
%token INFIX PREFIX POSTFIX

%%

stmt:
      INFIX infix '\n'       { printf("Infix Result: %d\n", $2); }
    | PREFIX prefix '\n'     { printf("Prefix Result: %d\n", $2); }
    | POSTFIX postfix '\n'   { printf("Postfix Result: %d\n", $2); }
    ;

infix:
      NUMBER                 { $$ = $1; }
    | infix '+' infix        { $$ = $1 + $3; }
    | infix '-' infix        { $$ = $1 - $3; }
    | infix '*' infix        { $$ = $1 * $3; }
    | infix '/' infix        { $$ = $1 / $3; }
    ;

prefix:
      NUMBER                 { $$ = $1; }
    | '+' prefix prefix      { $$ = $2 + $3; }
    | '-' prefix prefix      { $$ = $2 - $3; }
    | '*' prefix prefix      { $$ = $2 * $3; }
    | '/' prefix prefix      { $$ = $2 / $3; }
    ;

postfix:
      NUMBER                 { $$ = $1; }
    | postfix postfix '+'    { $$ = $1 + $2; }
    | postfix postfix '-'    { $$ = $1 - $2; }
    | postfix postfix '*'    { $$ = $1 * $2; }
    | postfix postfix '/'    { $$ = $1 / $2; }
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
