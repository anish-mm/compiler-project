
type pos = int
val linenum = ref 1
type lexresult = Tokens.token
fun eof() = Tokens.EOF()
val error = fn x => TextIO.output(TextIO.stdOut, x ^ "\n")

%%
space = [\ \t];
letter = [a-zA-Z];
digit = [0-9];
id = {letter}({letter}|{digit}|_)*;
quote = ["];
noquote = [^"];
%%

<INITIAL>int    	 => (Tokens.INT(yypos, yypos + size yytext));
<INITIAL>char            => (Tokens.CHAR(yypos, yypos + size yytext));
<INITIAL>if 	         => (Tokens.IF(yypos, yypos + size yytext));
<INITIAL>else    	 => (Tokens.ELSE(yypos, yypos + size yytext));
<INITIAL>while    	 => (Tokens.WHILE(yypos, yypos + size yytext));
<INITIAL>"|"    	 => (Tokens.OR(yypos, yypos + size yytext));
<INITIAL>"&"    	 => (Tokens.AND(yypos, yypos + size yytext));
<INITIAL>"="	         => (Tokens.EQ(yypos, yypos + size yytext));
<INITIAL>"!="    	 => (Tokens.NEQ(yypos, yypos + size yytext));
<INITIAL>">"    	 => (Tokens.GT(yypos, yypos + size yytext));
<INITIAL>"<"    	 => (Tokens.LT(yypos, yypos + size yytext));
<INITIAL>">="    	 => (Tokens.GEQ(yypos, yypos + size yytext));
<INITIAL>"<="    	 => (Tokens.LEQ(yypos, yypos + size yytext));
<INITIAL>"+"    	 => (Tokens.PLUS(yypos, yypos + size yytext));
<INITIAL>"-"    	 => (Tokens.MINUS(yypos, yypos + size yytext));
<INITIAL>"*"    	 => (Tokens.MUL(yypos, yypos + size yytext));
<INITIAL>"/"    	 => (Tokens.DIV(yypos, yypos + size yytext));
<INITIAL>"%"    	 => (Tokens.MOD(yypos, yypos + size yytext));
<INITIAL>";"             => (Tokens.SEMICOLON(yypos, yypos + size yytext));
<INITIAL>"("    	 => (Tokens.LPAREN(yypos, yypos + size yytext));
<INITIAL>")"    	 => (Tokens.RPAREN(yypos, yypos + size yytext));
<INITIAL>"{"    	 => (Tokens.LCURLY(yypos, yypos + size yytext));
<INITIAL>"}"    	 => (Tokens.LCURLY(yypos, yypos + size yytext));
<INITIAL>","    	 => (Tokens.COMMA(yypos, yypos + size yytext));


{id}                     => (Tokens.ID(yytext, yypos, yypos + size yytext));
{space}+        	 => (continue());
{digit}+                 => (Tokens.INTVAL(yytext, yypos, yypos + size yytext));
{quote}{noquote}*{quote} => (Tokens.STRING(yytext, yypos, yypos + size yytext));
"\n"                     => (linenum := (!linenum) + 1; continue());

. 			 => (error("unknown character " ^ yytext ^ " found on line : " ^Int.toString(!linenum)); continue());


