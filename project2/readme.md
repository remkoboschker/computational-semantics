run swipl -g "[prolog/semdcg],parse_from_file('corpus.txt','out3.txt'),halt."
to check if a sentences in the corpus parse

swipl -g "[prolog/semdcg],Exp=[the,girl,is,eating,noodles,'.'],s(Sem,Exp,[]),betaConvert(Sem,Red),numbervars(Red,23,_),write(Red),nl,fail;halt."

todo:

is + adjective
check not calling disambiguate
is + pp
has + ?
is for a place
all?
error in grammar some(X,and(and(a_red_1(X),app(some(Y,s_supports(Y,app(lam(Z,Z),app(lam(A1,A1),app(lam(B1,lam(C1,and(a_green_1(C1),app(B1,C1)))),lam(D1,n_field_1(D1))))))),X)),some(E1,eq(E1,X))))
a glass ; where is glass
a x is ...
