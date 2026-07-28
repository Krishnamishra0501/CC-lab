%{
#include <stdio.h>

int comments = 0, keywords = 0, identifiers = 0;
int words = 0, lines = 0, spaces = 0;
%}

%%
"/*"(.|\n)*?"*/"              { comments++; }
"//".*                        { comments++; }

[ \t]+                        { spaces += yyleng; }
\n                            { lines++; }

"int"|"char"|"float"|"double"|"if"|"else"|"while"|"for"|"return"
                              { keywords++; words++; }

[a-zA-Z_][a-zA-Z0-9_]*        { identifiers++; words++; }

[0-9]+                        { words++; }

.                             { }
%%

int main()
{
    yylex();

    printf("Comments    : %d\n", comments);
    printf("Keywords    : %d\n", keywords);
    printf("Identifiers : %d\n", identifiers);
    printf("Words       : %d\n", words);
    printf("Lines       : %d\n", lines);
    printf("Spaces      : %d\n", spaces);

    return 0;
}

int yywrap()
{
    return 1;
}
