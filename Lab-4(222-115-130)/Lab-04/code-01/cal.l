%{
#include "cal.tab.h"
%}

%%
[0-9]+      { yylval.val = atoi(yytext); return NUM; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"("         { return '('; }
")"         { return ')'; }
[ \t\n]+    ;    // skip whitespace
.           return yytext[0];
%%

int yywrap() {
    return 1;
}
