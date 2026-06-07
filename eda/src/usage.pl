:- module(usage, [usage/0]).

% Usage: ./eda [-h] <file>
%   <file> -- the .eda file containing the EDA information
%
%   Flags:
%     -h  Show this help message
%
%   Note: don't forget to end your inputs with a dot (.)
%   Note: exit the program by inputting "q."

% Print usage information
usage :-
    writeln('Usage: ./eda [-h] <file>'),
    writeln('  <file> -- the .eda file containing the EDA information'),
    nl,
    writeln('  Flags:'),
    writeln('    -h  Show this help message'),
    nl,
    writeln('  Note: don\'t forget to end your inputs with a dot (.)'),
    writeln('  Note: exit the program by inputting "q."').
