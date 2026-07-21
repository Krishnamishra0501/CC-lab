%{
//Name:			PRN:
#include<stdio.h>
int comments = 0, keywords = 0, identifiers = 0, words = 0, lines = 0, spaces = 0;
%}

%%
" /*" [^*]*"* /"	{ comments++; }
"//" .*		{ comments++; }
[ \t]+		{ spaces += yyleng; }
\n			{ lines++; }
"int"|"char"|"float"|"double"|"if"|"else"|"while"|"for"|"return"| { keywords++; }
[a-zA-Z_][a-zA-Z0-9_]*  { identifiers++; words++; }
[0-9]+ 			{ words++; }
.				{ /*  ignore other characters  */  }
%%
int main(){
	yylex();
	printf("Comments: %d\n", comments);
	printf("Keywords: %d\n", keywords);
	printf("identifiers: %d\n",identifiers);
	printf("words: %d\n",words);
	printf("Lines: %d\n",lines);
	printf("spaces:%d\m",spaces);
	return 0;
	}
int yywrap(){
	return 1;
}

