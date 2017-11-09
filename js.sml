structure  Conv :CONVSIG =
  struct

    fun convConstInteger (x)           = Int.toString(x)
    fun convConstString (x)            = x
    fun convVariable (x)               = x
    fun convBinOpStmt(x, binop, y)     = x ^ " " ^ binop ^ " " ^ y
    fun convUnOpStmt(unop, x)          = unop ^ x

  end
