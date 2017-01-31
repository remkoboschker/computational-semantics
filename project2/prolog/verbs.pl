

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

iv(prp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [standing];[sitting];[lying].
iv(dcl,sg, lam(X,some(Y,s_supports(Y,X)))) --> [stands];[sits];[lies].
iv(dcl,pl, lam(X,some(Y,s_supports(Y,X)))) --> [stand];[sit];[lie].
iv(bse,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stood];[sat];[lied].
iv(psp,_,  lam(X,some(Y,s_supports(Y,X)))) --> [stood];[sat];[lied].

% needs eq as a unit because otherwise you get a dangling variable
iv(prp,_,  lam(X,eq(X,X))) --> [drinking];[coming];[looking];[shining];[running];[playing];[staring];[covering];[barking];[walking];[chilling];[biting];[sleeping];[swimming];[biking];[writing];[smiling];[flying];[leaning];[standing];[sitting];[lying].
iv(dcl,sg, lam(X,eq(X,X))) --> [drinks];[covers];[barks];[runs];[walks]:[smiles];[flies];[leans];[stands];[sits];[lies].
iv(dcl,pl, lam(X,eq(X,X))) --> [drink];[cover];[bark];[run];[walk]:[smile];[fly];[lean];[stand];[sit];[lie].
iv(bse,_,  lam(X,eq(X,X))) --> [drank];[covered];[barked];[ran];[walked]:[smiled];[flew];[leaned];[stood];[sat];[lied].
iv(psp,_,  lam(X,eq(X,X))) --> [drunk];[made];[parked];[covered];[barked];[run];[walked];[smiled];[flown];[leaned];[stood];[sat];[lied].

%iv(_,_,  lam(X,eq(X,X))) --> [_].

% transitive verbs
%
tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [riding];[holding];[wearing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [rides];[wears].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ride];[wear].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [rode];[wore].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_supports(Y,X)))))) --> [ridden];[worn].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chasing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chases].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chase].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chased].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [chased].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissing];[touching];[tying];[eating];[drinking].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kisses];[touches];[ties];[eats];[drinks].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kiss];[touch];[tie];[eat];[drink].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed];[touched];[tied];[ate];[drank].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed];[touched];[tied];[eaten];[drunk].

tv(prp,_,  lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eating];[drinking].
tv(dcl,sg, lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eats];[drinks].
tv(dcl,pl, lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eat;[drink]].
tv(bse,_,  lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [ate];[drank].
tv(psp,_,  lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eaten];[drunk].

tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [having].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [has].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [have].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [had].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_near(X,Y)))))) --> [had].

% non reflexives
% the is a much better representation for containing using spatial relations. but for some reason,
% these are not annotated in the models.
tv(prp,_,  lam(P,lam(X,app(P,lam(Y,not(eq(X,Y))))))) --> [using];[playing];[containing];[opening];[tying];[jumping];[facing];[opening];[crunching];[munching];[riding];[holding];[wearing];[chasing];[kissing];[touching];[tying];[eating];[drinking].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,not(eq(X,Y))))))) --> [uses];[contains];[rides];[wears];[chases];[kisses];[touches];[ties];[eats];[drinks].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,not(eq(X,Y))))))) --> [use];[contain];[ride];[wear];[chase];[kiss];[touch];[tie];[eat];[drink].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,not(eq(X,Y))))))) --> [used];[contained];[rode];[wore];[chased];[kissed];[touched];[tied];[ate];[drank].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,not(eq(X,Y))))))) --> [used];[contained];[ridden];[worn];[chased]; [kissed];[touched];[tied];[eaten];[drunk].

%tv(_,_,    lam(P,lam(X,app(P,lam(Y,not(eq(X,Y))))))) --> [_].

% ditransitive verbs
%
dv(prp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sending].
dv(dcl,sg, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sends].
dv(dcl,pl, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(bse,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sent].

% dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,and(and(not(eq(X,Y)),not(eq(Y,Z))),not(eq(X,Z))))))))))) --> [_].

