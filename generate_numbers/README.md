# generate numbers

Generate all numbers of a type (e.g. prime, harshad) between 0 and 10^N.

## overview

| Type   | Description                                       |
| ------ | ------------------------------------------------- |
| primes | Numbers that can only be divided by 1 and itself. |

## instructions

Below are the instructions for linux. If you don't have linux, install it, it's better. If you don't want to, you can always install WSL on Windows and if you're a MacOS user, my condolences.

### install (linux)

Install swipl:
```sh
sudo apt install swipl
```
(for non-Debian distributions, figure it out yourself, you did this to yourself)

Compile binary:
```sh
make build
```

### usage (linux)

```sh
$ ./primes -h
Usage: primes [-h] [-m <mode>] [-n <N>] [-o <file>]
  Flags:
    -h  Show this help message
    -m  Runs a specific mode, the modes are:
          default -- prints all primes and the total amount, this is the default (wow, unexpected)
          list    -- prints only the primes
          amount  -- prints only the amount of primes
    -n  Generate primes between 0 and 10^<N>, default is 1
    -o  Write output to <file> instead of stdout
```

### Make targets

| Target  | Description       |
| ------- | ----------------- |
| `all`   | `build` + `test`  |
| `build` | builds the binary |
| `test`  | runs the tests    |