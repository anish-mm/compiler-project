
type pos = int
type lexresult = Tokens.token
fun eof() = Tokens.EOF()

%%
space = [\ \t];
letter = [a-zA-Z];
digit = [0-9];
id = {letter}({letter}|{digit}|_)*;
quote = ["];
noquote = [^"];
%%

<INITIAL>"int" 	=> (Tokens.INT(yypos, yypos + size yytext));
<INITIAL>"char" => (Tokens.CHAR(yypos, yypos + size yytext);
<INITIAL>"if"	=> (Tokens.IF(yypos, yypos + size yytext));
<INITIAL>"="	=> (Tokens.EQ(yypos, yypos + size yytext));
<INITIAL>"!=" 	=> (Tokens.NEQ(yypos, yypos + size yytext));
<INITIAL>">" 	=> (Tokens.GT(yypos, yypos + size yytext));
<INITIAL>"<" 	=> (Tokens.LT(yypos, yypos + size yytext));
<INITIAL>"+" 	=> (Tokens.PLUS(yypos, yypos + size yytext));
<INITIAL>"-" 	=> (Tokens.MINUS(yypos, yypos + size yytext));
<INITIAL>"*" 	=> (Tokens.MUL(yypos, yypos + size yytext));
<INITIAL>"/" 	=> (Tokens.DIV(yypos, yypos + size yytext));
<INITIAL>";"    => (Tokens.SEMICOLON(yypos, yypos + size yytext));
<INITIAL>"(" 	=> (Tokens.LPAREN(yypos, yypos + size yytext));
<INITIAL>")" 	=> (Tokens.RPAREN(yypos, yypos + size yytext));
<INITIAL>"{" 	=> (Tokens.LCURLY(yypos, yypos + size yytext));
<INITIAL>"}" 	=> (Tokens.LCURLY(yypos, yypos + size yytext));
{id}            => (Tokens.ID(yytext, yypos, yypos + size yytext));
{space}+ 	=> (continue());
{digit}+        => (Tokens.INTVAL(yytext, yypos, yypos + size yytext));
{quote}{noquote}*{quote} => (Tokens.STRING(yytext, yypos, yypos + size yytext));


