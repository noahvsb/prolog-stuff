:- use_module('../src/main').

:- begin_tests(arguments).

% --------------------
% valid arguments
% --------------------

test(type, [true]) :-
    with_output_to(string(_), main(['-t', prime])).

test(help, [true]) :-
    with_output_to(string(Output), main(['-h'])),
    once(sub_string(Output, _, _, _, 'Usage:')).

test(mode, [true]) :-
    with_output_to(string(_), main(['-t', prime, '-m', amount])).

test(n, [true]) :-
    with_output_to(string(_), main(['-n', '3', '-t', prime])).

% not testing -o since that means the test will create a new file, this is unwanted behaviour

% --------------------
% invalid arguments
% --------------------

test(unrecognized_flag, [fail]) :-
    with_output_to(string(Output), main(['-f'])),
    once(sub_string(Output, _, _, _, 'Invalid argument: -f')),
    once(sub_string(Output, _, _, _, 'Usage:')).

test(invalid_type, [fail]) :-
    with_output_to(string(Output), main(['-t', '-h'])),
    once(sub_string(Output, _, _, _, 'Invalid argument: -h')),
    once(sub_string(Output, _, _, _, 'Invalid type')),
    once(sub_string(Output, _, _, _, 'Usage:')).

test(invalid_mode, [fail]) :-
    with_output_to(string(Output), main(['-m', 'test'])),
    once(sub_string(Output, _, _, _, 'Invalid argument: test')),
    once(sub_string(Output, _, _, _, 'Invalid mode')),
    once(sub_string(Output, _, _, _, 'Usage:')).

test(invalid_n, [fail]) :-
    with_output_to(string(Output), main(['-n', '-m'])),
    once(sub_string(Output, _, _, _, 'Invalid argument: -m')),
    once(sub_string(Output, _, _, _, 'Invalid N: should be a number and greater than 0')),
    once(sub_string(Output, _, _, _, 'Usage:')).

:- end_tests(arguments).

:- run_tests.
:- halt.