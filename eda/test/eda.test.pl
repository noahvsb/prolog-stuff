:- use_module('../src/eda').

:- begin_tests(eda).

test('assert eda', [true]) :-
    assert_eda(eda([(0, a, 1),(1, a, 1)],[1])),
    transition(0, a, 1),
    transition(1, a, 1),
    accepting(1).

:- end_tests(eda).

:- run_tests.
:- halt.