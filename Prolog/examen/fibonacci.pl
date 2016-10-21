fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, Out) :- N > 1, Prev is N-1, Prev2 is N-2, fibonacci(Prev, A), fibonacci(Prev2, B), Out is A+B.


fibonacciDp(N, Out) :- fibonacciDp(N, memo{0:1, 1:1}, Out).
fibonacciDp(N, D, Out) :- Out is D.get(N), write(Out).
fibonacciDp(N, memo, Out) :- N > 1,
                              Prev is N-1,
                              Prev2 is N-2,
                              fibonacciDp(Prev, memo, A),
                              fibonacciDp(Prev2, memo, B),
                              Out is A+B,
                              memo.put(N, Out),
                              write(Out).


testDict(D, K, V) :- D.put(K, V), write(D).
