remove([], _, []).
remove([First|Rest], First, Rest).
remove([First|Rest], Element, [First|NewList]) :-
		remove(Rest, Element, NewList).


removeAll([], _, []).
removeAll([First|Rest], First, NewList) :- remove(Rest, First, NewList).
removeAll([First|Rest], Element, [First|NewList]) :-
  	remove(Rest, Element, NewList).


min([], Min, Min).
min([First|Rest], CurrMin, Min) :- (First < CurrMin), min(Rest, First, Min).
min([_|Rest], CurrMin, Min) :- min(Rest, CurrMin, Min).

min([], -1).
min([H|T], Out) :- min(T, H, Out).

selectionSort([], []).
selectionSort([H|T], [Smallest|SortedList]) :-
  min([H|T], H, Smallest),
  remove([H|T], Smallest, NewList),
  selectionSort(NewList, SortedList).
