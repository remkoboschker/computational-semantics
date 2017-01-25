% intransitive verbs
%
iv(prp,_,  lam(X,and(v_lie_2(X)))) --> [lying].
iv(dcl,sg, lam(X,and(v_lie_2(X)))) --> [lies].
iv(dcl,pl, lam(X,and(v_lie_2(X)))) --> [lie].
iv(bse,_,  lam(X,and(v_lie_2(X)))) --> [lay].
iv(psp,_,  lam(X,and(v_lie_2(X)))) --> [laid].

iv(prp,_,  lam(X,and(v_swim_1(X)))) --> [swimming].
iv(dcl,sg, lam(X,and(v_swim_1(X)))) --> [swims].
iv(dcl,pl, lam(X,and(v_swim_1(X)))) --> [swim].
iv(bse,_,  lam(X,and(v_swim_1(X)))) --> [swam].
iv(psp,_,  lam(X,and(v_swim_1(X)))) --> [swum].

iv(prp,_,  lam(X,and(v_sit_1(X)))) --> [sitting].
iv(dcl,sg, lam(X,and(v_sit_1(X)))) --> [sits].
iv(dcl,pl, lam(X,and(v_sit_1(X)))) --> [sit].
iv(bse,_,  lam(X,and(v_sit_1(X)))) --> [sat].
iv(psp,_,  lam(X,and(v_sit_1(X)))) --> [sat].

iv(prp,_,  lam(X,and(v_fly_1(X)))) --> [flying].
iv(dcl,sg, lam(X,and(v_fly_1(X)))) --> [flies].
iv(dcl,pl, lam(X,and(v_fly_1(X)))) --> [fly].
iv(bse,_,  lam(X,and(v_fly_1(X)))) --> [flew].
iv(psp,_,  lam(X,and(v_fly_1(X)))) --> [flown].

iv(prp,_,  lam(X,and(v_park_2(X)))) --> [parking].
iv(dcl,sg, lam(X,and(v_park_2(X)))) --> [parks].
iv(dcl,pl, lam(X,and(v_park_2(X)))) --> [park].
iv(bse,_,  lam(X,and(v_park_2(X)))) --> [parked].
iv(psp,_,  lam(X,and(v_park_2(X)))) --> [parked].

iv(prp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiling].
iv(dcl,sg, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiles].
iv(dcl,pl, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(bse,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(psp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiled].

iv(prp,_,  lam(X,v_shine_1(X))) --> [shining].
iv(dcl,sg, lam(X,v_shine_1(X))) --> [shines].
iv(dcl,pl, lam(X,v_shine_1(X))) --> [shine].
iv(bse,_,  lam(X,v_shine_1(X))) --> [shined].
iv(psp,_,  lam(X,v_shine_1(X))) --> [shined].

iv(prp,_,  lam(X,v_walk_1(X))) --> [walking].
iv(dcl,sg, lam(X,v_walk_1(X))) --> [walks].
iv(dcl,pl, lam(X,v_walk_1(X))) --> [walk].
iv(bse,_,  lam(X,v_walk_1(X))) --> [walked].
iv(psp,_,  lam(X,v_walk_1(X))) --> [walked].

iv(prp,_,  lam(X,v_stare_1(X))) --> [staring].
iv(dcl,sg, lam(X,v_stare_1(X))) --> [stares].
iv(dcl,pl, lam(X,v_stare_1(X))) --> [stare].
iv(bse,_,  lam(X,v_stare_1(X))) --> [stared].
iv(psp,_,  lam(X,v_stare_1(X))) --> [stared].

iv(prp,_,  lam(X,v_look_1(X))) --> [looking].
iv(dcl,sg, lam(X,v_look_1(X))) --> [looks].
iv(dcl,pl, lam(X,v_look_1(X))) --> [look].
iv(bse,_,  lam(X,v_look_1(X))) --> [looked].
iv(psp,_,  lam(X,v_look_1(X))) --> [looked].

iv(prp,_,  lam(X,v_be_3(X))) --> [being].
iv(dcl,sg, lam(X,v_be_3(X))) --> [is].
iv(dcl,pl, lam(X,v_be_3(X))) --> [are].
iv(bse,_,  lam(X,v_be_3(X))) --> [were].
iv(psp,_,  lam(X,v_be_3(X))) --> [been].

iv(prp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flying].
iv(dcl,sg, lam(X,not(some(Y,s_supports(Y,X))))) --> [flies].
iv(dcl,pl, lam(X,not(some(Y,s_supports(Y,X))))) --> [fly].
iv(bse,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flew].
iv(psp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flown].

iv(prp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [leaning].
iv(dcl,sg, lam(X,not(some(Y,s_supports(Y,X))))) --> [leans].
iv(dcl,pl, lam(X,not(some(Y,s_supports(Y,X))))) --> [lean].
iv(bse,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [leaned].
iv(psp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [leaned].

iv(prp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [standing].
iv(dcl,sg, lam(X,some(Y,s_supports(Y,X)))) --> [stands].
iv(dcl,pl, lam(X,some(Y,s_supports(Y,X)))) --> [stand].
iv(bse,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stood].
iv(psp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stood].

iv(prp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flying].
iv(dcl,sg, lam(X,not(some(Y,s_supports(Y,X))))) --> [flies].
iv(dcl,pl, lam(X,not(some(Y,s_supports(Y,X))))) --> [fly].
iv(bse,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flew].
iv(psp,_,  lam(X,not(some(Y,s_supports(Y,X))))) --> [flown].

iv(prp,_,  lam(X,X)) --> [drinking].
iv(dcl,sg, lam(X,X)) --> [drinks].
iv(dcl,pl, lam(X,X)) --> [drink].
iv(bse,_,  lam(X,X)) --> [drank].
iv(psp,_,  lam(X,X)) --> [drunk].

iv(_,_,  lam(X,X)) --> [_].

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

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissing];[touching];[tying].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kisses];[touches];[ties].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kiss];[touch];[tie].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed];[touched];[tied].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed];[touched];[tied].

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

tv(_,_,    lam(P,lam(X,app(P,lam(Y,not(eq(X,Y))))))) --> [_].

% ditransitive verbs
%
dv(prp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sending].
dv(dcl,sg, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sends].
dv(dcl,pl, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(bse,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sent].

dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,and(and(not(eq(X,Y)),not(eq(Y,Z))),not(eq(X,Z))))))))))) --> [_].

