%{
    #include<stdio.h>
    int yylex(void);
    void yyerror(const char *s);

}%

%token INT FLOAT CHAR ID
%%
declaration:
    type_variable_list ';' 
        {
            printf("valid variable inititalzaitino");

        }
    type:
        INT
        |FLOAT
        |CHAR
        ;

    variable_list:
    ID
    |variable_list ',' ID
    ;

    %%
    void yyerror(const char *s){
        printf("invalid expr");

    }
    int main()
{
    printf("Enter declaration: ");
    yyparse();
    return 0;
}