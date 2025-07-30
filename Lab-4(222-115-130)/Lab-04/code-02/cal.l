%{
#include "cal.tab.h"
%}

%%
for         { return FOR; }
"("         { return '('; }
")"         { return ')'; }
";"         { return ';'; }
"<"         { return LT; }
"="         { return ASSIGN; }
"+"         { return ADD; }
[0-9]+      { yylval.val = atoi(yytext); return NUM; }
[i-z]       { yylval.id = yytext[0]; return ID; }
[ \t\n]+    ; // skip whitespace
.           return yytext[0];
%%

int yywrap() {
    return 1;
}
