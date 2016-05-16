/***********************************************************
taken from "Extension Table Built-ins for Prolog",
by Chang-Guan Fa & Suzanne W. Dietrich
Software Practive and Experience, Vol22, No.7, 573-597, 1992.
***********************************************************/

:- module(recognize,
	  [ recognize/1				% +Count
	  ]).
:- use_module(instrument).

recognize(N) :-
	data(N),
	End is N + 1,
	measure(a(1, End), recognize, N).

:- table a/2.

a(F,L) :- t(F,a,L).
a(F,L) :- a(F,M), t(M,b,L).
a(F,L) :- a(F,M), t(M,a,L).

:- dynamic t/3.

data(N) :-
	retractall(t(_,_,_)),
	garbage_collect_clauses,
	forall(( between(1,N,I),
		 data(I, T)
	       ),
	       assertz(T)),
	garbage_collect.

data(N, t(N,AB,N1)) :-
	N1 is N + 1,
	(   N mod 2 =:= 0
	->  AB = b
	;   AB = a
	).
