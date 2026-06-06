:- use_module('../src/usage').

:- begin_tests(usage).

test(print_usage) :-
    with_output_to(string(Output), usage),
    once(sub_string(Output, _, _, _, 'Usage:')).

:- end_tests(usage).

:- run_tests.
:- halt.