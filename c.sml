structure C =
struct
    structure CLrVals = CLrValsFun(structure Token = LrParser.Token)
    structure CLex    = CLexFun(structure Tokens = CLrVals.Tokens)
    structure CParser = Join( structure ParserData = CLrVals.ParserData
                              structure Lex        = CLex
                              structure LrParser   = LrParser
                            )    

    (*given a lexer, function invokes the parser*) 
    fun invoke lexstream =
        let fun print_error (s, i:int, _) =
                TextIO.output(TextIO.stdOut,
                              "Error, line " ^ (Int.toString i) ^ ", " ^ s ^ "\n")
        in CParser.parse(0, lexstream, print_error, ())
        end    
end
