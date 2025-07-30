%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%union {
    int val;
}

%token <val> NUM
%token ADD SUB MUL DIV

%type <val> cal expr term factor

%start cal

%left ADD SUB
%left MUL DIV

%%

cal:
    expr
    ;

expr:
    expr ADD term {
        $$ = $1 + $3;
    }
  | expr SUB term {
        $$ = $1 - $3;
    }
  | term {
        $$ = $1;
    }
  ;

term:
    term MUL factor {
        $$ = $1 * $3;
    }
  | term DIV factor {
        if ($3 == 0) {
            yyerror("Division by zero");
            YYABORT;
        }
        $$ = $1 / $3;
    }
  | factor {
        $$ = $1;
    }
  ;

factor:
    '(' expr ')' {
        $$ = $2;
    }
  | NUM {
        $$ = $1;
    }
  ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}
