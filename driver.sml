(*structure Parse =
struct
    fun parse fileName = 
        let 
            val file = TextIO.openIn fileName
            fun get _ = TextIO.input file
		    val lexer = Mlex.makeLexer get
		    fun do_lex() = 
		        let val t = lexer()
		        in print t; print "\n";
		           if substring(t, 0, 3)="EOF" then () else do_lex()
	            end
        in  do_lex();
            TextIO.closeIn file
        end
end;

Parse.parse "dummy.txt";
*)

C.parse "dummy.txt";
