/***********************************************************
taken from "Extension Table Built-ins for Prolog",
by Chang-Guan Fa & Suzanne W. Dietrich
Software Practive and Experience, Vol22, No.7, 573-597, 1992.
***********************************************************/

:- module(naive_reverse,
	  [ naive_reverse/1			% +Count
	  ]).
:- use_module(instrument).

naive_reverse(N) :-
    data(N, List),
    measure(nrev(List,_Result), naive_reverse, N).

:- table nrev/2.

nrev([],[]).
nrev([X|Rest], Result) :-
  nrev(Rest,L),
  myappend(L,[X],Result).

myappend([],L,L).
myappend([X|L1], L2, [X|L3]) :-
  myappend(L1,L2,L3).

data(N, List) :-
	Max is N - 1,
	findall(E, (between(0,Max,I),atom_concat(a,I,E)), List).
