:- set_prolog_flag(optimise, true).
:- use_module([ fib,
		recognize,
		naive_reverse,
		shuttle,
		pingpong,
		path_double_first_loop,
		path_double_first,
		pyramid,
		bintree,
		test_joins,
		mondial
	      ]).
:- use_module(instrument).

bench :-
	header,
	forall(benchmark(G),
	       call(G)).

benchmark(fib(500)).
benchmark(fib(750)).
benchmark(fib(1 000)).
benchmark(fib(10 000)).

benchmark(recognize(20 000)).
benchmark(recognize(50 000)).

benchmark(naive_reverse(500)).
benchmark(naive_reverse(1 000)).

benchmark(shuttle(2 000)).
benchmark(shuttle(5 000)).
benchmark(shuttle(20 000)).
benchmark(shuttle(50 000)).

benchmark(pingpong(10 000)).
benchmark(pingpong(20 000)).

benchmark(path_double_first_loop(50)).
benchmark(path_double_first_loop(100)).

benchmark(path_double_first(50)).
benchmark(path_double_first(100)).
benchmark(path_double_first(200)).
benchmark(path_double_first(500)).

benchmark(pyramid(500)).

benchmark(bintree(18)).

benchmark(test_joins(12)).

benchmark(mondial(0)).

