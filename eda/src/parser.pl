:- module(parser, [parse_file/2]).

% parse_file(+File, -EDA)
% Reads a .eda file and convertis it to a eda/2 term
% EDA = eda(T, A)
%   T: A list of the transitions, which are 3 tuples: (q, c, p)
%   A: A list of the accepting states
parse_file(File, eda(T, A)) :-
    read_file_to_string(File, String, []),
    string_chars(String, Chars),
    exclude([C]>>(C = '\r'), Chars, CleanChars),
    phrase(eda(T, A), CleanChars, _).

eda(T, A) -->
    comments,
    transitions(T),
    accepting(A).

comments --> ['#'], everything, newlines, !, comments.
comments --> [].

everything --> [C], { C \= '\n' }, !, everything.
everything --> [].

transitions([T|Ts]) -->
    transition(T), !,
    transitions(Ts).
transitions([]) --> [].

transition((Q, C, P)) -->
    number(Q), ['$'], [C], ['$'], number(P), newlines.

accepting([A|As]) -->
    ['$'], number(A), newlines, !,
    accepting(As).
accepting([]) --> [].

number(N) -->
    digit(D), digits(Ds),
    { number_chars(N, [D|Ds]) }.

digits([D|Ds]) --> digit(D), !, digits(Ds).
digits([]) --> [].

digit(D) --> [D], { char_type(D, digit) }.

newlines --> ['\n'], newlines.
newlines --> [].