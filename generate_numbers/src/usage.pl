:- module(usage, [usage/0, mode/1]).

% Usage: ./generate_numbers [-h] [-m <mode>] [-n <N>] [-o <file>]
%   Flags:
%     -h  Show this help message
%     -m  Runs a specific mode, the modes are:
%           default -- prints all numbers and the total amount, this is the default (wow, unexpected)
%           list    -- prints only the numbers
%           amount  -- prints only the amount of numbers
%     -n  Generate numbers between 0 and 10^<N>, default is 1
%     -o  Write output to <file> instead of stdout

% Print usage information
usage :-
    writeln('Usage: ./generate_numbers [-h] [-m <mode>] [-n <N>] [-o <file>]'),
    writeln('  Flags:'),
    writeln('    -h  Show this help message'),
    writeln('    -m  Runs a specific mode, the modes are:'),
    writeln('          default -- prints all numbers and the total amount, this is the default (wow, unexpected)'),
    writeln('          list    -- prints only the numbers'),
    writeln('          amount  -- prints only the amount of numbers'),
    writeln('    -n  Generate numbers between 0 and 10^<N>, default is 1'),
    writeln('    -o  Write output to <file> instead of stdout').

% all modes
mode(default).
mode(list).
mode(amount).