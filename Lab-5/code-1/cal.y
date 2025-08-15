%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symtab.c"
    void yyerror(const char* s);
    extern int lineno;
    extern int yylex();
%}

%union {
    char str_val[128];
    int int_val;
}

%token INT FLOAT DOUBLE CHAR
%token IF ELSE RETURN PRINTF
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN COMMA
%token<str_val> ID STRING
%token ICONST FCONST CCONST

%left LT GT EQUOP
%left ADDOP SUBOP
%left MULOP DIVOP
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%type<int_val> type exp constant

%start program

%%
program: func_def
       ;

statements: statements statement
          | ;

statement: declaration
         | assignment
         | if_statement
         | print_stmt
         | return_stmt
         | block
         | SEMI
         ;

declaration: type ID SEMI
           { insert($2, $1); }
           | type ID ASSIGN exp SEMI
           { insert($2, $1); }
           ;

assignment: ID ASSIGN exp SEMI
          {
              if (idcheck($1)) {
                  int lhsType = gettype($1);
                  int rhsType = $3;
                  typecheck(lhsType, rhsType);
              }
          }
          ;

type: INT    { $$ = INT_TYPE; }
    | FLOAT  { $$ = REAL_TYPE; }
    | DOUBLE { $$ = REAL_TYPE; }
    | CHAR   { $$ = CHAR_TYPE; }
    ;

exp: constant                { $$ = $1; }
   | ID                      { $$ = idcheck($1) ? gettype($1) : UNDEF_TYPE; }
   | exp ADDOP exp           { $$ = typecheck($1, $3); }
   | exp SUBOP exp           { $$ = typecheck($1, $3); }
   | exp MULOP exp           { $$ = typecheck($1, $3); }
   | exp DIVOP exp           { $$ = typecheck($1, $3); }
   | exp GT exp              { $$ = typecheck($1, $3); }
   | exp LT exp              { $$ = typecheck($1, $3); }
   | exp EQUOP exp           { $$ = typecheck($1, $3); }
   ;

constant: ICONST { $$ = INT_TYPE; }
        | FCONST { $$ = REAL_TYPE; }
        | CCONST { $$ = CHAR_TYPE; }
        ;

if_statement: IF LPAREN exp RPAREN block ELSE block
            | IF LPAREN exp RPAREN block %prec LOWER_THAN_ELSE
            ;

block: LBRACE statements RBRACE
     ;

func_def: type ID LPAREN RPAREN block
        ;

print_stmt: PRINTF LPAREN STRING opt_print_args RPAREN SEMI
          ;

opt_print_args: COMMA exp | ;

return_stmt: RETURN exp SEMI
           ;

%%

void yyerror(const char* s)
{
    fprintf(stderr, "Syntax error at line %d: %s\n", lineno, s);
    exit(1);
}

int main(int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished");
    return 0;
}
