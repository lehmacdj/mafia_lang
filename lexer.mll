{
open Parser
exception Eof

let incr_linenum lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
    lexbuf.Lexing.lex_curr_p <- { pos with
      Lexing.pos_lnum = pos.Lexing.pos_lnum + 1;
      Lexing.pos_bol = pos.Lexing.pos_cnum;
    }
}

let ident      = ("[a-z]" | "[A-Z]" | "_")*
let integer    = -? (['0'-'9'])+
let whitespace = [' ' '\t']
let boolean    = "true" | "false"
