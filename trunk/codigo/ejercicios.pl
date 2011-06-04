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

