:- initialization(main, main).

% Load a module relative to this file, not the working directory.
% Using just use_module/1 fails after compilation since the working directory may differ from the source directory.
load(Path) :-
    prolog_load_context(directory, Dir),
    atomic_list_concat([Dir, Path], Full),
    use_module(Full).

:- load('/usage').

% Print help message
main(['-h'|_]) :- !,
    usage.

% TODO

% Invalid command: print usage
main(_) :-
    usage,
    halt(1).