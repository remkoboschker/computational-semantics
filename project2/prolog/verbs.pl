% intransitive verbs
%
iv(prp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiling].
iv(dcl,sg, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiles].
iv(dcl,pl, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(bse,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(psp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiled].

iv(prp,_,  lam(X,shine(X))) --> [shining].
iv(dcl,sg, lam(X,X)) --> [shines].
iv(dcl,pl, lam(X,X)) --> [shine].
iv(bse,_,  lam(X,X)) --> [shine].
iv(psp,_,  lam(X,X)) --> [shined].

iv(prp,_,  lam(X,X)) --> [walking].
iv(dcl,sg, lam(X,X)) --> [walks].
iv(dcl,pl, lam(X,X)) --> [walk].
iv(bse,_,  lam(X,X)) --> [walk].
iv(psp,_,  lam(X,X)) --> [walked].

iv(prp,_,  lam(X,stare(X))) --> [staring].
iv(dcl,sg, lam(X,X)) --> [stares].
iv(dcl,pl, lam(X,X)) --> [stare].
iv(bse,_,  lam(X,X)) --> [stare].
iv(psp,_,  lam(X,X)) --> [stared].

iv(prp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flying].
iv(dcl,sg, lam(X,not(some(Y,s_supports(Y,X))))) --> [flies].
iv(dcl,pl, lam(X,not(some(Y,s_supports(Y,X))))) --> [flying].
iv(bse,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flew].
iv(psp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flown].

iv(prp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [standing].
iv(dcl,sg, lam(X,some(Y,s_supports(Y,X)))) --> [stands].
iv(dcl,pl, lam(X,some(Y,s_supports(Y,X)))) --> [stand].
iv(bse,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stood].
iv(psp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stood].

% transitive verbs
%
tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [riding].
tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(X,Y)))))) --> [holding];[wearing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [rides],[wears].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ride],[wear].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ride],[wear].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ridden],[worn].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chasing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chases].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chase].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chased].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chased].


tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kisses].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kiss].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed].

tv(prp,_,  lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eating].
tv(dcl,sg, lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eats].
tv(dcl,pl, lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eat].
tv(bse,_,  lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [ate].
tv(psp,_,  lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eaten].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [having].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [has].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [have].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [had].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [had].

% ditransitive verbs
%
dv(prp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sending].
dv(dcl,sg, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sends].
dv(dcl,pl, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(bse,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sent].
