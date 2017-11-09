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



(*
    datatype stmt       = EmptyStmt
                        | AssignStmt of var * exp
                        | IfStmt of cond * stmt * stmt
    
    datatype stmt        = EmptyStmt
                         | Cond of cond 
                        | Assign of var * exp
                        | Ifexp of cond * exp * exp

    and exp = OperExp of exp * op * exp
            | Const of const
            | NilExp
    and const = Int of int | Char of string
    and var = Var of string
    and cond = OperExp of (cond * op  * cond)
                | var
                | const
    and op = And | Or | Plus | Minus | Times
*)
end
