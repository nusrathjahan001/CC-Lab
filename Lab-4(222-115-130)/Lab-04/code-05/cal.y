%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int val;
}

%token PLUS MINUS
%token <val> NUM
%left PLUS MINUS
%type <val> expr

%%

program:
    expr ';' {
        printf("Result: %d\n", $1);
    }
    ;

expr:
    NUM {
        $$ = $1;
    }
    | expr PLUS expr {
        $$ = $1 + $3;
    }
    | expr MINUS expr {
        $$ = $1 - $3;
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
