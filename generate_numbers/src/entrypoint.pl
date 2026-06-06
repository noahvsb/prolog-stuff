:- module(entrypoint, [entrypoint/4]).

:- use_module(prime).

% -----------
% ENTRYPOINT
% -----------

% entrypoint(+Type, +Mode, +N, +OutFile)
% Entrypoint for the command.
entrypoint(Type, Mode, N, null) :- !,
    generate_numbers(Type, Mode, N),
    print_result(Type, Mode).
entrypoint(Type, Mode, N, OutFile) :-
    init_output(OutFile, Output, Stream),
    generate_numbers(Type, Mode, N),
    print_result(Type, Mode),
    close_output(Output, Stream).

% -----------------
% GENERATE NUMBERS
% -----------------

generate_numbers(prime, Mode, N) :- generate_primes(Mode, N).

% ----------------
% PRINT RESULTS
% ----------------

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