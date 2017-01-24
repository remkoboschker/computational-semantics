
from math import log

def rankModels(model,query):
    """
    'ranks models according to their closeness to a query'
    '

    SCORE = SUM SUM T(q_i|m_j)
    Is there a difference in perspectives?:
        -   is a term in the model typical for the context of the query
            -->
        -   is a term in the query typical for a model
            --> has the query a common theme or are it's topics split?
                ^-- no value for evaluation


    -   is a term in the model typical for it's model?
        innerTypicality(model)

            more efficent to make a dictionary of all terms for query? Access O(1)???

    '
    INPUT:
        @query:         a string: the nlp query reresulting in the model output
        @model:         a list: GRIM models
    OUTPUT:
        @return:        a list: ordered model IDs
    """
    coocurence = load(coocurence)
    cooc = coocurence = preproCooc()
    proQuery = preproQuery()
    proModels = preproModel()



def typicality(model,query,coocurenceMatrix):
    """ cosine similarity of the model to all query terms in their 'normal' context as vector space model

    INPUT:
    @query:         a string: the nlp query reresulting in the model output
    @model:         a list: GRIM models
    @weight:        positive float - default = 1 : if hypernyms are used those words don't count as much

    OUTPUT:
    @return:        a list: ordered model IDs


    """
    weights = []
    for wq, qTerm in getWeights(query, cooc, weight = "df"):
        innerTyp = 1 if innerTypicality == False else innerTypicality(model,cooc, weight = "tf")
        for wm, mTerm in getWeights(model):
            tf-idf = (wm * tf_m(model)) * (wq * idf_q(coocurenceMatrix[qTerm]))
            #weights.append(wm * qm * coocurenceMatrix[qTerm][mTerm] * innerTyp)
    score = sum(weights)
    return score




def

    F AST C OSINE S CORE ( q )
1 float Scores [ N ] = 0
2 for each d
3 do Initialize Length [ d ] to the length of doc d
4 for each query term t
5 do calculate w t,q and fetch postings list for t
6
for each pair ( d, tf t,d ) in postings list
7
do add wf t,d to Scores [ d ]
8 Read the array Length [ d ]
9 for each d
10 do Divide Scores [ d ] by Length [ d ]
11 return Top K components of Scores []

def getWeights(term1,term2,coocurenceMatrix, weight = 1):

    if weight <= 0.05: # or if entity
        return 0
    elif mTerm in coocurenceMatrix:
        return coocurenceMatrix[term1,term2]
    else:
        return termTypicality(project1.hypernym(term),coocurenceMatrix,1/2 * weight)






def innerTypicality(context, coocurenceMatrix, log = True, normalize = True ):
    """
    'gives reciproce frequency of coocurences in @context relative to number of terms in context'
    INPUT:
        @context:               a list: synsets
        @coocurenceMatrix:      a dictionary: sparse matrix/posting list representation
        @log:                   a boolean: if the natural log should be used on the result # because the bigger the model the likelier coocurences
        @normalize:             a boolean: if result will be normalized between 0-1 ???????
    OUTPUT:
        @return:        a float:
    """
    typ = 0 # number of occurences of model terms together in corpus
    for i in range(0,len(model)): # multiple occurence
        for j in range(i+1,len(model)):
            typ += coocurenceMatrix[model[i]][model[j]]
    x = typ / len(model)
    if log:
        x = log(x)
    if normalize:
        x = 1 - (1/x))

    return x


def preproCooc(coocurenceMatrix, normalize = True):
    """
    'preprocesses the coocurenceMatrix into a posting list representation'
    INPUT:
        @coocurenceMatrix:  a dictionary:
        @normalize:         a boolean:
    OUTPUT:
        @ return:           a dictionary: sparse matrix/posting list representation
    """

    for concept in coocurenceMatrix.pop() if concept not


    cleard

    idf_t = log N/df_t

    if normalize == True:
        cleard =
         euclideanDistance(cooc)

    return cleared

def preproQuery(query):
    """
    'preprocesses the query into its basic terms, removing stopwords and finding synsets'
    'assumption: all models are already true for the query, therefor no more explicit parsing is relevat here'
    INPUT:
        @query:     a string: the nlp string of the query
    OUTPUT:
        @return:    a list: the synsets of each non stop word from the query
    """
    project1.getSynset()
def preproModel(model):
    """
    'preprocesses the model into its basic terms using only the synsets in the model'
    'assumption: all models are already true for the query, therefor no more explicit parsing is relevat here'
    INPUT:
        @query:     a string: the nlp string of the query
    OUTPUT:
        @return:    a list: the synsets of each non stop word from the query
    """
    project1.getSynset()
