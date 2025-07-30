%{
#include "cal.tab.h"
#include <stdlib.h>
%}

%%

"switch"     { return SWITCH; }
"case"       { return CASE; }
"("          { return '('; }
")"          { return ')'; }
"{"          { return '{'; }
"}"          { return '}'; }
";"          { return ';'; }
[0-9]+       { yylval.val = atoi(yytext); return NUM; }
[ \t\n]+     ;  // ignore whitespace
.            return yytext[0];

%%

int yywrap() {
    return 1;
}
