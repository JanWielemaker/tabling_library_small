:- module(pingpong,
	  [ pingpong/1				% +Count
	  ]).
:- use_module(instrument).

pingpong(N) :-
	measure(d(N, _X), pingpong, N).

% Two mutually recursive predicates:
% d(X) :- e(Y), Y < 5, X is Y + 1.
% d(0).
%
% e(X) :- d(Y), Y < 5, X is Y + 1.
% e(0).

:- table d/2, e/2.

d(N, X) :- e(N, Y), Y < N, X is Y + 1.
d(_, 0).

e(N, X) :- d(N, Y), Y < N, X is Y + 1.
e(_, 0).
