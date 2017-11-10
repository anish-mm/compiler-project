signature TOKENS =
sig
    type linenum (*int*)
    type token (*string*)
    val INT : linenum * linenum -> token
    val CHAR : linenum * linenum -> token
    val INTVAL : token * linenum * linenum -> token
    val STRING : token * linenum * linenum -> token
    val ASSIGN : linenum * linenum -> token
    val ID : token * linenum * linenum -> token
    val COMMA : linenum * linenum -> token

    val IF : linenum * linenum -> token
    val ELSE : linenum * linenum -> token
    val WHILE : linenum * linenum -> token
    val OR : linenum * linenum -> token
    val AND : linenum * linenum -> token
    val NOT : linenum * linenum -> token

    val EQ : linenum * linenum -> token
    val NEQ : linenum * linenum -> token
    val GT : linenum * linenum -> token
    val LT : linenum * linenum -> token
    val GEQ : linenum * linenum -> token
    val LEQ : linenum * linenum -> token
    val PLUS : linenum * linenum -> token
    val MINUS : linenum * linenum -> token
    val DIV : linenum * linenum -> token
    val MUL : linenum * linenum -> token
    val MOD : linenum * linenum -> token

    val SEMICOLON : linenum * linenum -> token
    val RPAREN : linenum * linenum -> token
    val LPAREN : linenum * linenum -> token
    val LCURLY : linenum * linenum -> token
    val RCURLY : linenum * linenum -> token

    val PRINT : linenum *linenum -> token

    val EOF : unit -> token
end
