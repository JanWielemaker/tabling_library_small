:- module(path_double_first_loop,
	  [ path_double_first_loop/1		% +Count
	  ]).
:- use_module(instrument).

path_double_first_loop(N) :-
	data(N),
	measure(a(_X, _Y), path_double_first_loop, N).

:- table a/2.
:- dynamic e/2.

a(X,Y) :-
  a(X,Z), a(Z,Y).
a(X,Y) :- e(X,Y).

data(N) :-
	retractall(e(_,_)),
	Max is N - 3,
	forall(( between(0, Max, I),
		 I1 is I + 1
	       ),
	       assertz(e(I, I1))
	      ),
	Loop is N - 2,
	assertz(e(Loop,0)).
