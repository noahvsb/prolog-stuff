:- module(usage, [usage/0, mode/1]).

% Usage: primes [-h] [-m <mode>] [-n <N>] [-o <file>]
%   Flags:
%     -h  Show this help message
%     -m  Runs a specific mode, the modes are:
%           default -- prints all primes and the total amount, this is the default (wow, unexpected)
%           list    -- prints only the primes
%           amount  -- prints only the amount of primes
%     -n  Generate primes between 0 and 10^<N>, default is 1
%     -o  Write output to <file> instead of stdout

% Print usage information
usage :-
    writeln('Usage: primes [-h] [-m <mode>] [-n <N>] [-o <file>]'),
    writeln('  Flags:'),
    writeln('    -h  Show this help message'),
    writeln('    -m  Runs a specific mode, the modes are:'),
    writeln('          default -- prints all primes and the total amount, this is the default (wow, unexpected)'),
    writeln('          list    -- prints only the primes'),
    writeln('          amount  -- prints only the amount of primes'),
    writeln('    -n  Generate primes between 0 and 10^<N>, default is 1'),
    writeln('    -o  Write output to <file> instead of stdout').

% all modes
mode(default).
mode(list).
mode(amount).