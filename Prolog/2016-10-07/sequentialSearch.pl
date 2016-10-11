sequentialSearch(X, [X|_]).
sequentialSearch(X, [_|T]) :- sequentialSearch(X, T).

% sequentialSearchPosition(X, L) :- sequentialSearchPosition(X, L, 0).
sequentialSearchPosition(X, [X|_], POS, OUT) :- OUT is POS.
sequentialSearchPosition(X, [_|T], POS, OUT) :- sequentialSearchPosition(X, T, POS+1, OUT).
