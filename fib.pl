% Tabling is also important for the memoisation it offers.
% The standard example is calculating Fibonacci numbers.
%
% As an example, this benchmark  calculates   the  N-th Fibonacci number
% without tabling. You can compare  its   execution  time to the version
% with tabling in fib-no-tabling-hprolog.pl

:- module(fib,
	  [ fib/1,				% +Count
	    fib/2				% +Count, Fib
	  ]).
:- use_module(instrument).

fib(N) :-
	measure(fib(N, _Fib), fib, N).

:- table fib/2.

fib(0, 1):-!.
fib(1, 1):-!.
fib(N,F):-N>1,N1 is N-1, N2 is N-2,fib(N1,F1),fib(N2,F2),F is F1+F2.
