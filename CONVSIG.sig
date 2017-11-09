signature CONVSIG =
sig
    val convConstInteger : int -> string
    val convConstString : string -> string
    val convVariable : string -> string
    val convBinOpStmt : string * string * string -> string
    val convUnOpStmt : string * string -> string

    val convPlus : unit -> string
    val convMinus : unit -> string
    val convDiv : unit -> string
    val convMod : unit -> string
    val convMul : unit -> string
    val convOr : unit -> string
    val convAnd : unit -> string
    val convEq : unit -> string 
    val convNeq : unit -> string 
    val convGt : unit -> string 
    val convLt : unit -> string 
    val convLeq : unit -> string 
    val convGeq : unit -> string 

    val convUminus : unit -> string
    val convNot : unit -> string

    val convAssignStmt : string * string -> string
    val convDeclStmtInt : string -> string
    val convDeclStmtChar : string -> string
    val convIfStmt : string * string * string -> string
    val convWhileStmt : string * string -> string
    val convCompStmt : string -> string  
end
