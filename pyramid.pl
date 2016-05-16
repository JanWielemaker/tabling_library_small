%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:     test_path_right_last.pl
%% Added by: Miguel Areias and Ricardo Rocha
%% Program:  Right recursive path definition
%%           with the recursive clause last
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% time_query:- path(X,Y),
%              fail.
%
% debug_query:- path(X,Y),
%               query_output([X, ' - ', Y, '\n']),
%               fail.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(pyramid,
	  [ pyramid/1			% +Count
	  ]).
:- use_module(instrument).

pyramid(N) :-
    data(N),
    measure(path(_X,_Y), pyramid, N).

:- table path/2.
:- dynamic edge/2.

path(X,Z):- edge(X,Z).
path(X,Z):- edge(X,Y), path(Y,Z).

data(N) :-
	retractall(edge(_,_)),
	Max is N-1,
	forall(( between(1,Max,I),
		 I1 is I + 1
	       ),
	       assertz(edge(I,I1))).
