:- module(usage, [usage/0]).

% Usage: ./eda [-h] <file>
%   <file> -- the .eda file containing the EDA information
%
%   Flags:
%     -h  Show this help message

% Print usage information
usage :-
    writeln('Usage: ./eda [-h] <file>'),
    writeln('  <file> -- the .eda file containing the EDA information'),
    nl,
    writeln('  Flags:'),
    writeln('    -h  Show this help message').
