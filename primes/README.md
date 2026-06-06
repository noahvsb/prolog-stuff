# primes

Calcalute all primes between 0 and 10^N (exclusive).

Below are the instructions for linux. If you don't have linux, install it, it's better. If you don't want to, you can always install WSL on Windows and if you're a MacOS user, my condolences.

## install (linux)

Install swipl:
```sh
sudo apt install swipl
```

Compile binary:
```sh
make build
```
(running just `make` does the build + test)

## usage (linux)

```sh
$ ./primes -h
Usage: primes [-h] [-m <mode>] [-n <N>] [-o <file>]
  Flags:
    -h  Show this help message
    -m  Runs a specific mode, the modes are:
          default -- prints all primes, this is the default (wow, unexpected)
          amount  -- prints the amount of primes
    -n  Generate primes between 0 and 10^<N> (exclusive), default is 6
    -o  Write output to <file> instead of stdout
```