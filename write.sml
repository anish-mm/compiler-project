


fun writeFile filename content =
    let val fd = TextIO.openOut filename
        val _ = TextIO.output (fd, content) handle e => (TextIO.closeOut fd; raise e)
        val _ = TextIO.closeOut fd
    in () end

structure a = Converter(Conv);
val astt = C.parse "dummy.txt";
val cont = a.convStmts astt;
writeFile "op.js" cont;

