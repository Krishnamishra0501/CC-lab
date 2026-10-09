%{
#include <stdio.h>
#include "exp9_2.tab.h"
%}

%%

[0-9]+      {
                yylval = 0;
                for(int i=0; yytext[i]!='\0'; i++)
                    yylval = yylval*10 + yytext[i]-'0';
                return NUMBER;
            }

"++"        { return INC; }
"--"        { return DEC; }

[+\-*/%^]   { return yytext[0]; }

[ \t]       ;
\n          { return '\n'; }

.           { printf("Invalid Expression\n"); }

%%

int yywrap()
{
    return 1;
}