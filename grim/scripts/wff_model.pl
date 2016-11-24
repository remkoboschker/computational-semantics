
wff_model(M,File):- 
   nonvar(M), (M=model(D,F);M=model(D,F,_)), 
   nonvar(D), D=[_|_], 
   nonvar(F), F=[_|_], !,
   wff_domain(D,[],Entities,File),
   wff_function(F,[],Entities,File).
wff_model(M,File):-
   format('~p: not well-formed model ~p~n',[File,M]).

wff_domain([],A,A,_):- !.
wff_domain([X|L1],A,L2,File):-
   nonvar(X), atom(X), 
   \+ member(X,A), !, 
   wff_domain(L1,[X|A],L2,File).
wff_domain([X|L1],A,L2,File):- 
   format('~p: not well-formed domain element ~p~n',[File,X]), 
   wff_domain(L1,A,L2,File).

wff_function([],_,_,_):- !.
wff_function([F|L],A,Domain,File):-
   nonvar(F), 
   F=f(Arity,Symbol,Extension),
   nonvar(Arity), number(Arity),
   nonvar(Symbol), atom(Symbol), 
   \+ member(Arity:Symbol,A), !,
   wff_extension(Arity,Extension,Domain,File),
   wff_function(L,[Arity:Symbol|A],Domain,File).
wff_function([F|L],A,Domain,File):- 
   format('~p: not well-formed function ~p~n',[File,F]),
   wff_function(L,A,Domain,File).

wff_extension(0,Extension,Domain,_):- 
   nonvar(Extension), atom(Extension), 
   member(Extension,Domain), !.
wff_extension(1,Extension,Domain,_):- 
   nonvar(Extension), (Extension = []; Extension = [_|_]),
   \+ (select(X,Extension,Rest), member(X,Rest)),
   \+ (member(X,Extension), \+ member(X,Domain)), !.
wff_extension(2,Extension,Domain,_):- 
   nonvar(Extension), (Extension = []; Extension = [_|_]),
   \+ (member(P,Extension), \+ P=(_,_)),
   \+ (select(P,Extension,Rest), member(P,Rest)),
   \+ (member((X,_),Extension), \+ member(X,Domain)), 
   \+ (member((_,X),Extension), \+ member(X,Domain)), !.
wff_extension(Arity,Extension,_,File):-
   format('~p: not well-formed extension ~p of arity ~p~n',[File,Extension,Arity]).

main(File):-
   open(File,read,Stream),
   read(Stream,Model),
   close(Stream), 
   wff_model(Model,File).
