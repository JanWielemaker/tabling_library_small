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

bench :-
	fib(500),
	fib(750),
	fib(1 000),
	fib(10 000),

	recognize(20 000),
	recognize(50 000),

	naive_reverse(500),
	naive_reverse(1 000),

	shuttle(2 000),
	shuttle(5 000),
	shuttle(20 000),
	shuttle(50 000),

	pingpong(10 000),
	pingpong(20 000),

	path_double_first_loop(50),
	path_double_first_loop(100),

	p_double_first(50),
	p_double_first(100),
	p_double_first(200),
	p_double_first(500),

	pyramid(500),

	bintree(18),

	test_joins(-),

	mondial(-).

