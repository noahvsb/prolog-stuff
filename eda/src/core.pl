:- module(core, [core/0]).

:- use_module(eda).

core :-
    read(Word),
    check_word(Word).

% check_word(+Word)
% Checks if the EDA accepts the word, prints the result and loops back.
% When a special word, q or end_of_file, is read, don't check and don't loop.
check_word(q) :- !.
check_word(end_of_file) :- !.
check_word(Word) :-
    atom_chars(Word, Input),
    (eda_test(Input, 0) -> Msg = accepted ; Msg = rejected),
    writeln(Msg),
    core.

% eda_test(+Input, +Q)
% Succeeds if the EDA accepts the input, starting at state Q
eda_test([], Q) :- accepting(Q).
eda_test([C | L], Q) :- transition(Q, C, P), eda_test(L, P).
