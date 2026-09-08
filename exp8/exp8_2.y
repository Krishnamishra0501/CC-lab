%{
#include<stdio.h>
%}

%token num
%%
stmt: stmt expr '\n' 		{printf("Result: %d",$); }
|
;
expr: 
num {$$=$1;}
|expr expr '+' {$$ = $1+$2 ;}
|expr expr '-' {$$ = $1-$2 ;}
|expr expr '*' {$$ = $1*$2 ;}
|expr expr '/' {$$ = $1/$2 ;}
;
%%
void yyerror(char *s){
printf("error");
}

int main(){
yyparse();
return();
}
// modify for prefix infix postfix in same code

