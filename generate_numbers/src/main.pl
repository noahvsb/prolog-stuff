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
:- load('/entrypoint').

% Set defaults
%   type     -- uninstantiated, because there's no default, the type HAS to be provided
%   mode     -- default
%   N        -- 1
%   out file -- null
main(Args) :- main(Args, _, default, 1, null).

% Execute if there are no more arguments and Type is instantiated
main([], Type, Mode, N, OutFile) :-
    nonvar(Type), !,
    entrypoint(Type, Mode, N, OutFile).

% Invalid argument: type is required
main([], Type, _, _, _) :-
    var(Type), !,
    handle_invalid_argument('no type was specified').

% ---------------------
% Handle arguments
% ---------------------

% -h
main(['-h'|_], _, _, _, _) :- !,
    usage.

% -t
main(['-t', Type | Args], _, Mode, N, OutFile) :- !,
    type(Type)
    -> main(Args, Type, Mode, N, OutFile)
    ;  handle_invalid_argument(Mode, 'Invalid type').

% -m
main(['-m', Mode | Args], Type, _, N, OutFile) :- !,
    mode(Mode)
    -> main(Args, Type, Mode, N, OutFile)
    ;  handle_invalid_argument(Mode, 'Invalid mode').

% -n
main(['-n', N0 | Args], Type, Mode, _, OutFile) :- !,
    atom_number(N0, N),
    N > 0
    ->  main(Args, Type, Mode, N, OutFile)
    ;   handle_invalid_argument(N0, 'Invalid N: should be a number and greater than 0').

% -o
main(['-o', OutFile | Args], Type, Mode, N, _) :- !,
    main(Args, Type, Mode, N, OutFile).

% Invalid argument: print usage
main([IArg | _], _, _, _, _) :-
    handle_invalid_argument(IArg).

% handle_invalid_argument(+IArg, +ExtraMessage)
% Prints an error message, the usage and fails
handle_invalid_argument(IArg) :- handle_invalid_argument(IArg, null).
handle_invalid_argument(IArg, ExtraMessage) :- !,
    write('Invalid argument: '), write(IArg), nl,
    print_extra_message(ExtraMessage), nl,
    usage,
    fail.

print_extra_message(null) :- !.
print_extra_message(ExtraMessage) :-
    write(ExtraMessage), nl.
