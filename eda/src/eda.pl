:- module(eda, [assert_eda/1, transition/3, accepting/1]).

% transition(+Q, +C, -P)
:- dynamic transition/3.

% accepting(+A)
:- dynamic accepting/1.

% assert_eda(+EDA)
% Adds facts for the transitions and accepting states of the parsed EDA
assert_eda(eda(T, A)) :-
    assert_transitions(T),
    assert_accepting_states(A).

assert_transitions([]).
assert_transitions([(Q, C, P) | Ts]) :-
    assertz(transition(Q, C, P)),
    assert_transitions(Ts).

assert_accepting_states([]).
assert_accepting_states([A | As]) :-
    assertz(accepting(A)),
    assert_accepting_states(As).