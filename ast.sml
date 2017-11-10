structure Ast =
struct
    datatype binOp = Plus | Minus | Mul | Div | Mod
                   | Or | And
                   | Eq | Neq | Gt | Lt | Leq | Geq
    datatype unOp  = Uminus | Not
    datatype immut = Integer of int | String of string
    datatype mut   = Var of string
    datatype types = INT | CHAR

    datatype stmt  = EmptyStmt
                   | Const of immut
                   | Variable of mut
                   | AssignStmt of mut * stmt
                   | DeclStmt of types * stmt
                   | IfStmt of stmt * stmt * stmt
                   | BinOpStmt of stmt * binOp * stmt
                   | UnOpStmt of unOp * stmt
                   | WhileStmt of stmt * stmt
                   | CompStmt of stmt list
                   | PrintStmt of stmt

end
