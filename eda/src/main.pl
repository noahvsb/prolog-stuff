:- module(main, [main/1]).

:- if(\+ current_prolog_flag(testing, true)).
:- initialization(main, main).
:- endif.

% Load a module relative to this file, not the working directory
% Using just use_module/1 fails after compilation since the working directory may differ from the source directory
load(Path) :-
    prolog_load_context(directory, Dir),
    atomic_list_concat([Dir, Path], Full),
    use_module(Full).

:- load('/usage').
:- load('/run').

main(['-h'|_]) :- !,
    usage.

main([File]) :- !,
    run(File).

main(_) :-
    writeln('Invalid usage'), nl, 
    usage,
    fail.