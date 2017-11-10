structure  ConvJs :CONVSIG =
  struct

    fun convConstInteger (x)           = Int.toString(x)
    fun convConstString (x)            = x
    fun convVariable (x)               = x
    fun convBinOpStmt(x, binop, y)     = x ^ " " ^ binop ^ " " ^ y
    fun convUnOpStmt(unop, x)          = unop ^ "(" ^ x ^ ")"

    fun convPlus ()  = "+"
    fun convDiv ()   = "/"
    fun convMod ()   = "%"
    fun convOr ()    = "||"
    fun convAnd ()   = "&&"
    fun convMinus () = "-"
    fun convMul ()   = "*"
    fun convEq ()    = "=="
    fun convNeq ()   = "!="
    fun convGt ()    = ">"
    fun convLt ()    = "<"
    fun convLeq ()   = "<="
    fun convGeq ()   = ">="

    fun convUminus () = "-"
    fun convNot ()    = "!"

    fun convAssignStmt (x, y)   = x ^ " = " ^ y
    fun convDeclStmtInt (x)     = "var " ^ x
    fun convDeclStmtChar (x)    = "var " ^ x
    fun convIfStmt (x, y, z)    = case z of
                                    "" => "if (" ^ x ^ ")\n" ^ y ^ "\n"
                                  | _  => "if (" ^ x ^ ")\n" ^ y ^ "\nelse\n" ^ z
    fun convWhileStmt (x, y)    = "while (" ^ x ^ ")\n" ^ y
    fun convCompStmt (x)        = "{\n" ^ x ^ "}"
    fun convEmptyStmt ()        = ""
    fun convPrintStmt (x)       = "console.log (" ^ x ^ ")"

    fun convStmtSepe () = ";\n"

    fun convPreProc ()  = "<!DOCTYPE html>\n<title>\n<script>\n"
    fun convPosProc() = "</script>\n</title>\n</html>\n"
  end
