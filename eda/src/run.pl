:- module(run, [run/1]).

:- use_module(parser).
:- use_module(eda).

run(File) :-
    parse_file(File, EDA),
    assert_eda(EDA),
    true. % TODO: add core logic
