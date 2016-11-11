# mafia_lang
A general purpose descriptive language defining mafia roles.

Identifiers have meaning beyond their name because they are also used as the
name of the thing.

## Primitives
- `nop` - an action that does nothing; also has no text associated with it
- `select` - returns a player that is then the target of an `action`
- `collect` - keep track of some data; takes three arguments the collection name
   a key and a value
- `choose` - make a choice of an item from a collection
- `and`, `&` - combine two actions that should happen simultaneously (e.g.
  jailer: roleblock and protect)
- `or`, `|` - give the choice to do something (e.g. vigilante: kill or no do
  nothing, first option is thumbs up option, second is thumbs down)
- `then` - do something then something else; useful for sequencing actions like
  jailer that must occur in distinct phases; helps set precedence of actions
- `action` - define an action; takes a name and an action, name defines what
  that action is called in descriptions
- `team` - define a team; a team needs a predicate
- `win` - define a win condition; needs a boolean predicate based on some state
  object
- `role` - define a role; needs a win condition, team, and action
- `true` - predicate that is always true
- `false` - predicate that is always false
- `when` - predicate for when something should happen; e.g. win when ...; can
  also be used to define pseudo if statements
- `where` - perform an action on everything that matches a predicate
- `.` access a field from a collection (maybe [] would be better since it is
  more idiomatic for accessing from a collection)
- `>`,`<`,`=` - symbols for comparison operators; can be combined to form more
  complex comparison operators (e.g. `>=`, `<>`, `=<`, `>` are all valid and
  mean "greater than or equal", "not equal", "less than or equal", and "greater
  than", respectively. Comparison operators involving `>` or `<` are not defined
  roles, actions, teams, and win conditions; for these only `=` and `<>` are
  defined
- `+`, `*`, `/`, `^`, `-` - integer operations
- `/-?[0-9]+/` - an integer literal
