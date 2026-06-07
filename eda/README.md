# eda

Simulation of an "eindige deterministische automaat" or [deterministisc finite-state machine (DFSM)](https://en.wikipedia.org/wiki/Deterministic_finite_automaton).

## Make targets

| Target  | Description         |
| ------- | ------------------- |
| `all`   | `build` + `test`    |
| `build` | compiles the binary |
| `test`  | runs the tests      |

## usage

```
$ ./eda -h
Usage: ./eda [-h] <file>
  <file> -- the .eda file containing the EDA information

  Flags:
    -h  Show this help message

  Note: don't forget to end your inputs with a dot (.)
  Note: exit the program by inputting "q."
```

## .eda file format

```eda
# test EDA
# accepts words with alfabet {a,b} ending in a

0$a$1
0$b$0
1$a$1
1$b$0

$1
```

Comments starting with # are allowed, but only at the top of the file. They are used to describe the EDA. They are ofcourse optional.

Secondly you have the transitions `q$c$p`, where q and p are states and c is the character. So there's a transition from q to p with the character c.

Finally you have all the accepting states `$q`, where q is an accepting state.

The states have to be numbers; state 0 is the starting state.

These 3 parts need to be in this exact order or it will fail. You can have as few or many newlines as you want, as long as you don't have 2 transitions on the same line. (Maybe in the future I will let transitions be seperated by a # or something so they can appear on the same line.)

## examples

The `/examples` folder contains a few example .eda files.

### `contains_abba.eda`

This EDA accepts all words with alfabet {a,b} that contain "abba":

```sh
$ ./eda examples/abba.eda 
|: abba.
accepted
|: aabb.
rejected
|: abbac.
rejected   # rejected, because c is not in the alfabet {a,b}
|: babbab.
accepted
|: q.
```
