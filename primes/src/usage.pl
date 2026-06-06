:- module(usage, [usage/0]).

% Usage: primes [-h] [-m <mode>] [-n <N>] [-o <file>]
%   Flags:
%     -h  Show this help message
%     -m  Runs a specific mode, the modes are:
%           default -- prints all primes, this is the default (wow, unexpected)
%           amount  -- prints the amount of primes
%     -n  Generate primes between 0 and 10^<N> (exclusive), default is 6.
%     -o  Write output to <file> instead of stdout.

% Print usage information
usage :-
    writeln('Usage: primes [-h] [-m <mode>] [-n <N>] [-o <file>]'),
    writeln('  Flags:'),
    writeln('    -h  Show this help message'),
    writeln('    -m  Runs a specific mode, the modes are:'),
    writeln('          default -- prints all primes, this is the default (wow, unexpected)'),
    writeln('          amount  -- prints the amount of primes'),
    writeln('    -n  Generate primes between 0 and 10^<N> (exclusive), default is 6.'),
    writeln('    -o  Write output to <file> instead of stdout.').