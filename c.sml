structure C =
struct
    structure CLrVals = CLrValsFun(structure Token = LrParser.Token)
    structure CLex    = CLexFun(structure Tokens = CLrVals.Tokens)
    structure CParser = Join( structure ParserData = CLrVals.ParserData
                              structure Lex        = CLex
                              structure LrParser   = LrParser
                            )    

    (*given a lexer, function invokes the parser*) 
(*    fun invoke lexstream =
        let fun print_error (s, i:int, _) =
                TextIO.output(TextIO.stdOut,
                              "Error, line " ^ (Int.toString i) ^ ", " ^ s ^ "\n")
        in CParser.parse(0, lexstream, print_error, ())
        end    *)

    fun parse fileName =
        let
            val file = TextIO.openIn fileName
            fun get _ = TextIO.input file
            val lexer = LrParser.Stream.streamify(CLex.makeLexer get)
            
            fun print_error(s, i, j) = print ("Error : " ^ s ^ ", position : " ^  (Int.toString i) ^" "^  (Int.toString j))
            val (ast, _) = CParser.parse(0, lexer, print_error, ())
        in
            TextIO.closeIn file;
            ast
        end
end
