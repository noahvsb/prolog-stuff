:- module(harshad, [harshad_number/1, f_harshad/2]).

% harshad_number(+X)
% X is a harshad number
:- dynamic harshad_number/1.

% f_harshad(+Mode, +X)
% The main harshad function, always succeeds
f_harshad(Mode, X) :- X =\= 0, % has to be treated as an edge case to avoid division by zero
    is_harshad(X), !,
    add_harshad(Mode, X).
f_harshad(_, _).

% add_harshad(+Mode, +X)
% Adds a harshad_number(X) fact. If mode is default or list, prints X
add_harshad(amount, X) :- !, assertz(harshad_number(X)).
add_harshad(_,      X) :- assertz(harshad_number(X)), writeln(X).

% is_harshad(+X)
% Succeeds if X is a harshad number
is_harshad(X) :-
    sum_of_numbers(X, S),
    X mod S =:= 0.

% sum_of_numbers(+X, -S)
% S is the sum of the numbers of X
sum_of_numbers(X, S) :-
    number_codes(X, L),
    sum_list(L, S0),
    length(L, N),
    S is S0 - 48 * N.