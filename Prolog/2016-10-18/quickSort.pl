quickSort([], []).
quickSort([H|T], Out) :- partition(T, H, Left, Right),
                          quickSort(Left, Ls),
                          quickSort(Right, Rs),
                          append(Ls, [H|Rs], Out).

partition([H|T], Pivot, [H|Ls], Right) :- H =< Pivot, partition(T, Pivot, Ls, Right).
partition([H|T], Pivot, Left, [H|Rs]) :- H > Pivot, partition(T, Pivot, Left, Rs).
partition([], _, [], []).

append([], List, List).
append([H|T], List, [H|Rest]) :- append(T, List, Rest).
