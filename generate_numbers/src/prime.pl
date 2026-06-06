:- module(prime, [prime_number/1, generate_primes/2]).

% prime_number(+P)
% P is a prime number.
:- dynamic prime_number/1.

% ----------------
% GENERATE PRIMES
% ----------------

% generate_primes(+Mode, +N)
% Generates all primes between 0 and 10^N and adds prime_number(P) facts for them.
generate_primes(Mode, N) :-
    retractall(prime_number(_)),
    L = 2,         % lower bound: smallest prime
    U is 10^N - 3, % upper bound: 10^N is even, 10^N - 1 is divisible by 3 and 10^N - 2 is also even, so they are never primes
    forall(between(L, U, X), check_and_add_prime(Mode, X)).

% check_and_add_prime(+Mode, +X)
% Checks if X is a prime, if so add a prime_number(X) fact. Always succeeds.
check_and_add_prime(Mode, X) :-
    \+ has_prime_factor(X), !,
    add_prime(Mode, X).
check_and_add_prime(_, _).

% add_prime(+Mode, +P)
% Adds prime(P) fact. If mode is default or list, prints P.
add_prime(amount, P) :- !, assertz(prime_number(P)).
add_prime(_,      P) :- assertz(prime_number(P)), writeln(P).

% has_prime_factor(+X)
% Succeeds if X has a prime factor.
has_prime_factor(X) :-
    prime_number(P),
    P * P =< X, % check only the possible prime factors, which is up to sqrt(X)
    X mod P =:= 0.