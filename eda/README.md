# eda

Simulation of an "eindige deterministische automaat" or [deterministisc finite-state machine (DFSM)](https://en.wikipedia.org/wiki/Deterministic_finite_automaton).

## Make targets

| Target  | Description         |
| ------- | ------------------- |
| `all`   | `build` + `test`    |
| `build` | compiles the binary |
| `test`  | runs the tests      |

## usage

```sh
$ ./eda -h
Usage: ./eda [-h] <file>
  <file> -- the .eda file containing the EDA information

  Flags:
    -h  Show this help message
```

## .eda file format

```eda
0$a$1  # transition from state 0 to state 1 with character "a"
0$b$0
1$a$1 
1$b$0  # transition from state 1 to state 0 with character "b"
$1     # state 1 is an accepting state
```

Firstly you have the transitions `q$c$p`, where q and p are states and c is the character. So there's a transition from q to p with the character c.

Then after that you have all the accepting states `$q`, where q is an accepting state.

The states have to be numbers; state 0 is the starting state.

## examples

The `/examples` folder contains a few example .eda files.

### `contains_abba.eda`

This EDA accepts all words that contain "abba":

```sh
# TODO: show example after finishing
```

## TODO

- add .eda file format validation
- create a converter for jflap EDAs to the .eda file format
- if I'm really feeling it, support NDAs (non-deterministic EDAs)