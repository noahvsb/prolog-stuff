:- module(entrypoint, [entrypoint/3]).

:- use_module(primes).

% -----------
% ENTRYPOINT
% -----------

% entrypoint(+Mode, +N, +OutFile)
% Entrypoint for the command.
entrypoint(Mode, N, null) :- !,
    generate_numbers(type(prime), Mode, N),
    print_result(Mode).
entrypoint(Mode, N, OutFile) :-
    init_output(OutFile, Output, Stream),
    generate_numbers(type(prime), Mode, N),
    print_result(Mode),
    close_output(Output, Stream).

% -----------------
% GENERATE NUMBERS
% -----------------

generate_numbers(type(prime), Mode, N) :- generate_primes(Mode, N).

% ----------------
% PRINT RESULTS
% ----------------

% print_result(+Mode)
% Prints the result depending on the mode:
%   default -- prints "Total:" + the amount of numbers
%   list    -- prints nothing extra
%   amount  -- prints the amount of numbers, without the "Total:"
print_result(default) :- nl, write('Total: '), print_count(type(prime)).
print_result(list).
print_result(amount) :- print_count(type(prime)).

print_count(type(prime)) :- aggregate_all(count, prime(_), C), writeln(C).

% ---------------
% OUTPUT HELPERS
% ---------------

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