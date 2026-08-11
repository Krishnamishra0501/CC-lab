%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *s);
%}

%token NUM

%%
E : E '+' T
  | T
  ;

T : T '*' F
  | F
  ;

F : '(' E ')'
  | NUM
  ;
%%

int yyerror(char *s)
{
    printf("Invalid expression\n");
    exit(0);
}

int main()
{
    printf("Enter expression: ");
    yyparse();
    printf("Valid expression\n");
    return 0;
}
