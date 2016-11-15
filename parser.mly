%{
open Ast
open Lexing
open Format

let parse_error _ =
  let start_pos = Parsing.symbol_start_pos () in
  let end_pos = Parsing.symbol_end_pos () in
  failwith @@ sprintf "Parse error: (%d.%d-%d.%d)"
    start_pos.pos_lnum
    (start_pos.pos_cnum - start_pos.pos_bol)
    end_pos.pos_lnum
    (end_pos.pos_cnum - end_pos.pos_bol)
%}
