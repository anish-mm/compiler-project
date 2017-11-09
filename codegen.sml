functor Converter (Conv:CONVSIG) =
  struct
    fun convExp (exp) = case exp of
                          Const (Integer(x))    => Conv.convConstInteger(x)
                        | Const (String(x))     => Conv.convConstString(x)
                        | Variable (Var(x))     => Conv.convVariable(x)
                        | BinOpStmt (x,binop,y) => Conv.convBinOpStmt(convExp(x), convBinOp(binOp), convExp(y))
                        | UnOpStmt (unop,x)     => Conv.convUnOpStmt(convUnOp(unop), convExp(x))
  end
