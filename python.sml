structure  ConvPython :CONVSIG =
  struct

    val indentCount = ref 0
    fun indDec () = (indentCount := !indentCount - 1)
    fun indInc () = (indentCount := !indentCount + 1)
    fun indent x = case !x of
		       0 => (print (Int.toString(!x));"")
		     | _ => (x := !x - 1; print (Int.toString(!x)); (indent x) ^ "\t")

    fun convConstInteger (x)           = Int.toString(x)
    fun convConstString (x)            = x
    fun convVariable (x)               = x
    fun convBinOpStmt(x, binop, y)     = x ^ " " ^ binop ^ " " ^ y
    fun convUnOpStmt(unop, x)          = unop ^ "(" ^ x ^ ")"

    fun convPlus ()  = "+"
    fun convDiv ()   = "/"
    fun convMod ()   = "%"
    fun convOr ()    = "or"
    fun convAnd ()   = "and"
    fun convMinus () = "-"
    fun convMul ()   = "*"
    fun convEq ()    = "=="
    fun convNeq ()   = "!="
    fun convGt ()    = ">"
    fun convLt ()    = "<"
    fun convLeq ()   = "<="
    fun convGeq ()   = ">="

    fun convUminus () = "-"
    fun convNot ()    = "not"

    fun convAssignStmt (x, y)   = x ^ " = " ^ y
    fun convDeclStmtInt (x)     = x
    fun convDeclStmtChar (x)    = x

    fun convIfStmt (_, "", _)   = (TextIO.output(TextIO.stdErr, "error! no statements provided for if!\n"); OS.Process.exit OS.Process.failure)
    |   convIfStmt (x, y, z)    = case z of
				    "" => "if (" ^ x ^ ") :\n" ^ (indInc(); indent indentCount; y) ^ (indDec();"")
				  | _  => "if (" ^ x ^ ") :\n" ^ (indInc(); indent indentCount; y) ^ (indDec(); "\nelse\n") ^ (indInc(); indent indentCount; z) ^ (indDec(); "")

    fun convWhileStmt (_, "")   = (TextIO.output(TextIO.stdErr, "error! no statements provided for while!\n"); OS.Process.exit OS.Process.failure)
    |   convWhileStmt (x, y)    = "while (" ^ x ^ ") :\n" ^ (indInc(); indent indentCount; y) ^ (indDec();"")

    fun convCompStmt (x)        = x
    fun convEmptyStmt ()        = ""
    fun convPrintStmt (x)       = "print " ^ x

    fun convStmtSepe () = "\n" ^ (indent indentCount)

    fun convPreProc ()  = ""
    fun convPosProc() = ""
  end
