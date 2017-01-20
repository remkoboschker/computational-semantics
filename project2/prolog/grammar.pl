% sentences
%
s(app(PT,app(NP,lam(X,some(Y,eq(Y,X)))))) --> np(_,NP), punct(PT).
s(app(PT,app(NP,VP))) --> np(Num,NP), vp(dcl,Num,VP), punct(PT).
s(app(PT,app(NP,app(AV,VP)))) --> [there], av(dcl,Num,prp,AV), np(Num,NP), vp(prp,Num,VP), punct(PT).%I don't like this, because in "there is a necklace", "is" isn't an av
s(app(PT,app(NP,lam(X,some(Y,eq(Y,X)))))) --> [there, is],  np(sg,NP), punct(PT).%there is a single thing
s(app(PT,app(NP,lam(X,some(Y,not(eq(X,Y))))))) --> [there, are],  np(pl,NP), punct(PT).%there are a multiple things

% punctuation
%
punct(lam(F,F)) --> [].
punct(lam(F,F)) --> ['.'].

% verb phrases
%
vp(Mood,Num,Sem) --> vp1(Mood,Num,Sem).
vp(Mood,Num,app(AV,VP)) --> av(Mood,Num,Tense,AV), vp1(Tense,Num,VP).
vp(Mood,Num,lam(X,and(app(VP,X),app(PP,X)))) --> vp1(Mood,Num,VP), pp(PP).
vp(Mood,Num,lam(X,app(app(Sem,app(VP1,X)),app(VP2,X)))) --> vp1(Mood,Num,VP1), conj(Sem), vp(Mood,Num,VP2).

vp1(Tense,Num,Sem) --> iv(Tense,Num,Sem).
vp1(Tense,Num,app(TV,NP)) --> tv(Tense,Num,TV), np(_,NP).
vp1(Tense,Num,app(AV,IV)) --> av(Tense,Num,prp,AV), iv(prp,Num,IV).
vp1(Tense,Num,app(AV,IV)) --> av(Tense,Num,psp,AV), iv(psp,Num,IV).
vp1(Tense,Num,app(app(DV,NP1),NP2)) --> dv(Tense,Num,DV), np(_,NP1), np(_,NP2).
vp1(Tense,Num,app(AV,app(A,lam(X,n_thing_12(X))))) --> av(Tense,Num,prp,AV), a(_,A).


% passives
%
vp1(pss,Num,lam(X,app(lam(P,some(Y,and(n_thing_12(Y),app(P,Y)))),app(TV,lam(Q,app(Q,X)))))) --> tv(psp,Num,TV).
vp1(pss,Num,lam(X,app(NP,app(TV,lam(Q,app(Q,X)))))) --> tv(psp,Num,TV), [by], np(_,NP).

% auxiliary verbs
%
av(Mood,Number,Tense,lam(F,F)) --> av0(Mood,Number,Tense).
av(Mood,Number,Tense,lam(P,lam(X,not(app(P,X))))) --> av0(Mood,Number,Tense), [not].
% is being; present progressive
av(Mood,Number,Tense,lam(F,F)) --> av0(Mood, Number, Tense), av0(Tense,_,_).

% noun phrases
%
np(Num,Sem) --> np1(Num,Sem).
np(pl,lam(P,app(app(Sem,app(NP1,P)),app(NP2,P)))) --> np1(_,NP1), conj(Sem), np(_,NP2). %a conjuction must always be plural

np1(Num,app(Det,N)) --> det(Num,Vowel,Det), n2(Num,Vowel,N).
np1(Num,app(app(Sem,app(Det,N1)),N2)) --> det(Num,Vowel,Det), n2(Num,Vowel,N1), poss(Sem), n2(Num,Vowel,N2).
np1(Num,app(app(Sem,NP),N2)) --> np0(_,NP), poss(Sem), n2(Num,_,N2).
np1(Num,Sem) --> np0(Num,Sem).

% nouns
%
n2(Num,Vowel,Sem) --> n1(Num,Vowel,Sem).
n2(Num,Vowel,lam(X,and(app(N,X),app(PP,X)))) --> n1(Num,Vowel,N), pp(PP).
n2(Num,Vowel,app(app(Sem,N),VP)) --> n1(Num,Vowel,N), relpro(Sem), vp(dcl,Num,VP).
n2(Num,Vowel,lam(X,app(app(Sem,app(N1,X)),app(N2,X)))) --> n1(Num,Vowel,N1), conj(Sem), n2(Num,_,N2).

n1(Num,Vowel,Sem) --> n0(Num,Vowel,Sem).
n1(Num,Vowel,app(A,N)) --> a(Vowel,A), n2(Num,_,N).

% adjectives
%
a(Vowel,Sem) --> a1(Vowel,Sem).
a(Vowel,lam(P,lam(X,app(app(Sem,app(app(A1,P),X)),app(app(A2,P),X))))) --> a1(Vowel,A1), conj(Sem), a(_,A2).
a1(Vowel,Sem) --> a0(Vowel,Sem).

% prepositions
%
prep(Sem) --> prep0(Sem).
prep(lam(P,lam(X,app(app(Sem,app(app(P1,P),X)),app(app(P2,P),X))))) --> prep0(P1), conj(Sem), prep(P2).

% prepositional phrases
%
pp(Sem) --> pp1(Sem).
pp(lam(X,app(app(Sem,app(P1,X)),app(P2,X)))) --> pp1(P1), conj(Sem), pp(P2).

pp1(app(P,NP)) --> prep(P), np(_,NP).

% relative pronouns
%
relpro(lam(V,lam(N,lam(X,and(app(V,X),app(N,X)))))) --> [that];[who].

% genitive
%
poss(lam(N,lam(P,lam(Q,some(X,and(app(P,X),and(app(N,lam(Y,s_part_of(X,Y))),app(Q,X)))))))) --> ['\'',s].

% coordination
%
conj(lam(P,lam(Q, or(P,Q)))) --> [or].
conj(lam(P,lam(Q,and(P,Q)))) --> [and].
conj(lam(P,lam(Q,and(P,Q)))) --> [but].

% noun phrases
%
np0(sg,lam(P,some(X,and(n_entity_1(X),app(P,X)))))      --> [something].
np0(sg,lam(P,some(X,and(n_person_1(X),app(P,X)))))      --> [somebody];[someone].
np0(sg,lam(P, all(X,imp(n_person_1(X),app(P,X)))))      --> [everyone];[everybody].
np0(sg,lam(P,not(some(X,and(n_person_1(X),app(P,X)))))) --> [nobody];[noone].

% determiners
%
det(_ ,_,  lam(P,lam(Q,not(some(X,and(app(P,X),app(Q,X))))))) --> [no].
det(sg,a,  lam(P,lam(Q,some(X,and(app(P,X),app(Q,X)))))) --> [a].
det(sg,an, lam(P,lam(Q,some(X,and(app(P,X),app(Q,X)))))) --> [an].
det(sg,_,  lam(P,lam(Q, and(some(Y,app(P,Y)),all(X,imp(app(P,X),app(Q,X))))))) --> [every];[each].
det(_ ,_,  lam(P,lam(Q,some(X,and(app(P,X),app(Q,X)))))) --> [the];[some].
det(_   ,_,  lam(P,lam(Q,some(X,and(app(P,X),app(Q,X)))))) --> [].
det(pl,_,  lam(P,lam(Q,some(X,and(app(P,X),app(Q,X)))))) --> [several].
det(pl,_,  lam(P,lam(Q, all(X,imp(app(P,X),app(Q,X)))))) --> [all].

det(sg,_,  lam(P,lam(Q,some(X,and(and(app(P,X),app(Q,X)),all(Y,eq(X,Y))))))) --> [exactly,one].
det(pl,_,  lam(P,lam(Q,some(X,some(Y,and(and(and(and(and(app(P,X),app(Q,X)),app(P,Y)),app(Q,Y)),not(eq,X,Y)),all(Z,imp(and(app(P,Z),app(Q,Z)),not(or(eq(Z,X),eq(Z,Y))))))))))) --> [exactly,two].

% numericals
%
det(sg,_,S) --> [one],   {num(1,S)}.
det(pl,_,S) --> [two],   {num(2,S)}.
det(pl,_,S) --> [three], {num(3,S)}.
det(pl,_,S) --> [four],  {num(4,S)}.
det(pl,_,S) --> [five],  {num(5,S)}.
det(pl,_,S) --> [six],   {num(6,S)}.
det(pl,_,S) --> [seven], {num(7,S)}.
det(pl,_,S) --> [eight], {num(8,S)}.
det(pl,_,S) --> [nine],  {num(9,S)}.
det(pl,_,S) --> [ten],   {num(10,S)}.

det(Num,_,S)  --> [at,least],det(Num,_,S).
%det(Num,_,S)  --> [at,most],det(Num,_,S).
%det(Num,_,S)  --> [exactly],det(Num,_,S).

num2([X],Prev,P,Q,   lam(P,lam(Q,some(X,and(and(app(P,X),app(Q,X)),not(eq(X,Prev))))))). %one
num2([X|T],Prev,P,Q, lam(P,lam(Q,some(X,and(and(and(and(app(P,X),app(Q,X))),app(app(Rest,P),Q)),not(eq(X,Prev))))))) :- num2(T,X,P,Q,Rest).%two
num1([X|T], lam(P,lam(Q,some(X,and(and(and(app(P,X),app(Q,X))),app(app(Rest,P),Q)))))) :- num2(T,X,_,_,Rest).

ll(0,[]) :- !.%create a List with a set Length (and anonymous elements)
ll(Num,[_|L]) :- N1 is Num-1, ll(N1,L).

num(1,lam(P,lam(Q,some(X,and(app(P,X),app(Q,X)))))).
num(Num,S) :- ll(Num,L), num1(L,S).

% prepositions
%
prep0(lam(P,lam(Y,app(P,lam(X,s_supports(X,Y)))))) --> [on];[in].
prep0(lam(P,lam(Y,app(P,lam(X,s_near(Y,X)))))) --> [with];[at];[next,to];[near].
prep0(lam(P,lam(Y,not(app(P,lam(X,s_near(Y,X))))))) --> [without].
prep0(lam(P,lam(Y,app(P,lam(X,s_part_of(Y,X)))))) --> [of].
prep0(lam(P,lam(Y,app(P,lam(X,s_occludes(X,Y)))))) --> [behind].
prep0(lam(P,lam(Y,app(P,lam(X,s_touches(X,Y)))))) --> [against].


% auxiliary verbs
%
av0(dcl,sg,bse) --> [does].
av0(dcl,pl,bse) --> [do].
av0(dcl,sg,prp) --> [is].
av0(dcl,sg,pss) --> [is].
av0(prp,_, prp) --> [being].
av0(pss,_, prp) --> [being].
av0(psp,_, prp) --> [been].
av0(dcl,pl,prp) --> [are].
av0(dcl,pl,pss) --> [are].
av0(dcl,sg,psp) --> [has].
av0(dcl,pl,psp) --> [have].
