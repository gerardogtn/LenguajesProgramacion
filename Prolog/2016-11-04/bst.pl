% Data Definition:
% Tree is one of:
% empty
% Tree(X, Tree, Tree) -> X : element.

isMember(X, node(X, _, _)).
isMember(X, node(_, L, _)) :- isMember(X, L).
isMember(X, node(_, _, R)) :- isMember(X, R).

bstInsert(X, empty, node(X, empty, empty)).
bstInsert(X, node(K, L, R), node(K, NewLeft, R)) :- X < K, bstInsert(X, L, NewLeft).
bstInsert(X, node(K, L, R), node(K, L, NewRight)) :- X >= K, bstInsert(X, R, NewRight).

% Ejemplo: insertMain([6,4,2,5,8,7,9], T).

% insertMain -> Crea un nuevo arbol vacio e inserta.
insertMain(List, Tree) :- insertFromList(List, empty, Tree).

% insertFromList -> inserta una lista en un arbol existente. 
insertFromList([], Tree, Tree).
insertFromList([H|T], Current, Out) :- bstInsert(H, Current, New), insertFromList(T, New, Out).

preorder(empty, []).
preorder(node(K, L, R), [K|Out]) :-
  preorder(L, LeftOut),
  preorder(R, RightOut),
  append(LeftOut, RightOut, Out).

inorder(empty, []).
inorder(node(K, L, R), Out) :- inorder(L, LeftOut),
 inorder(R, RightOut),
 append(LeftOut, [K], Temp),
 append(Temp, RightOut, Out).

postorder(empty, []).
postorder(node(K, L, R), Out) :-
  postorder(L, LeftOut),
  postorder(R, RightOut),
  append(LeftOut, RightOut, Temp),
  append(Temp, [K], Out).
