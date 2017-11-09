functor Converter (Conv:CONVSIG) =
  struct
    fun convExp (exp) = case exp of
                          Const (Integer(x))    => Conv.convConstInteger(x)
                        | Const (String(x))     => Conv.convConstString(x)
                        | Variable (Var(x))     => Conv.convVariable(x)
                        | BinOpStmt (x,binop,y) => Conv.convBinOpStmt(convExp(x), convBinOp(binOp), convExp(y))
                        | UnOpStmt (unop,x)     => Conv.convUnOpStmt(convUnOp(unop), convExp(x))

    fun convBinOp (binop) = case  binop of
                              Plus   => Conv.convPlus
                            | Minus  => Conv.convMinus
                            | Mul    => Conv.convMul
                            | Div    => Conv.convDiv
                            | Mod    => Conv.convMod
                            | Or     => Conv.convOr
                            | And    => Conv.convAnd
                            | Eq     => Conv.convEq
                            | Neq    => Conv.convNeq
                            | Gt     => Conv.convGt
                            | Lt     => Conv.convLt
                            | Leq    => Conv.convLeq
                            | Geq    => Conv.convGeq

    fun convUnOp (unop) = case unop of
                            Uminus   => Conv.convUminus
                          | Not      => Conv.convNot

    fun convStmt (stmt) = case stmt of
                            AssignStmt (Var(x), y) => Conv.convAssignStmt(x, convExp(y))
                          | Variable (Var(x))      => Conv.convVariable(x)
                          | DeclStmt (INT, x)      => Conv.convDeclStmtInt(convStmt(x))
                          | DeclStmt (CHAR, x)     => Conv.convDeclStmtChar(convStmt(x))
                          | IfStmt (x, y, z)       => Conv.convIfStmt(convExp(x), convStmt(y), convStmt(z))
                          | WhileStmt(x, y)        => Conv.convWhileStmt(convExp(x), convStmt(y))
                          | CompStmt(x::xs)        => Conv.convCompStmt(convStmt(x), convStmts(xs))

    fun convStmts (stmts) = case stmts  of
                              x::xs => convStmt(x) ^ convStmts(xs)
                           |  []    => ""
  end
