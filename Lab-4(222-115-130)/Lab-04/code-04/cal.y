%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int val;
}

%token SWITCH CASE
%token <val> NUM
%type <val> expr

%%

program:
    stmt
    ;

stmt:
    switch_stmt
    ;

switch_stmt:
    SWITCH '(' expr ')' '{' case_list '}' {
        printf("Parsed a switch statement\n");
    }
    ;

case_list:
    /* empty */
    | case_list CASE expr ';' {
        printf("Parsed a case: %d\n", $3);
    }
    ;

expr:
    NUM {
        $$ = $1;
    }
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}
