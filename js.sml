structure  Conv :CONVSIG =
  struct

    fun convConstInteger (x)           = Int.toString(x)
    fun convConstString (x)            = x
    fun convVariable (x)               = x
    fun convBinOpStmt(x, binop, y)     = x ^ " " ^ binop ^ " " ^ y
    fun convUnOpStmt(unop, x)          = unop ^ x

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

  end
