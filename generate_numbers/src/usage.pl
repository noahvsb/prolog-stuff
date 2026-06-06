:- module(usage, [usage/0, type/1, mode/1]).

% Usage: ./generate_numbers [-h] -t <type> [-m <mode>] [-n <N>] [-o <file>]
%   Flags:
%     -h  Show this help message
%     -t  The type of number to generate:
%           prime -- Numbers that can only be divided by 1 and itself
%     -m  Runs a specific mode, the modes are:
%           default -- prints all numbers and the total amount, this is the default (wow, unexpected)
%           list    -- prints only the numbers
%           amount  -- prints only the amount of numbers
%     -n  Generate numbers between 0 and 10^<N>, default is 1
%     -o  Write output to <file> instead of stdout
%   Note: the order of the flags doesn't matter

% Print usage information
usage :-
    writeln('Usage: ./generate_numbers [-h] -t <type> [-m <mode>] [-n <N>] [-o <file>]'),
    writeln('  Flags:'),
    writeln('    -h  Show this help message'),
    writeln('    -t  The type of number to generate:'),
    writeln('          prime -- Numbers that can only be divided by 1 and itself'),
    writeln('    -m  Runs a specific mode, the modes are:'),
    writeln('          default -- prints all numbers and the total amount, this is the default (wow, unexpected)'),
    writeln('          list    -- prints only the numbers'),
    writeln('          amount  -- prints only the amount of numbers'),
    writeln('    -n  Generate numbers between 0 and 10^<N>, default is 1'),
    writeln('    -o  Write output to <file> instead of stdout'),
    writeln('  Note: the order of the flags doesn\'t matter').

% types
type(prime).

% modes
mode(default).
mode(list).
mode(amount).
