:- use_module('../src/entrypoint').

:- begin_tests(harshad).

test('default mode', [true(Output == "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n\nTotal amount of harshad numbers: 10\n")]) :-
    with_output_to(string(Output), entrypoint(harshad, default, 1, null)).

test('list mode', [true(Output == "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n")]) :-
    with_output_to(string(Output), entrypoint(harshad, list, 1, null)).

test('amount mode', [true(Output == "33\n")]) :-
    with_output_to(string(Output), entrypoint(harshad, amount, 2, null)).

:- end_tests(harshad).

:- run_tests.
:- halt.