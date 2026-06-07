:- module(helpers, [with_input/2]).

with_input(InputList, Test) :-
    % Convert inputs to lines like [abba, aabb, halt] to "abba.\naabb.\nhalt.\n"
    maplist(format_line, InputList, Lines),
    atomic_list_concat(Lines, "", InputAtom),

    % set input
    open_string(InputAtom, InputStream),
    current_input(OldInput),
    set_input(InputStream),

    % run test
    call(Test),

    % set input back to old input
    set_input(OldInput),
    close(InputStream).

format_line(Input, Line) :-
    format(atom(Line), "~w.~n", [Input]).