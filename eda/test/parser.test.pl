:- use_module('../src/parser').

:- begin_tests(parser).

test(parse) :-
    once(parse_file('data/test.eda', EDA)),
    EDA = eda(
        [
            (0, a, 1),
            (0, '#', 0),
            (1, a, 1),
            (1, '#', 0)
        ], 
        [1]
    ).

:- end_tests(parser).

:- run_tests.
:- halt.