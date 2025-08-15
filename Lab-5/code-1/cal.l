%option noyywrap

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "cal.tab.h"

    int lineno = 1; 
    void yyerror(const char* s);
%}

alpha     [a-zA-Z_]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    {digit}+
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
STRING    \"([^\"\\\n]|\\.)*\"
%%

"//".*               {  }
"#".*                { }

"int"                 { return INT; }
"float"               { return FLOAT; }
"double"              { return DOUBLE; }
"char"                { return CHAR; }

"if"                  { return IF; }
"else"                { return ELSE; }
"return"              { return RETURN; }
"printf"              { return PRINTF; }

"+"                   { return ADDOP; }
"-"                   { return SUBOP; }
"*"                   { return MULOP; }
"/"                   { return DIVOP; }
"=="                  { return EQUOP; }
">"                   { return GT; }
"<"                   { return LT; }

"("                   { return LPAREN; }
")"                   { return RPAREN; }
"{"                   { return LBRACE; }
"}"                   { return RBRACE; }
";"                   { return SEMI; }
"="                   { return ASSIGN; }
","                   { return COMMA; }

{ID}                   { strcpy(yylval.str_val, yytext); return ID; }
{ICONST}               { return ICONST; }
{FCONST}               { return FCONST; }
{CCONST}               { return CCONST; }
{STRING}               { strcpy(yylval.str_val, yytext); return STRING; }

"\n"                  { lineno += 1; }
[ \t\r\f]+           {  }

.                      { yyerror("Unrecognized character"); }

%%
