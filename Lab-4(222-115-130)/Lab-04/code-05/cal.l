%{
#include "cal.tab.h"
#include <stdlib.h>
%}

%%

"+"         { return PLUS; }
"-"         { return MINUS; }
";"         { return ';'; }
[0-9]+      { yylval.val = atoi(yytext); return NUM; }
[ \t\n]+    ;  // ignore whitespace
.           return yytext[0];

%%

int yywrap() {
    return 1;
}
