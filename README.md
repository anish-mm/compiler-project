# compiler-project
A Compiler implementation done as part of Language Translators Course.

## Files

  * c.lex         
      * Contains the rules for Tokenizing the given c-
  * ast.sml
      * Contains the datatypes for abstract syntax tree representation for C-
  * c.grm
      * Contains the rules of grammar for analzing the tokens obtained from lexer
  * c.sml
      * Contains structure which unifies lexer and parser.
  * CONVSIG.sig 
      * Contains signature for target specific converter.
  * codegen.sml
      * Contains a functor Converter which takes a structure of signature CONVSIG and creates the code generator.
  * js.sml 
      * Contains a structure  of signature CONVSIG which can be fed into Converter to get code generator for javascript.
  * write.sml
      * is a Driver file to write output of code generator to a file
  * dummy.txt
      * a test program in C-

## Execution
* run `mlton c.mlb` to get executable.
* run `./c inp_file_name op_file_name` to generate code, where `inp_file_name` is the path to input file containing __C-__ code and `op_file_name` is the name of output file (without extensions).
* javascript code will be generated in __op_file_name.html__ file (js code will be inserted within `<script>` tags).
* to run the generated code, run `firefox op_file_name.html`

## Team Members
Anish M M, 111501006
Vaka Sai Nishanth, 111501038
