word(camion, c, a, m, i, o, n).
word(mango,  m, a, n, g, o, _).
word(media,  m, e, d, i, a, _).
word(cama,   c, a, m, a, _, _).
word(mora,   m, o, r, a, _, _).
word(mesa,   m, e, s, a, _, _).

crossword(H1, H2, V1, V2, V3, V4) :-
  word(H1, _, H12,   _, H14,   _, H16),
  word(H2, _, H22,   _, H24,   _,   _),
  word(V1, _, H12,   _,   _,   _,   _),
  word(V2, _,   _,   _, H14,   _,   _),
  word(V3, _,   _, H16,   _, H22, _),
  word(V4, _,   _,   _, H24,   _,  _),
  H1 \= H2,
  H1 \= V1,
  H1 \= V2,
  H1 \= V3,
  H1 \= V4,
  H2 \= V1,
  H2 \= V2,
  H2 \= V3,
  H2 \= V4,
  V1 \= V2,
  V1 \= V3,
  V1 \= V4,
  V2 \= V3,
  V3 \= V4.
