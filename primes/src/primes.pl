:- module(primes, [primes/3]).

% prime(+P)
% P is prime.
:- dynamic prime/1.

% -----------
% ENTRYPOINT
% -----------

% primes(+Mode, +N, +OutFile)
% Executes the primes command for the specific Mode and N, writing to stdout or an optional OutFile.
primes(Mode, N, null) :- !,
    generate_primes(Mode, N),
    print_result(Mode).
primes(Mode, N, OutFile) :-
    init_output(OutFile, Output, Stream),
    generate_primes(Mode, N),
    print_result(Mode),
    close_output(Output, Stream).

% ----------------
% GENERATE PRIMES
% ----------------

% generate_primes(+Mode, +N)
% Generates all primes between 0 and 10^N and adds prime(P) facts for them.
% If mode is default, prints the primes when adding them.
generate_primes(Mode, N) :-
    retractall(prime(_)),
    L = 2,         % lower bound: smallest prime
    U is 10^N - 3, % upper bound: 10^N is even, 10^N - 1 is divisible by 3 and 10^N - 2 is also even, so they are never primes
    forall(between(L, U, X), check_and_add_prime(Mode, X)).

% check_and_add_prime(+Mode, +X)
% Checks if X is a prime, if so adds it. Always succeeds.
check_and_add_prime(Mode, X) :-
    \+ has_prime_factor(X), !,
    add_prime(Mode, X).
check_and_add_prime(_, _).

% add_prime(+Mode, +P)
% Adds prime(P) fact. If mode is default, prints P.
add_prime(default, P) :- assertz(prime(P)), writeln(P).
add_prime(amount, P) :- assertz(prime(P)).

% has_prime_factor(+X)
% Succeeds if X has a prime factor.
has_prime_factor(X) :-
    prime(P),
    P * P =< X, % check only the possible prime factors, which is up to sqrt(X)
    X mod P =:= 0.

% ----------------
% PRINT RESULTS
% ----------------

% print_result(+Mode)
% Prints the result depending on the mode:
%   default -- does nothing, the primes are printed at the time they are added, not at the end
%   amount  -- prints the amount of primes
print_result(default).
print_result(amount) :-
    aggregate_all(count, prime(_), C), writeln(C).

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