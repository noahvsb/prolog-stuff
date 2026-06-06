:- initialization(main, main).

% Load a module relative to this file, not the working directory.
% Using just use_module/1 fails after compilation since the working directory may differ from the source directory.
load(Path) :-
    prolog_load_context(directory, Dir),
    atomic_list_concat([Dir, Path], Full),
    use_module(Full).

:- load('/usage').
:- load('/primes').

% Set defaults
%   mode     -- default
%   N        -- 6
%   out file -- null
main(Args) :- main(Args, default, 6, null).

% Execute if no more arguments
main([], Mode, N, OutFile) :- !,
    primes(Mode, N, OutFile).

% ---------------------
% Handle arguments
% ---------------------

% TODO: check if mode is valid and n is a number > 0

% -h
main(['-h'|_], _, _, _) :- !,
    usage.

% -m
main(['-m', Mode | Args], _, N, OutFile) :- !,
    main(Args, Mode, N, OutFile).

% -n
main(['-n', N | Args], Mode, _, OutFile) :- !,
    main(Args, Mode, N, OutFile).

% -o
main(['-o', OutFile | Args], Mode, N, _) :- !,
    main(Args, Mode, N, OutFile).

% Invalid argument: print usage
main(_, _, _, _) :-
    usage,
    halt(1).