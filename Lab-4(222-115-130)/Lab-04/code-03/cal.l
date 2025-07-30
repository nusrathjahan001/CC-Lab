%{
#include "cal.tab.h"
#include <stdlib.h>
%}

%%

"while"     { return WHILE; }
"("         { return '('; }
")"         { return ')'; }
";"         { return ';'; }
"<"         { return LT; }
[0-9]+      { yylval.val = atoi(yytext); return NUM; }
[ \t\n]+    ; // ignore whitespace
.           return yytext[0];

%%

int yywrap() {
    return 1;
}
