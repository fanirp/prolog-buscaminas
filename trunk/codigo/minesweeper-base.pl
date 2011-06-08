pre_r(N,T) :- get_time(T1), stamp_date_time(T1, X1, 'UTC'), write(X1), nl, problem(N,T).
post_r(T) :- mostrar(T), get_time(T2), stamp_date_time(T2, X2, 'UTC'), write(X2), nl.

rA(N,T) :- pre_r(N,T), completarA(T), post_r(T).
rB(N,T) :- pre_r(N,T), completarB(T), post_r(T).
%rC(N,T) :- pre_r(N,T), completarC(T), post_r(T).
	
mostrar([]).
mostrar([Fila|T]) :-
	mostrar_lista(Fila),
	mostrar(T).

mostrar_lista([]) :- nl.
mostrar_lista([H|T]) :- mostrar_celda(H), mostrar_lista(T).

mostrar_celda(C) :- nonvar(C), C == mina, write('*').
mostrar_celda(C) :-	nonvar(C), C \= mina, write(C).
mostrar_celda(C) :- var(C), write('_').


problem(t1, [[_,_],
			 [_,1]]).

problem(t2, [[_,_],
			 [_,2]]).

problem(t3, [[_,_],
			 [_,3]]).

problem(t4, [[0,_,_],
			 [_,1,_],
			 [_,_,0]]).
% Problem from Gecode/examples/minesweeper.cc  problem 0
% 
% Solution:
%  1 0 0 0 0 1
%  0 1 0 1 1 0
%  0 0 0 0 1 0
%  0 0 0 0 1 0
%  0 1 1 1 0 0
%  1 0 0 0 1 1
%
problem(0,[[_,_,2,_,3,_],
           [2,_,_,_,_,_],
           [_,_,2,4,_,3],
           [1,_,3,4,_,_],
           [_,_,_,_,_,3],
           [_,3,_,3,_,_]]).



% Problem from Gecode/examples/minesweeper.cc  problem 1
problem(1,[[_,2,_,2,1,1,_,_],
           [_,_,4,_,2,_,_,2],
           [2,_,_,2,_,_,3,_],
           [2,_,2,2,_,3,_,3],
           [_,_,1,_,_,_,4,_],
           [1,_,_,_,2,_,_,3],
           [_,2,_,2,2,_,3,_],
           [1,_,1,_,_,1,_,1]]).



% Problem from Gecode/examples/minesweeper.cc  problem 2
problem(2,[[1,_,_,2,_,2,_,2,_,_],
           [_,3,2,_,_,_,4,_,_,1],
           [_,_,_,1,3,_,_,_,4,_],
           [3,_,1,_,_,_,3,_,_,_],
           [_,2,1,_,1,_,_,3,_,2],
           [_,3,_,2,_,_,2,_,1,_],
           [2,_,_,3,2,_,_,2,_,_],
           [_,3,_,_,_,3,2,_,_,3],
           [_,_,3,_,3,3,_,_,_,_],
           [_,2,_,2,_,_,_,2,2,_]]).


% Problem from Gecode/examples/minesweeper.cc  problem 3
problem(3,[[2,_,_,_,3,_,1,_],
           [_,5,_,4,_,_,_,1],
           [_,_,5,_,_,4,_,_],
           [2,_,_,_,4,_,5,_],
           [_,2,_,4,_,_,_,2],
           [_,_,5,_,_,4,_,_],
           [2,_,_,_,5,_,4,_],
           [_,3,_,3,_,_,_,2]]).


% Problem from Gecode/examples/minesweeper.cc  problem 4
problem(4,[[0,_,0,_,1,_,_,1,1,_],
           [1,_,2,_,2,_,2,2,_,_],
           [_,_,_,_,_,_,2,_,_,2],
           [_,2,3,_,1,1,_,_,_,_],
           [0,_,_,_,_,_,_,2,_,1],
           [_,_,_,2,2,_,1,_,_,_],
           [_,_,_,_,_,3,_,3,2,_],
           [_,5,_,2,_,_,_,3,_,1],
           [_,3,_,1,_,_,3,_,_,_],
           [_,2,_,_,_,1,2,_,_,0]]).


% Problem from Gecode/examples/minesweeper.cc  problem 5
problem(5,[[_,2,1,_,2,_,2,_,_,_],
           [_,4,_,_,3,_,_,_,5,3],
           [_,_,_,4,_,4,4,_,_,3],
           [4,_,4,_,_,5,_,6,_,_],
           [_,_,4,5,_,_,_,_,5,4],
           [3,4,_,_,_,_,5,5,_,_],
           [_,_,4,_,4,_,_,5,_,5],
           [2,_,_,3,3,_,6,_,_,_],
           [3,6,_,_,_,3,_,_,4,_],
           [_,_,_,4,_,2,_,2,1,_]]).



% Problem from Gecode/examples/minesweeper.cc  problem 6
problem(6,[[_,3,2,_,_,1,_,_],
           [_,_,_,_,1,_,_,3],
           [3,_,_,2,_,_,_,4],
           [_,5,_,_,_,5,_,_],
           [_,_,6,_,_,_,5,_],
           [3,_,_,_,5,_,_,4],
           [2,_,_,5,_,_,_,_],
           [_,_,2,_,_,3,4,_]]).


% Problem from Gecode/examples/minesweeper.cc  problem 7
problem(7,[[_,1,_,_,_,_,_,3,_],
           [_,_,_,3,4,3,_,_,_],
           [2,4,4,_,_,_,4,4,3],
           [_,_,_,4,_,4,_,_,_],
           [_,4,_,4,_,3,_,6,_],
           [_,_,_,4,_,3,_,_,_],
           [1,2,3,_,_,_,1,3,3],
           [_,_,_,3,2,2,_,_,_],
           [_,2,_,_,_,_,_,3,_]]).



% Problem from Gecode/examples/minesweeper.cc  problem 8
problem(8,[[_,_,_,_,_,_,_],
           [_,2,3,4,3,5,_],
           [_,1,_,_,_,3,_],
           [_,_,_,5,_,_,_],
           [_,1,_,_,_,3,_],
           [_,1,2,2,3,4,_],
           [_,_,_,_,_,_,_]]).


% Problem from Gecode/examples/minesweeper.cc  problem 9
problem(9,[[2,_,_,_,2,_,_,_,2],
           [_,4,_,4,_,3,_,4,_],
           [_,_,4,_,_,_,1,_,_],
           [_,4,_,3,_,3,_,4,_],
           [2,_,_,_,_,_,_,_,2],
           [_,5,_,4,_,5,_,4,_],
           [_,_,3,_,_,_,3,_,_],
           [_,4,_,3,_,5,_,6,_],
           [2,_,_,_,1,_,_,_,2]]).



% From "Some Minesweeper Configurations",page 2
problem(10,[[_,_,_,_,_,_],
            [_,2,2,2,2,_],
            [_,2,0,0,2,_],
            [_,2,0,0,2,_],
            [_,2,2,2,2,_],
            [_,_,_,_,_,_]]).



% From "Some Minesweeper Configurations",page 3
% 4 solutions
problem(11,[[2,3,_,2,2,_,2,1],
            [_,_,4,_,_,4,_,2],
            [_,_,_,_,_,_,4,_],
            [_,5,_,6,_,_,_,2],
            [2,_,_,_,5,5,_,2],
            [1,3,4,_,_,_,4,_],
            [0,1,_,4,_,_,_,3],
            [0,1,2,_,2,3,_,2]]).


% Richard Kaye: How Complicated is Minesweeper?
% http://web.mat.bham.ac.uk/R.W.Kaye/minesw/ASE2003.pdf
% 
% A Wire,page 33
% 2 solutions
%
problem(12,[[_,0,0,0,0,0,0,0,0,0,0,0,0,_],
            [_,1,1,1,1,1,1,1,1,1,1,1,1,_],
            [_,_,1,_,_,1,_,_,1,_,_,1,_,_],
            [_,1,1,1,1,1,1,1,1,1,1,1,1,_],
            [_,0,0,0,0,0,0,0,0,0,0,0,0,_]]).


% Richard Kaye: How Complicated is Minesweeper?
% http://web.mat.bham.ac.uk/R.W.Kaye/minesw/ASE2003.pdf
% A splitter,page 35
% Many solutions...
%
problem(13,[[_,_,_,0,_,_,_,0,_,_,_],
            [_,_,_,0,1,_,1,0,_,_,_],
            [_,_,_,0,1,_,1,0,_,_,_],
            [0,0,0,0,1,1,1,0,0,0,0],
            [_,1,1,1,1,_,1,1,1,1,_],
            [_,_,_,1,_,2,_,1,_,_,_],
            [_,1,1,1,1,_,1,1,1,1,_],
            [0,0,0,0,1,1,1,0,0,0,0],
            [_,_,_,0,1,_,1,0,_,_,_],
            [_,_,_,0,1,_,1,0,_,_,_],
            [_,_,_,0,_,_,_,0,_,_,_]]).
        


% Oleg German,Evgeny Lakshtanov: "Minesweeper" without a computer
% http://arxiv.org/abs/0806.3480,page 4
problem(14,[[_,1,_,1,_,1],
            [2,_,2,_,1,_],
            [_,3,_,2,_,1],
            [1,_,3,_,2,_],
            [_,1,_,2,_,1]]).
            
            
            
            
            
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EJERCICIOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
            

%%%%%%%%% EJERCICIO 1 %%%%%%%%%

%valor(-X)
valor(mina).
valor(N) :- between(0,8,N).


%%%%%%%%% EJERCICIO 2 %%%%%%%%%

%longitud(+L,-N)
longitud([],0).
longitud([_|L],N) :- longitud(L,Y), N is Y+1.

%dim(+T,-Cols,-Fils)
dim([],_,0).
dim([L|LS],C,F) :- longitud(L,C), longitud(LS,P), F is P+1.


%%%%%%%%% EJERCICIO 3 %%%%%%%%%

%pos(+T, -C, -F)
pos(T,C,F) :- dim(T,COLS,FILS), between(1,FILS,F), between(1,COLS,C).


%%%%%%%%% EJERCICIO 4 %%%%%%%%%

%nonvars(?L, −R)
nonvars([],[]).
nonvars([X|XS],L) :- nonvar(X), nonvars(XS,LS), append([X],[LS],L).
nonvars([X|XS],L) :- var(X), nonvars(XS,LS), append([],LS,L).


%%%%%%%%% EJERCICIO 5 %%%%%%%%%

%cant_minas(?L,-N)
cant_minas([],0).
cant_minas([X|XS],N) :- nonvar(X), esMina(X), cant_minas(XS,M), N is M+1.
cant_minas([X|XS],N) :- nonvar(X), not(esMina(X)), cant_minas(XS,N).
cant_minas([X|XS],N) :- var(X), cant_minas(XS,N).

%esMina(+X)
esMina(mina).


%%%%%%%%% EJERCICIO 6 %%%%%%%%%

%vecinos(+T, +C, +F, −L) 
vecinos(T,C,F,Vecinos) :- bagof(Vecino,vecinos_aux(T,C,F,Vecino),Vecinos).
vecinos_aux(T,C,F,Vecino) :- Fm1 is F-1, FM1 is F+1, Cm1 is C-1, CM1 is C+1,
			     between(Fm1,FM1,I),between(Cm1,CM1,J),not(igualesDeAPares(F,C,I,J)),
		             dame_valor(T,J,I,Vecino).

%igualesDeAPares(+C,+F,+I,+J)
igualesDeAPares(C,F,I,J) :- C =:= I, F =:= J.

%dame_valor(+T,+C,+F,-Elem) En Elem pone el valor en la posicion C,F en un campo minado T.
dame_valor(T,C,F,Elem) :- elem_en_pos(T,F,Fila),elem_en_pos(Fila,C,Elem). 

%elem_en_pos(+T,+P,-Elem). En Elem pone el valor en la posicion P de la lista T.
elem_en_pos([Cab|_],1,Cab).
elem_en_pos([_|Cola],N,X) :- F is N-1,F > 0 , elem_en_pos(Cola,F,X).


%%%%%%%%% EJERCICIO 7 %%%%%%%%%


%consistente(+T,+C,+F) 
consistente(T,C,F) :- dame_valor(T,C,F,Elem),esMina(Elem).
consistente(T,C,F) :- dame_valor(T,C,F,Elem),not(esMina(Elem)), vecinos(T,C,F,L), cant_minas(L,N), Elem =:= N.


%%%%%%%%% EJERCICIO 8 %%%%%%%%%

%consistente(+T)
consistente(T) :- not(consistente_aux(T)).
consistente_aux(T) :- pos(T,C,F), not(consistente(T,C,F)).


%%%%%%%%% EJERCICIO 9 %%%%%%%%%

%completarA(?T)
completarA(T) :- todoInstanciado(T), consistente(T).


%todoInstanciado(?T) RECIBE UN TABLERO Y LO INSTANCIA SI HACE FALTA
todoInstanciado([]).
todoInstanciado([X|XS]) :- nonvar(X),listaInstanciada(X), todoInstanciado(XS).
todoInstanciado([X|XS]) :- var(X), dim(XS,Cols,_), listaDeVarDeLong(Cols,L), todoInstanciado([L|XS]).


%listaInstanciada(?X) RECIBE UNA LISTA Y LA INSTANCIA SI HACE FALTA
listaInstanciada([]).
listaInstanciada([X|XS]) :- nonvar(X), listaInstanciada(XS).
listaInstanciada([X|XS]) :- var(X), valor(X), listaInstanciada(XS).



%%%%%%%%% EJERCICIO 10 %%%%%%%%%
completarB(T) :- dim(T,Cols,Fils), completarAuxB(T,Cols,Fils,Cols,Fils), consistente(T).


%completarAuxB(?T,+C,+F,+Cols,+Fils). Completa el tablero de todas las formas posibles desde la posicion (F,C), recorriendo de derecha a izquierda y de abajo hacia arriba hasta llegar a la posicion (1,1).

%CASO A: primer casillero (ultimo de la recursion)
completarAuxB(T,1,1,_,_) :- 	completarPos(T,1,1), consistente(T,1,1),
				consistente(T,2,1), consistente(T,1,2),
				consistente(T,2,2).

%CASO B: primer fila, cualquier columna que no sea extremo
completarAuxB(T,C,1,Cols,Fils) :- 	C>1, C<Cols,
					completarPos(T,C,1),
					CM1 is C+1,
					consistente(T,CM1,1),
					consistente(T,CM1,2),
					Cm1 is C-1,
					completarAuxB(T,Cm1,1,Cols,Fils).
					
%CASO C: ultima columna, cualquier fila menos la ultima
completarAuxB(T,C,F,Cols,Fils) :- 	C=:=Cols, F<Fils,
					completarPos(T,C,F),
					Cm1 is C-1,
					completarAuxB(T,Cm1,F,Cols,Fils).

%CASO D: primer columna, cualquier fila que no es extremo
completarAuxB(T,1,F,Cols,Fils) :- 	F<Fils, F>1,
					completarPos(T,1,F),
					FM1 is F+1,
					consistente(T,1,FM1),
					consistente(T,2,FM1),
					Fm1 is F-1,
					completarAuxB(T,Cols,Fm1,Cols,Fils).

%CASO E: filas y columnas que no son extremos
completarAuxB(T,C,F,Cols,Fils) :- 	C>1, C<Cols, F>1, F<Fils,
					completarPos(T,C,F),
					CM1 is C+1,
					FM1 is F+1,
					consistente(T,CM1,FM1),
					Cm1 is C-1,
					completarAuxB(T,Cm1,F,Cols,Fils).
					
%CASO F: primer columna, ultima fila
completarAuxB(T,1,F,Cols,Fils) :- 	F=:=Fils,
					completarPos(T,1,F),
					Fm1 is F-1,
					completarAuxB(T,Cols,Fm1,Cols,Fils).
					
%CASO G: ultima fila, cualquier columna menos la primera
completarAuxB(T,C,F,Cols,Fils) :- 	F=:=Fils, C>1,
					completarPos(T,C,F),
					Cm1 is C-1,
					completarAuxB(T,Cm1,F,Cols,Fils).
					
%EJEMPLO DE COMO DIVIDIMOS EL TABLERO
%
% A B B B B C
% D E E E E C
% D E E E E C
% . . . . . .
% D E E E E C
% F G G G G G
%
% donde cada letra se corresponde con el CASO de completarAuxB que cubre esa posicion


%completarPos(?T,+C,+F)
completarPos(T,C,F) :- dame_valor(T,C,F,Elem), var(Elem), valor(Elem).
completarPos(T,C,F) :- dame_valor(T,C,F,Elem), nonvar(Elem).



%%%%%%%%% EJERCICIO CASI 11 %%%%%%%%%

%completarC(?T)
completarC(T) :- dim(T,Cols,Fils), completarAux(T,Cols,Fils), consistente(T).

%completarAux(T) completa el tablero de todas las formas posibles
completarAux(T,1,1) :- completarPos(T,1,1), consistenteConVariables(T,1,1).

completarAux(T,1,F) :- 	dim(T,Cols,_),
			completarPos(T,1,F),
			consistenteConVariables(T,1,F),
			Fm1 is F-1,
			completarAux(T,Cols,Fm1).

completarAux(T,C,F) :- 	C>1, 
			completarPos(T,C,F),
			consistenteConVariables(T,C,F),
			Cm1 is C-1,
			completarAux(T,Cm1,F).


%consistenteConVariables(+T,+C,+F) 
consistenteConVariables(T,C,F) :- dame_valor(T,C,F,Elem),esMina(Elem).
consistenteConVariables(T,C,F) :- dame_valor(T,C,F,Elem),not(esMina(Elem)), vecinos(T,C,F,L), cantvars(L,CantVars), cant_minas(L,N), Elem >= N, Elem=<CantVars+N.


cantvars([],0).
cantvars([X|XS],N) :- var(X), cantvars(XS,M), N is M+1.
cantvars([X|XS],N) :- nonvar(X), cantvars(XS,N).
