structure C =
struct
    structure CLrVals = CLrValsFun(structure Token = LrParser.Token)
    structure CLex    = CLexFun(structure Tokens = CLrVals.Tokens)
    structure CParser = Join( structure ParserData = CLrVals.ParserData
                              structure Lex        = CLex
                              structure LrParser   = LrParser
                            )    
end
