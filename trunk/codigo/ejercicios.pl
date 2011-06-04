%valor(-X)
valor(mina).
valor(N) :- between(0,8,N).


%longitud(+L,-N)
longitud([],0).
longitud([_|L],N) :- longitud(L,Y), N is Y+1.

%dimension(+T,-Cols,-Fils)
dimension([],_,0).
dimension([L|LS],C,F) :- longitud(L,C), dimension(LS,C,P), F is P+1.

%pos(+T, -C, -F)
pos(T,C,F) :- dimension(T,COLS,FILS), between(1,FILS,F), between(1,COLS,C).

%nonvars(?L, −R)
nonvars([],[]).
nonvars([X|XS],L) :- nonvar(X), nonvars(XS,LS), append([X],[LS],L).
nonvars([X|XS],L) :- var(X), nonvars(XS,LS), append([],LS,L).

%cant_minas(?L,-N)
cant_minas([],0).
cant_minas([X|XS],N) :- nonvar(X), esMina(X), cant_minas(XS,M), N is M+1.
cant_minas([X|XS],N) :- nonvar(X), not(esMina(X)), cant_minas(XS,N).
cant_minas([X|XS],N) :- var(X), cant_minas(XS,N).

%esMina(+X)
esMina(mina).

%vecinos(+T, +C, +F, −L) 
vecinos(T,C,F,Vecinos) :- setof(Vecino,vecinos_aux(T,C,F,Vecino),Vecinos).
vecinos_aux(T,C,F,Vecino) :- Fm1 is F-1, FM1 is F+1, Cm1 is C-1, CM1 is C+1,
			     between(Fm1,FM1,I),between(Cm1,CM1,J),not(igualesDeAPares(C,F,I,J)),
		             dame_valor(T,J,I,Vecino).

%igualesDeAPares(+C,+F,+I,+J)
igualesDeAPares(C,F,I,J) :- C =:= I, F =:= J.

%dame_valor(+T,+C,+F,-Elem) En Elem pone el valor en la posicion C,F en un campo minado T.
dame_valor(T,C,F,Elem) :- elem_en_pos(T,F,Fila),elem_en_pos(Fila,C,Elem). 

%elem_en_pos(+T,+P,-Elem). En Elem pone el valor en la posicion P de la lista T.
elem_en_pos([Cab|Cola],1,Cab).
elem_en_pos([Cab|Cola],N,X) :- F is N-1,F > 0 , elem_en_pos(Cola,F,X).




