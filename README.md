# Prolog tabling benchmarks

This     repository     contains     generalised     benchmarks     from
https://github.com/JanWielemaker/tabling_benchmarks. It runs   purely in
Prolog and generates the test data at different scales at runtime.

Clone this repository next to
https://github.com/JanWielemaker/tabling_library and run it as

```{prolog}
swipl bench.pl
?- bench.
```

You can run individual files as below.  This notably allows wrapping the
goal in profile/1.

```
swipl fib.pl
?- fib(5000).
```
