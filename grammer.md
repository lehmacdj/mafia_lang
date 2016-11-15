# This file overview the grammar for several statements in mafialang
+ types are defined by ~name
+ ::= is used to define things
+ ... means that the previous thing may be repeated infinitely
+ something enclosed in /s is a regex
+ | distinguishes variants

## action_definition
binds an identifier to an action

    ~action_definition ::= action ~identifier(~description) ~arg_list { ~action }

## ~var_list
a list of variables, represented as space separated variables

    ~var_list ::= ~arg ...

## ~var
    ~var ::= $~identifier

## ~identifier
    ~identifier ::= /([a-z] | [A-Z] | _)*/

## ~description
    ~description ::= ~string

## ~string
    ~string ::= /"(.*)"/

## ~action
    ~action ::=
        | nop
        | choose
        | select
        | ~collection_set
        | ~identifier ~arg_list
        | ~action ~when_clause
        | ~action ~and ~action
        | ~action ~or ~action
        | ~action ~then ~action

## ~when_cluase
    ~when_clause ::= when ~predicate

## ~predicate
    ~predicate ::=
        | true
        | false
        | not ~predicate
        | ~value ~eqop ~value
        | ~int ~cmpop ~int

## ~int
    ~int ::=
        | ~int_literal
        | ~int ~mathop ~int

## ~mathop
    ~mathop ::= + | - | * | /

## ~cmpop
    ~cmpop ::= > | < | >= | <=

## ~eqop
    ~eqop ::= = | <>

## ~int_literal
    ~int_literal ::= /-?[1-9][0-9]*/

## ~type
    ~type ::= string | integer | team | player | collection | action | predicate
