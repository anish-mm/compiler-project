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

  end
