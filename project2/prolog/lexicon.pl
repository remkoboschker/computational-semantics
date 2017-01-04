% nouns
%
n0(sg,a,  lam(X,n_cap_1(X)))   --> [cap].
n0(sg,a,  lam(X,n_hat_1(X)))   --> [hat].
n0(sg,a,  lam(X,n_cat_1(X)))   --> [cat].
n0(sg,an, lam(X,n_apple_1(X))) --> [apple].
n0(sg,a,  lam(X,n_woman_1(X))) --> [woman].
n0(sg,a,  lam(X,n_man_1(X)))   --> [man].
n0(sg,a,  lam(X,n_book_1(X)))   --> [book].
n0(sg,a,  lam(X,n_bicycle_1(X)))   --> [bicycle].
n0(sg,a,  lam(X,n_dog_1(X)))   --> [dog].
n0(sg,a,  lam(X,n_bird_1(X)))   --> [bird].
n0(pl,_,  lam(X,n_dog_1(X)))   --> [dogs].
n0(sg,a, lam(X,n_child_1(X))) --> [baby].
n0(sg,a, lam(X,n_melon_2(X))) --> [melon].
n0(sg,a, lam(X,n_bald_eagle_1(X))) --> ['bald eagle'].
n0(sg,a, lam(X,n_claw_1(X))) --> [claw].
n0(sg,an, lam(X,n_accordion_1(X))) --> [accordion].
n0(sg,a, lam(X,n_suitcase_1(X))) --> [suitcase].
n0(sg,a, lam(X,n_picture_1(X))) --> [picture].
n0(sg,a, lam(X,n_dress_1(X))) --> [dress].
n0(sg,a, lam(X,n_parasol_1(X))) --> [parasol].
n0(sg,a, lam(X,n_rock_1(X))) --> [rock].
n0(sg,a, lam(X,n_lawn_1(X))) --> [lawn].
n0(sg,a, lam(X,n_head_1(X))) --> [head].



% adjectives
%
a0(a,  lam(P,lam(X,and(a_white_1(X),app(P,X))))) --> [white].
a0(a,  lam(P,lam(X,and(a_black_1(X),app(P,X))))) --> [black].
a0(an, lam(P,lam(X,and(a_orange_1(X),app(P,X))))) --> [orange].
a0(a,  lam(P,lam(X,and(a_blue_1(X),app(P,X))))) --> [blue].
a0(a,  lam(P,lam(X,and(not(some(Y,s_supports(Y,X))),app(P,X))))) --> [flying].

% intransitive verbs
%
iv(prp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiling].
iv(dcl,sg, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiles].
iv(dcl,pl, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(bse,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(psp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiled].

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

% X is eating Y -> there is a mouth, the mouth is part of X, the mouth touches Y
tv(prp,_, lam(P, lam(X,app(P,lam(Y,some(Z,and(n_mouth_1(Z),and(s_part_of(Z,X),s_touches(Z,Y))))))))) --> [eating].

% ditransitive verbs
%
dv(prp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sending].
dv(dcl,sg, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sends].
dv(dcl,pl, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(bse,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sent].
