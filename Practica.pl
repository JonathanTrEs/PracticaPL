higher(X,Y,[X|T]):-
  member(Y,T).

higher(X,Y,[_|T]):-
  higher(X,Y,T).

not_adjacent(X, Y, [X, Z | T]):-
  Z \==Y,
  member(Y, T).
  
not_adjacent(X, Y, [Y, Z | T]):-
  Z \== X,
  member(X, T).
  
not_adjacent(X, Y, [_ | T]):-
  not_adjacent(X, Y, T).
  
puzzle(L):-
  permutation(L,[juan,antonio,ana,maria,luis]),
  L=[Atico,_,_,_,Bajo],
  juan \== Atico,
  antonio \== Bajo,
  ana \== Atico,
  ana \== Bajo,
  higher(luis,antonio,L),
  not_adjacent(maria,ana,L),
  not_adjacent(ana,antonio,L).

  
% practica es el método que se encarga de resolver el problema

practica:- 
  write('Los apartamentos quedan ordenados de la siguiente forma'), nl,
  puzzle([A,B,C,D,E]),
  write('La Solucion es: '), nl,
  write('- Atico: ' ),  write(A), nl,
  write('- Piso 4: '),  write(B), nl,
  write('- Piso: 3 '),  write(C), nl,
  write('- Piso 2: '),  write(D), nl,
  write( '- Bajo: ' ),  write(E), nl.