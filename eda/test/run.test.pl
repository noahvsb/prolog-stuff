:- use_module('../src/run').
:- use_module(helpers).

:- begin_tests(run).

test(run, [true]) :-
    with_input([aba, bab, aca], with_output_to(string(Output), run('data/test.eda'))), % test EDA accepts words with alphabet {a,b} that end in a
    aggregate_all(count, sub_string(Output, _, _, _, accepted), 2), % aba and aca are accepted
    aggregate_all(count, sub_string(Output, _, _, _, rejected), 1). % bab is rejected

:- end_tests(run).

:- run_tests.
:- halt.