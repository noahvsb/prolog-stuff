:- module(primes, [primes/3]).

% -------------
% ENTRYPOINT
% -------------

% primes(+Mode, +N, +OutFile)
% Executes the primes command for the specific Mode and N, writing to stdout or an optional OutFile.
primes(Mode, N, null) :-
    set_mode(Mode),
    write_arguments(Mode, N, null). % TODO: call the core logic
primes(Mode, N, OutFile) :-
    set_mode(Mode),
    init_output(OutFile, Output, Stream),
    write_arguments(Mode, N, OutFile), % TODO: call the core logic
    close_output(Output, Stream).

% temporary functor for debugging
write_arguments(Mode, N, OutFile) :-
    writeln('Arguments:'),
    write('  mode     -- '), write(Mode), nl,
    write('  n        -- '), write(N), nl,
    write('  out file -- '), write(OutFile), nl.

% -------------
% CORE LOGIC
% -------------

% TODO

% -------------
% HELPERS
% -------------

% set_mode(+Mode)
% Stores the current mode in a global variable.
set_mode(Mode) :-
    nb_setval(execution_mode, Mode).


% init_output(+OutFile, -Output, -Stream)
% Opens the OutFile and sets it as the current output, returns it and saves the previous Stream for restoration.
init_output(OutFile, Output, Stream) :-
    open(OutFile, write, Output),
    current_output(Stream),
    set_output(Output).

% close_output(+Output, +Stream)
% Closes the Output and restores the Stream.
close_output(Output, Stream) :-
    close(Output),
    set_output(Stream).