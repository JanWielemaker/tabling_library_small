:- module(hprolog_times,
	  [ hprolog_time/3
	  ]).

hprolog_time(fib,		     500,    24).
hprolog_time(fib,		     750,    33).
hprolog_time(fib,		     1000,   46).
hprolog_time(fib,		     10 000, 982).
hprolog_time(recognize,		     20 000, 205).
hprolog_time(recognize,		     50 000, 503).
hprolog_time(naive_reverse,	     500,    767).
hprolog_time(naive_reverse,	     1000,   2800).
hprolog_time(shuttle,		     2 000,  44).
hprolog_time(shuttle,		     5 000,  138).
hprolog_time(shuttle,		     20 000, 582).
hprolog_time(shuttle,		     50 000, 1586).
hprolog_time(pingpong,		     10 000, 271).
hprolog_time(pingpong,		     20 000, 490).
hprolog_time(path_double_first_loop, 50,     653).
hprolog_time(path_double_first_loop, 100,    4638).
hprolog_time(path_double_first,	     50,     162).
hprolog_time(path_double_first,	     100,    989).
hprolog_time(path_double_first,	     200,    6785).
hprolog_time(path_double_first,	     500,    110463).
hprolog_time(pyramid,		     500,    1914).
hprolog_time(bintree,		     18,     108662).
hprolog_time(test_joins,	     12,     3001).
hprolog_time(mondial,		     0,	     6444).
