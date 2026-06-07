:- use_module('../src/main').
:- use_module(helpers).

:- begin_tests(arguments).

test(valid, [true]) :-
    with_input(['halt'],
        with_output_to(string(_), main(['data/test.eda']))
    ).

test(help, [true]) :-
    with_output_to(string(Output), main(['-h'])),
    once(sub_string(Output, _, _, _, 'Usage:')).

test(invalid, [fail]) :-
    with_output_to(string(Output), main(['data/test.eda', '-f'])),
    once(sub_string(Output, _, _, _, 'Invalid usage')),
    once(sub_string(Output, _, _, _, 'Usage:')).

:- end_tests(arguments).

:- run_tests.
:- halt.