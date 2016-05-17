:- module(instrument,
	  [ measure/3,				% :Goal, +Benchmark, +Count
	    header/0,
	    op(1150, fx, table)
	  ]).
:- use_module(procps).
:- reexport('../tabling_library/tabling').
:- use_module(hprolog_timing).

:- meta_predicate
	measure(0, +, +).

measure(Goal, Benchmark, Count) :-
	clean_all,
	statistics(runtime, [T0,_]),
	Goal,
	statistics(runtime, [T1,_]),
	T is T1-T0,
	hProlog_rel(Benchmark, Count, T, Rel),
	format('~w ~`.t ~D ~30|~`.t ~D msec~45| ~t~2f~8+~n', [Benchmark, Count, T, Rel]).

header :-
	format('~w ~`.t ~w ~30|~`.t ~w~45| ~t~w~8+~n',
	       ['Benchmark', 'Count', 'Time', 'hProlog/SWI']).

clean_all :-
	abolish_all_tables,
	garbage_collect,
	garbage_collect_clauses,
	garbage_collect_atoms.

hProlog_rel(Benchmark, Count, T, Rel) :-
	(   hprolog_time(Benchmark, Count, HTime)
	->  Rel is round(100*HTime/T)/100
	;   Rel is 0
	).
