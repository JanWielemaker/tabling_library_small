:- module(shuttle,
	  [ shuttle/1				% +Count
	  ]).
:- use_module(instrument).

shuttle(N) :-
	measure(c(N, _X), shuttle, N).

:- table c/2.

c(N, X) :- c(N, Y), 0 =< Y, Y < N, X is -Y-1.
c(N, X) :- c(N, Y), -N < Y, Y =< 0, X is -Y+1.
c(_, 0).

