:- use_module('../src/entrypoint').

:- begin_tests(primes).

test(default_mode, [true(Output == "2\n3\n5\n7\n\nTotal amount of prime numbers: 4\n")]) :-
    with_output_to(string(Output), entrypoint(prime, default, 1, null)).

test(list_mode, [true(Output == "2\n3\n5\n7\n")]) :-
    with_output_to(string(Output), entrypoint(prime, list, 1, null)).

test(amount_mode, [true(Output == "4\n")]) :-
    with_output_to(string(Output), entrypoint(prime, amount, 1, null)).

:- end_tests(primes).

:- run_tests.
:- halt.