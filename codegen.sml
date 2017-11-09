signature CONVERTER =
sig
    val convBinOp : Ast.binOp -> string
    val convUnOp : Ast.unOp -> string
    val convExp : Ast.stmt -> string
    val convStmt : Ast.stmt -> string
    val convStmts : Ast.stmt list -> string
    val convStmtSep : unit -> string
end

functor Converter (Conv:CONVSIG) : CONVERTER =
  struct

    val convStmtSep = Conv.convStmtSepe
    
    fun convBinOp (binop) = case  binop of
                              Ast.Plus   => Conv.convPlus()
                            | Ast.Minus  => Conv.convMinus()
                            | Ast.Mul    => Conv.convMul()
                            | Ast.Div    => Conv.convDiv()
                            | Ast.Mod    => Conv.convMod()
                            | Ast.Or     => Conv.convOr()
                            | Ast.And    => Conv.convAnd()
                            | Ast.Eq     => Conv.convEq()
                            | Ast.Neq    => Conv.convNeq()
                            | Ast.Gt     => Conv.convGt()
                            | Ast.Lt     => Conv.convLt()
                            | Ast.Leq    => Conv.convLeq()
                            | Ast.Geq    => Conv.convGeq()

    fun convUnOp (unop) = case unop of
                            Ast.Uminus   => Conv.convUminus()
                          | Ast.Not      => Conv.convNot()
    fun convExp (exp) = case exp of
                          Ast.Const (Ast.Integer(x))    => Conv.convConstInteger(x)
                        | Ast.Const (Ast.String(x))     => Conv.convConstString(x)
                        | Ast.Variable (Ast.Var(x))     => Conv.convVariable(x)
                        | Ast.BinOpStmt (x,binop,y) 	=> Conv.convBinOpStmt(convExp(x), convBinOp(binop), convExp(y))
                        | Ast.UnOpStmt (unop,x)     	=> Conv.convUnOpStmt(convUnOp(unop), convExp(x))

    fun convStmt (stmt) = case stmt of
                            Ast.AssignStmt (Ast.Var(x), y) => Conv.convAssignStmt(x, convExp(y))
                          | Ast.Variable (Ast.Var(x))      => Conv.convVariable(x)
                          | Ast.DeclStmt (Ast.INT, x)      => Conv.convDeclStmtInt(convStmt(x))
                          | Ast.DeclStmt (Ast.CHAR, x)     => Conv.convDeclStmtChar(convStmt(x))
                          | Ast.IfStmt (x, y, z)       	   => Conv.convIfStmt(convExp(x), convStmt(y), convStmt(z))
                          | Ast.WhileStmt(x, y)            => Conv.convWhileStmt(convExp(x), convStmt(y))
                          | Ast.CompStmt(x)                => Conv.convCompStmt(convStmts(x))

    and convStmts (stmts) = case stmts of
                              x::xs => convStmt(x) ^ convStmtSep() ^ convStmts(xs)
                           |  []    => ""

  end
