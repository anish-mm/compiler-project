
fun writeFile filename content =
    let val fd = TextIO.openOut filename
        val _ = TextIO.output (fd, content) handle e => (TextIO.closeOut fd; raise e)
        val _ = TextIO.closeOut fd
    in () end

structure a    	= Converter(ConvJs);

val convertFromAst = case CommandLine.arguments() of
                       [inpf,opf]       => let val astt 	    = C.parse inpf
                                               val cont 	    = a.convert astt
                                           in 
                                                writeFile (opf ^ ".html") cont
                                               
                                           end
                     | _ => (TextIO.output(TextIO.stdErr, "usage: ./c input_file_name output_file_name\n"); OS.Process.exit OS.Process.failure)

