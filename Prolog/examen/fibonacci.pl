fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, Out) :- N > 1, Prev is N-1, Prev2 is N-2, fibonacci(Prev, A), fibonacci(Prev2, B), Out is A+B.

fibonacciDp(N, Out) :- asserta(known(0, 1)), asserta(known(1, 1)), known(N, Out).
fibonacciDp(N, Out) :- N > 1,
                              Prev is N-1,
                              Prev2 is N-2,
                              fibonacciDp(Prev, A),
                              fibonacciDp(Prev2, B),
                              Out is A+B,
                              asserta(known(N, Out)).
nFibonaccis(0, [1]).
nFibonaccis(1, [1, 1]).
nFibonaccis(N, [H|T]) :- Next is N-1, fibonacciDp2(N, H), nFibonaccis(Next, T).
