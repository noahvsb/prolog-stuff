:- module(prime, [prime_number/1, f_prime/2]).

% prime_number(+P)
% P is a prime number
:- dynamic prime_number/1.

% ----------------
% GENERATE PRIMES
% ----------------

% check_and_add_prime(+Mode, +X)
% The main prime function
f_prime(Mode, X) :- X =\= 0, X =\= 1, % edge cases: the only numbers that don't have prime factors, but are still not primes
    \+ has_prime_factor(X), !,
    add_prime(Mode, X).
f_prime(_, _).

% add_prime(+Mode, +P)
% Adds prime(P) fact. If mode is default or list, prints P
add_prime(amount, P) :- !, assertz(prime_number(P)).
add_prime(_,      P) :- assertz(prime_number(P)), writeln(P).

% has_prime_factor(+X)
% Succeeds if X has a prime factor.
has_prime_factor(X) :-
    prime_number(P),
    P * P =< X, % check only the possible prime factors, which is up to sqrt(X)
    X mod P =:= 0.