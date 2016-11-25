insertMain(List, Tree) :-
  insertFromList(List, [], TreeArray),
  mainToTree(TreeArray, Tree).

% insertFromList -> inserta una lista en un arbol existente.
insertFromList([], Tree, Tree).
insertFromList([H|T], Current, Out) :- insert(H, Current, New), insertFromList(T, New, Out).

insert(X, [], [-1, X]).
insert(X, L, Out) :-
  length(L, N),
  Pos is N,
  append(L, [X], Temp),
  mainBalance(Temp, Pos, X, Out).

mainBalance(List, Pos, X, Out) :-
  balance(List, Pos, X, Temp, TempPos),
  setAt(Temp, TempPos, X, Out).

balance(List, Pos, _, List, Pos) :-
  Pos =< 1.

balance(List, Pos, X, List, Pos) :-
  Pos > 1,
  Half is div(Pos, 2),
  elementAt(List, Half, Mid),
  X < Mid.

balance(List, Pos, X, Out, TempPos) :-
  Pos > 1,
  Half is div(Pos, 2),
  elementAt(List, Half, Mid),
  X >= Mid,
  setAt(List, Pos, Mid, Temp),
  balance(Temp, Half, X, Out, TempPos).

mainToTree(L, Tree) :-
  toTree(L, 1, Tree).

toTree(L, Pos, empty) :-
  length(L, N),
  Pos >= N.

toTree(List, Pos, node(K, LeftChild, RightChild)) :-
  LeftPos is Pos * 2,
  RightPos is LeftPos + 1,
  elementAt(List, Pos, K),
  toTree(List, LeftPos, LeftChild),
  toTree(List, RightPos, RightChild).


elementAt([H|_], 0, H).
elementAt([_|T], N, Out) :- N > 0, N2 is N - 1, elementAt(T, N2, Out).

insertAt(L, 0, X, Out) :- Out = [X|L].
insertAt([H|T], N, X, Out) :- N2 is N - 1, insertAt(T, N2, X, Temp), Out = [H|Temp].

setAt([_|T], 0, X, [X|T]).
setAt([H|T], N, X, [H|Out]) :- N2 is N -1, setAt(T, N2, X, Out).

removeAt([_|T], 0, T).
removeAt([H|T], N, Out) :- N2 is N - 1,
  removeAt(T, N2, Temp),
  Out = [H|Temp].
