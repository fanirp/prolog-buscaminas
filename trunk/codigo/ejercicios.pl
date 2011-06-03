%entre(+X,+Y,-Z)
entre(X,Y,X) :- X=<Y.
entre(X,Y,Z) :- X<Y,N is X+1,entre(N,Y,Z).

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
