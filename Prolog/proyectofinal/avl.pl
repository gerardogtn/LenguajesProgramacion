% Data definition:
% Tree is one of:
% - empty
% - Tree(Value, Tree, Tree, Integer).

% Find
find(_, empty, false).
find(X, node(X, _, _), true).
find(X, node(K, L, _), Out) :- X < K, find(X, L, Out).
find(X, node(K, _, R), Out) :- X >= K, find(X, R, Out).

% Height
height(empty, 0).
height(node(_, L, R), Out) :-
  height(L, LHeight),
  height(R, RHeight),
  Out is max(LHeight, RHeight) + 1.

% insertMain -> Crea un nuevo arbol vacio e inserta.
insertMain(List, Tree) :- insertFromList(List, empty, Tree).

% insertFromList -> inserta una lista en un arbol existente.
insertFromList([], Tree, Tree).
insertFromList([H|T], Current, Out) :- insert(H, Current, New), insertFromList(T, New, Out).

% Insert
insert(X, empty, node(X, empty, empty)).
insert(X, node(K, L, R), Out) :-
  X < K,
  insert(X, L, UnbalancedLeft),
  balance(node(K, UnbalancedLeft, R), Out).
insert(X, node(K, L, R), Out) :-
  X >= K,
  insert(X, R, UnbalancedRight),
  balance(node(K, L, UnbalancedRight), Out).

%  Main Balance.
balance(node(K, L, R), Out) :-
  height(L, LHeight),
  height(R, RHeight),
  balance(node(K, L, R), LHeight, RHeight, Out).

%  Case 0: no rotation needed.
balance(Tree, LHeight, RHeight, Tree) :-
  RHeight - LHeight < 2,
  LHeight - RHeight < 2.

% Case 1: Single left rotation.
balance(node(K, L, node(RK, RL, RR)), LHeight, RHeight, Out) :-
  RHeight - LHeight >= 2,
  height(RL, LeftSubHeight),
  height(RR, RightSubHeight),
  LeftSubHeight - RightSubHeight < 1,
  leftRotate(node(K, L, node(RK, RL, RR)), Out).

% Case 2: Double left rotation
balance(node(K, L, node(RK, RL, RR)), LHeight, RHeight, Out) :-
  RHeight - LHeight >= 2,
  height(RL, LeftSubHeight),
  height(RR, RightSubHeight),
  LeftSubHeight - RightSubHeight >= 1,
  rightRotate(node(RK, RL, RR), Temp),
  leftRotate(node(K, L, Temp), Out).

% Case 3: Single right rotation.
balance(node(K, node(LK, LL, LR), R), LHeight, RHeight, Out) :-
  LHeight - RHeight >= 2,
  height(LL, LeftSubHeight),
  height(LR, RightSubHeight),
  RightSubHeight - LeftSubHeight < 1,
  rightRotate(node(K, node(LK, LL, LR), R), Out).

% Double right rotation.
balance(node(K, node(LK, LL, LR), R), LHeight, RHeight, Out) :-
  LHeight - RHeight >= 2,
  height(LL, LeftSubHeight),
  height(LR, RightSubHeight),
  RightSubHeight - LeftSubHeight >= 1,
  leftRotate(node(LK, LL, LR), Temp),
  rightRotate(node(K, Temp, R), Out).

%  Rotations.
leftRotate(node(K, L, node(RK, RL, RR)), node(RK, node(K, L, RL), RR)).
rightRotate(node(K, node(LK, LL, LR), R), node(LK, LL, node(K, LR, R))).
