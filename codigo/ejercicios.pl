%entre(+X,+Y,-Z)
entre(X,Y,X) :- X=<Y.
entre(X,Y,Z) :- X<Y,N is X+1,entre(N,Y,Z).

%esPar(+X)
esPar(0).
esPar(X) :- X>0,N is X-2,esPar(N).

%pares(+X,-Z)
pares(X,Z) :- esPar(X), Z is X.
pares(X,Z) :- esPar(X), Y is X+2, pares(Y,Z).


%valor(-X)
valor(mina).
valor(N) :- entre(0,8,N).


%longitud(+L,-N)
longitud([],0).
longitud([X|L],N) :- longitud(L,Y), N is Y+1.

%dimension(+T,-Cols,-Fils)
dimension([],_,0).
dimension([L|LS],C,F) :- longitud(L,C), dimension(LS,C,P), F is P+1.

%pos(+T, -C, -F)
pos(T,C,F) :- dimension(T,COLS,FILS), entre(1,FILS,F), entre(1,COLS,C). 
