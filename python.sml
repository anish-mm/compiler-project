structure  ConvPython :CONVSIG =
  struct

    val indentCount = ref 0
    fun indDec () = (indentCount := !indentCount - 1)
    fun indInc () = (indentCount := !indentCount + 1)
    fun indent x = case !x of
		       0 => (print (Int.toString(!x));"")
		     | _ => (x := !x - 1; print (Int.toString(!x)); (indent x) ^ "\t")

  end
