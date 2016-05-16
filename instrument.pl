:- module(instrument,
	  [ measure/3,				% :Goal, +Benchmark, +Count
	    op(1150, fx, table)
	  ]).
:- use_module(procps).
:- reexport('../tabling_library-c-worklist/tabling').

:- meta_predicate
	measure(0, +, +).

measure(Goal, Benchmark, Count) :-
	clean_all,
	statistics(runtime, [T0,_]),
	Goal,
	statistics(runtime, [T1,_]),
	T is T1-T0,
	format('~w ~`.t ~D ~30|~`.t ~D msec~45|~n', [Benchmark, Count, T]).

clean_all :-
	abolish_all_tables,
	garbage_collect,
	garbage_collect_clauses,
	garbage_collect_atoms.
