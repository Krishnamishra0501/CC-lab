%{
#include <stdio.h>
#include "y.tab.h"

int stringtoNumber(char str[])
{
    int num = 0;
    int i = 0;

    while (str[i] != '\0')
    {
        num = num * 10 + (str[i] - '0');
        i++;
    }

    return num;
}
%}

%%

"infix"     { return INFIX; }
"prefix"    { return PREFIX; }
"postfix"   { return POSTFIX; }

[0-9]+      { yylval = stringtoNumber(yytext); return NUMBER; }

[+*/-]      { return yytext[0]; }

[ \t]       ;

\n          { return '\n'; }

.           ;

%%

int yywrap()
{
    return 1;
}
