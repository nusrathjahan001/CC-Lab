%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int val;
}

%token WHILE
%token <val> NUM
%token LT
%left LT

%type <val> expr

%%

program:
    stmt
    ;

stmt:
    WHILE '(' expr ')' ';' {
        printf("Parsed a while loop\n");
    }
    ;

expr:
    NUM {
        $$ = $1;
    }
    | expr LT expr {
        $$ = ($1 < $3);
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
