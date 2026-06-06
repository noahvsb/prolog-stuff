:- module(main, [main/1]).

:- if(\+ current_prolog_flag(testing, true)).
:- initialization(main, main).
:- endif.

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

% -h
main(['-h'|_], _, _, _) :- !,
    usage.

% -m
main(['-m', Mode | Args], _, N, OutFile) :- !,
    mode(Mode)
    -> main(Args, Mode, N, OutFile)
    ;  handle_invalid_argument(Mode, 'Invalid mode').

% -n
main(['-n', N0 | Args], Mode, _, OutFile) :- !,
    atom_number(N0, N),
    N > 0
    ->  main(Args, Mode, N, OutFile)
    ;   handle_invalid_argument(N0, 'Invalid N: should be a number and greater than 0').

% -o
main(['-o', OutFile | Args], Mode, N, _) :- !,
    main(Args, Mode, N, OutFile).

% Invalid argument: print usage
main([IArg | _], _, _, _) :-
    handle_invalid_argument(IArg, null).

% handle_invalid_argument(+IArg, +ExtraMessage)
% Prints an error message, the usage and fails.
handle_invalid_argument(IArg, ExtraMessage) :-
    write('Invalid argument: '), write(IArg), nl,
    print_extra_message(ExtraMessage), nl,
    usage,
    !,
    fail.

print_extra_message(null) :- !.
print_extra_message(ExtraMessage) :-
    write(ExtraMessage), nl.
