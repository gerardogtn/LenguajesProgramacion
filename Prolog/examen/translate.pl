engl2Span(apple, manzana).
span2Engl(manzana, apple).
span2Engl(queso, cheese).

translate([], [], []).
translate([EnglHead|Tail], [SpanHead|SpanTail], EngList) :-
  engl2Span(EnglHead, SpanHead),
  translate(Tail, SpanTail, EngList).
translate([SpanHead|Tail], SpanList, [EngHead|EngTail]) :-
  span2Engl(SpanHead, EngHead),
  translate(Tail, SpanList, EngTail).
