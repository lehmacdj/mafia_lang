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

let role       = (['a'-'z'] | '_') (['A'-'Z'] | ['a'-'z'] | '_')*
let action     = (['A'-'Z'] | '_') (['A'-'Z'] | ['a'-'z'] | '_')*
let integer    = (['0'-'9'])+
let whitespace = [' ' '\t']

rule token = parse
  | whitespace { token lexbuf } (* skip blanks *)
  | ['\n'] { incr_linenum lexbuf; token lexbuf }
  | "{" { LBRACE } (* group class properties together *)
  | "}" { RBRACE } (* group class properties together *)
  | "(" { LPAREN } (* group actions together *)
  | ")" { RPAREN } (* group actions together *)
  | "define" { DEFINE } (* required for defining e.g. `define action` *)
  | "action" { ACTION } (* define new actions *)
  | "role" { ROLE } (* define new roles *)
  | "team" { TEAM } (* define new teams *)
  | "extends" { EXTEND } (* create a new action or role extending another *)

  (* primitive time units *)
  | "night" { NIGHT } (* night action *)
  | "day" { DAY } (* day action *)
  | "block" { BLOCK } (* a block has been formed *)

  (* primitive time specifiers *)
  | "before" { BEFORE } (* before something happens *)
  | "after" { AFTER } (* after something happens *)

  (* primitive people groups *)
  | "all" { ALL } (* everyone *)
  | "matching" { MATCHING } (* everyone matching a group *)

  (* primitive actions *)
  | "kill" { KILL } (* kill a person *)
  | "check" { CHECK } (* check something about a person *)

  | "passive" { PASSIVE } (* passive ability *)
  | "when" { WHEN } (* define when an action should occur *)
  | "kill" { KILL } (* denote killing an enemy *)
  | "decorate" { DECORATE } (* decorate an ability; e.g. arsonist, milkman *)
  | "with" { WITH } (* use with some abilities e.g. `decorate x with "y"` *)
  | "visit" { VISIT } (* visit a player *)
  | role as r { ROLE r } (* identifier for roles must be capital *)
  | action as a { ACTION a } (* identifier for actions must be lower case *)
  | integer as i { INT i } (* int for actions that require arguments *)
  | '"' ([^'"']* as str) '"' { STRING str }
