type ident = string

type expr =
  | Integer of integer
  | Predicate of predicate
  | Action of action
  | Collection of collection

and integer =
  | Literal of int
  | Add of integer * integer
  | Subtract of integer * integer
  | Multiply of integer * integer
  | Divide of integer * integer

and action =
  | Nop
  | Choose
  | Select
  | Set of collection * expr
  | When of action * predicate
  | AAnd of action * action
  | AOr of action * action
  | Then of action * action

and predicate =
  | IntGt of integer * integer
  | IntLt of integer * integer
  | IntEq of integer * integer
  | IntLe of integer * integer
  | IntGe of integer * integer
  | StrGt of string * string
  | StrLt of string * string
  | StrEq of string * string
  | StrLe of string * string
  | StrGe of string * string
  | And of predicate * predicate
  | Or of predicate * predicate

and arg = expr

and collection = (ident, expr) Hashtbl.t
