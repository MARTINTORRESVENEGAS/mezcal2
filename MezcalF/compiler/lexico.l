%option noyywrap
%{
	#include "grammar.tab.h"
%}

COLONG [:]
DIGIT -?[0-9]
ALPHA [a-zA-Z]
CHARACTERS_BLOCK {QUOTES}({DOT}*{COLONG}*{ALPHA}*{WHITESPACE}*{DIGIT}*)+{QUOTES}
NAME {ALPHA}([0-9]*{ALPHA}*)+
WHITESPACE [ \r\t\v\f]
LINEFEED \n
SINGLECOMMENT {MENOR}{PLUS}({DOT}*{WHITESPACE}*)+{LINEFEED}+{PLUS}{MAYOR}
MULTILINECOMMENT {MENOR}{PLUS}({DOT}*{WHITESPACE}*{LINEFEED}*)+{PLUS}{MAYOR}
DOT .
SLASH[/]
WILDCARD [*]
QUOTES [\"]
MENOR [<]
MAYOR [>]
PLUS [+]
MINUS [-]

%%

"/"			{ return SLASH; }
"\\"			{ return SLASHI; }
"["			{ return LEFT_BRACKET; }
"]"			{ return RIGHT_BRACKET; }
"?"			{ return IF; }
"|"               	{ return ELSE;}
"="			{ return EQ; }
"<="			{ return LE; }
"<"			{ return LT; }
">"			{ return GT; }
">="			{ return GE; }
"!="			{ return NE; }
"itob"			{ return ITOB; }
"+:"			{ return INCREMENTO; }
"-:"			{ return DECREMENTO; }
"load"			{ return LOAD; }
"show"			{ return SHOW; }	
"Int"			{ return INT; }
"Bln"			{ return BLN; }
"Str"			{ return STR; }
"Dec"			{ return DEC; }
"tru"			{ return TRU; }
"fls"			{ return FLS; }
"answer:0;"		{ return ANSWER; }
{DIGIT}+               { return INTEGER_VALUE; }
{DIGIT}+{DOT}{DIGIT}+  { return DECIMAL_VALUE; }
{NAME}			{ return NAME;}
{CHARACTERS_BLOCK}     { return CHARACTERS_BLOCK; }
{QUOTES}		{ return QUOTES; }
{SINGLECOMMENT}        { return SINGLECOMMENT; }
{MULTILINECOMMENT}     { return MULTILINECOMMENT; }
":"			{ return COLON; }
"::"			{ return DOBLE_COLON; }
";"			{ return SEMICOLON; }
"->"			{ return RIGHT_ARROW; }
"{"			{ return LEFT_CURLY_BRACE; }
"}"			{ return RIGHT_CURLY_BRACE; }
"("			{ return LEFT_PARENTHESIS; }
")"			{ return RIGHT_PARENTHESIS; }
"$"			{ return DOLLAR_SIGN; }
","			{ return COMA; }
"@"			{ return WHILE; }
"+"			{ return PLUS; }
"-"			{ return MINUS; }
{WHITESPACE}
{LINEFEED}		++yylineno;

%%

#include <stdio.h>


