%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%union {
    int val;
    char id;
}

%token FOR
%token <val> NUM
%token <id> ID
%token ASSIGN ADD LT

%left ADD
%start cal

%type <val> expr
%type <id> variable

%%

cal:
    for_stmt
    ;

for_stmt:
    FOR '(' init_stmt cond_stmt update_stmt ')' {
        printf("Parsed a for loop\n");
    }
    ;

init_stmt:
    variable ASSIGN expr ';'
    ;

cond_stmt:
    expr LT expr ';'
    ;

update_stmt:
    variable ASSIGN expr
    ;

expr:
    expr ADD expr {
        $$ = $1 + $3;
    }
  | NUM {
        $$ = $1;
    }
  | variable {
        $$ = 0; // just a placeholder for variables
    }
  ;

variable:
    ID {
        $$ = $1;
    }
  ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}
