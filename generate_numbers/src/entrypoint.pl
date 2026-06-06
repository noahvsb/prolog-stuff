:- module(entrypoint, [entrypoint/4]).

:- use_module(prime).

% -----------
% ENTRYPOINT
% -----------

% entrypoint(+Type, +Mode, +N, +OutFile)
% Entrypoint for the command
entrypoint(Type, Mode, N, null) :- !, core(Type, Mode, N).
entrypoint(Type, Mode, N, OutFile) :-
    init_output(OutFile, Output, Stream),
    core(Type, Mode, N),
    close_output(Output, Stream).

% -----------------
% CORE
% -----------------

% core(+Type, +Mode, +N)
% retracts the dynamic, generates the numbers and prints the result
core(Type, Mode, N) :-
    retract_dynamic(Type),
    generate_numbers(Type, Mode, N),
    print_result(Type, Mode).

% retract_dynamic(+Type)
% does a retractall on the dynamic corresponding with the type
retract_dynamic(prime) :- retractall(prime_number(_)).

% generate_numbers(+Type)
% Generates all numbers of a specific type between 0 and 10^N
generate_numbers(Type, Mode, N) :-
    L = 0,
    U is 10^N,
    forall(between(L, U, X), f(Type, Mode, X)).

f(prime, Mode, X) :- f_prime(Mode, X).

% print_result(+Type, +Mode)
% Prints the result depending on the type and mode:
%   default -- prints a total text + the amount of numbers
%   list    -- prints nothing extra
%   amount  -- prints the amount of numbers, without the total text
print_result(Type, default) :-
    nl, write('Total amount of '),
    write(Type),
    write(' numbers: '),
    print_count(Type).
print_result(_, list).
print_result(Type, amount) :- print_count(Type).

print_count(prime) :- aggregate_all(count, prime_number(_), C), writeln(C).

% ---------------
% OUTPUT HELPERS
% ---------------

% init_output(+OutFile, -Output, -Stream)
% Opens the OutFile and sets it as the current output, returns it and saves the previous Stream for restoration
init_output(OutFile, Output, Stream) :-
    open(OutFile, write, Output),
    current_output(Stream),
    set_output(Output).

% close_output(+Output, +Stream)
% Closes the Output and restores the Stream
close_output(Output, Stream) :-
    close(Output),
    set_output(Stream).