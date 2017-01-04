% nouns
%
n0(sg,a,  lam(X,n_cap_1(X)))   --> [cap].
n0(sg,a,  lam(X,n_hat_1(X)))   --> [hat].
n0(sg,a,  lam(X,n_cat_1(X)))   --> [cat].
n0(pl,_,  lam(X,n_dog_1(X)))   --> [cats].
n0(sg,an, lam(X,n_apple_1(X))) --> [apple].
n0(sg,a,  lam(X,n_woman_1(X))) --> [woman].
n0(sg,a,  lam(X,n_man_1(X)))   --> [man].
n0(sg,a,  lam(X,n_book_1(X)))   --> [book].
n0(sg,a,  lam(X,n_bicycle_1(X)))   --> [bicycle].
n0(sg,a,  lam(X,n_dog_1(X)))   --> [dog].
n0(sg,a,  lam(X,n_bird_1(X)))   --> [bird].
n0(pl,_,  lam(X,n_dog_1(X)))   --> [dogs].

# picture1
n0(sg,a,  lam(X,n_boy_1(X)))   --> [boy].
n0(sg,a,  lam(X,n_head_1(X)))   --> [head].
n0(sg,a,  lam(X,n_wet_suit_1(X)))   --> [wet_suit].
n0(sg,a,  lam(X,n_dolphin_2(X)))   --> [dolphin].
n0(sg,_,  lam(X,n_water_2(X)))   --> [water].
#
# picture2
n0(sg,a,  lam(X,n_cactus_1(X)))   --> [cactus].
n0(pl,_,  lam(X,n_cactus_1(X)))   --> [cactuses].
n0(sg,a,  lam(X,n_table_1(X)))   --> [table].
n0(sg,a,  lam(X,n_planter_3(X)))   --> [planter].
n0(sg,a,  lam(X,n_saucer_2(X)))   --> [saucer].
#
# picture3
n0(sg,a,  lam(X,n_car_1(X)))   --> [car].
n0(sg,a,  lam(X,n_person_1(X)))   --> [person].
n0(pl,_,  lam(X,n_person_1(X)))   --> [persons].
n0(sg,a,  lam(X,n_sun_1(X)))   --> [sun].
n0(sg,a,  lam(X,n_desert_1(X)))   --> [desert].
n0(sg,a,  lam(X,n_wheel_1(X)))   --> [wheel].
n0(pl,_,  lam(X,n_wheel_1(X)))   --> [wheels].
#
#picture4
n0(sg,a,  lam(X,n_domestic_cat_1(X)))   --> [domestic_cat].
n0(pl,_,  lam(X,n_domestic_cat_1(X)))   --> [domestic_cats].
n0(sg,a,  lam(X,n_skateboard_1(X)))   --> [skateboard].
n0(sg,a,  lam(X,n_roller_1(X)))   --> [roller].
n0(pl,_,  lam(X,n_roller_1(X)))   --> [rollers].
#
#picture5
n0(sg,an,  lam(X,n_angora_4(X)))   --> [angora].
n0(sg,a,  lam(X,n_tumbler_2(X)))   --> [tumbler].
n0(sg,_,  lam(X,n_water_6(X)))   --> [water].
n0(sg,a,  lam(X,n_cat_food_1(X)))   --> [cat_food].
#

% adjectives
%
a0(a,  lam(P,lam(X,and(a_white_1(X),app(P,X))))) --> [white].
a0(a,  lam(P,lam(X,and(a_black_1(X),app(P,X))))) --> [black].
a0(an, lam(P,lam(X,and(a_orange_1(X),app(P,X))))) --> [orange].
a0(a,  lam(P,lam(X,and(a_blue_1(X),app(P,X))))) --> [blue].
a0(a,  lam(P,lam(X,and(not(some(Y,s_supports(Y,X))),app(P,X))))) --> [flying].

# picture1
a0(a,  lam(P,lam(X,and(a_yellow_1(X),app(P,X))))) --> [yellow].
a0(a,  lam(P,lam(X,and(a_gray_1(X),app(P,X))))) --> [gray].
#
# picture2
a0(a,  lam(P,lam(X,and(a_wooden_1(X),app(P,X))))) --> [wooden].
a0(a,  lam(P,lam(X,and(a_brick_red_1(X),app(P,X))))) --> [brick_red].
#
# picture 5
a0(a,  lam(P,lam(X,and(a_brown_1(X),app(P,X))))) --> [brown].
#

% intransitive verbs
%
iv(prp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiling].
iv(dcl,sg, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiles].
iv(dcl,pl, lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(bse,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smile].
iv(psp,_,  lam(X,some(Y,and(n_mouth_1(Y),and(s_part_of(Y,X),a_open_1(Y)))))) --> [smiled].

#picture3
iv(prp,_,  lam(X,some(Y))) --> [shining].
iv(dcl,sg, lam(X,some(Y))) --> [shines].
iv(dcl,pl, lam(X,some(Y))) --> [shine].
iv(bse,_,  lam(X,some(Y))) --> [shine].
iv(psp,_,  lam(X,some(Y))) --> [shined].

iv(prp,_,  lam(X,some(Y))) --> [walking].
iv(dcl,sg, lam(X,some(Y))) --> [walkes].
iv(dcl,pl, lam(X,some(Y))) --> [walk].
iv(bse,_,  lam(X,some(Y))) --> [walk].
iv(psp,_,  lam(X,some(Y))) --> [walked].
#

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

#picture1
tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissing].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kisses].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kiss].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [kissed].
#
#picture5
tv(prp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [eating].
tv(dcl,sg, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [eats].
tv(dcl,pl, lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [eat].
tv(bse,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [ate].
tv(psp,_,  lam(P,lam(X,app(P,lam(Y,s_touch(X,Y)))))) --> [eaten].

% ditransitive verbs
%
dv(prp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sending].
dv(dcl,sg, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sends].
dv(dcl,pl, lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(bse,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [send].
dv(psp,_,  lam(P,lam(Q,lam(X,app(P,lam(Y,app(Q,lam(Z,'X'(X,Y,Z))))))))) --> [sent].
 

