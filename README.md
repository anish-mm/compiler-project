# compiler-project
A Compiler implementation done as part of Language Translators Course.

This Repository contains :-

  c.lex         => Contains the rules for Tokenizing the given c-
  ast.sml       => Contains the datatypes for abstract syntax tree representation for C-
  c.grm         => Contains the rules of grammar for analzing the tokens obtained from lexer
  c.sml         => Contains structure which unifies lexer and parser.
  CONVSIG.sig   => Contains signature for target specific converter.
  codegen.sml   => Contains a functor Converter which takes a structure of signature CONVSIG and creates the code generator.
  js.sml        => Contains a structure  of signature CONVSIG which can be fed into Converter to get code generator for javascript.
  write.sml     => is a Driver file to write output of code generator to a file
  dummy.txt     => a test program in C-
