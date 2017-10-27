structure Tokens : TOKENS = 
struct
    type linenum 	= int
    type token 		= string
    fun INT(i, j) 	= "INT  " ^ Int.toString(i)
    fun CHAR(i, j)  	= "CHAR  " ^ Int.toString(i)
    fun INTVAL(c, i, j) = "INT("^c^")  " ^ Int.toString(i)
    fun STRING(s, i, j) = "STRING("^s^")  " ^ Int.toString(i)
    fun IF(i, j) 	= "IF  " ^ Int.toString(i)
    fun ELSE(i, j) 	= "ELSE  " ^ Int.toString(i)
    fun EQ(i, j)	= "EQ  " ^ Int.toString(i)
    fun NEQ(i, j) 	= "NEQ " ^ Int.toString(i)
    fun GT(i, j) 	= "GT  " ^ Int.toString(i)
    fun LT(i, j) 	= "LT  " ^ Int.toString(i)
    fun GEQ(i,j) 	= "GEQ   " ^ Int.toString(i)
    fun LEQ(i,j) 	= "LEQ   " ^ Int.toString(i)
    fun PLUS(i, j) 	= "PLUS  " ^ Int.toString(i)
    fun MINUS(i, j) 	= "MINUS  " ^ Int.toString(i)
    fun MUL(i, j) 	= "MUL  " ^ Int.toString(i)
    fun DIV(i, j) 	= "DIV  " ^ Int.toString(i)
    fun SEMICOLON(i, j) = "SEMICOLON  " ^ Int.toString(i)
    fun ID(s, i, j) 	= "ID("^s^")  " ^ Int.toString(i)
    fun RPAREN(i,j) 	= "RPAREN   " ^ Int.toString(i)
    fun LPAREN(i,j) 	= "LPAREN   " ^ Int.toString(i)
    fun LCURLY(i,j) 	= "LCURLY   " ^ Int.toString(i)
    fun RCURLY(i,j) 	= "RCURLY   " ^ Int.toString(i)
    fun EOF() 	    	= "EOF"
    fun WHILE(i,j) 	= "WHILE   " ^ Int.toString(i)
    fun OR(i,j) 	= "OR   " ^ Int.toString(i)
    fun AND(i,j) 	= "AND   " ^ Int.toString(i)
    fun COMA(i,j) 	= "COMA   " ^ Int.toString(i)
    fun MOD(i,j) 	= "MOD   " ^ Int.toString(i)
end 

