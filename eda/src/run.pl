:- module(run, [run/1]).

:- use_module(parser).
:- use_module(eda).
:- use_module(core).

run(File) :-
    parse_file(File, EDA),
    assert_eda(EDA),
    core.
