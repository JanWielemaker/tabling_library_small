:- module(path_double_first,
	  [ path_double_first/1			% +Count
	  ]).
:- use_module(instrument).

:- dynamic e/2.

path_double_first(N) :-
	data(N),
	measure(a(_X,_Y), path_double_first, N).

data(N) :-
	retractall(e(_,_)),
	Max is N - 2,
	forall(between(0,Max,I1),
	       (   I2 is I1+1,
		   assertz(e(I1,I2)))).

:- table a/2.

a(X,Y) :- a(X,Z),  a(Z,Y).
a(X,Y) :- e(X,Y).

