
from hypernym import loadModel, reduceModel
from nltk import word_tokenize
from nltk import stopwords
from nltk.corpus import wordnet as wn
from nltk.tag import StanfordPOSTagger
_path_to_model = './stanford-postagger-2014-08-27/models/english-bidirectional-distsim.tagger'
_path_to_jar ='./stanford-postagger-2014-08-27/stanford-postagger.jar'



#from math import log

DISPLAY = 10

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
    proModels = preproModel()
    qTokens = preproQuery()
    proQuery = findCommonReading(qTokens,proModels)
    typical = typicality(proModels,proQuery,cooc)
    ranking = sort(typical)

    if len(ranking)>0:
        return ranking[0:min([DISPLAY,len(ranking)])]
    else:
        debug("No fitting models found.")

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
        #innerTyp = 1 if innerTypicality == False else innerTypicality(model,cooc)
        for wm, mTerm in getWeights(model, weight = "tf"):
            tf-idf = (wm * tf_m(model)) * (wq * idf_q(coocurenceMatrix[qTerm]))
            #weights.append(wm * qm * coocurenceMatrix[qTerm][mTerm] * innerTyp)
    score = sum(weights)
    return score





def getWeights(term,coocurenceMatrix, weight = 1):
    """ Weights the
    INPUT:
        @coocurenceMatrix:      a dictionary:
        @weight:                a float: impact of the found term, indicating it's closeness to the original concept
    OUTPUT:
        @weight:                a float: impact of the found term, indicating it's closeness to the original concept
        @term:                  a wordnet sense: closest sense found in the @coocurenceMatrix
                # reconsider if @coocurenceMatrix should be the orientation. probably needs to be
    """

    if weight <= 0.05 or term == "entity.n.1": # or if entity
        return 0
    elif mTerm in coocurenceMatrix:
        return coocurenceMatrix[term1,term2]
    else:
        return termTypicality(project1.hypernym(term),coocurenceMatrix,1/2 * weight)





# Done
################################################################################
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

def preproModel(model):
    """ preprocesses the model into its basic terms using only the synsets in the model
        'assumption: all models are already true for the query, therefor no more explicit parsing is relevat here'
        INPUT:
            @query:     a string: the nlp string of the query
        OUTPUT:
            @return:    a list: the synsets of each non stop word from the query
    """

    x = hypernym.reduceModel(hypernym.loadModel("data/" +  model + ".mod")[1])
    synsets = wn.synsets(list(x[0].keys())[i][0:-5])    # should we actually reduce the model? Yes, since we need the clearest

    senses = []
    for a in modelDic.keys():
        for b in range(0,len(modelDic[a])):
            senses.append(str(a))

    return senses

def preproQuery(query):
    """
    'preprocesses the query into its basic terms, removing stopwords and finding senses'
    'assumption: all models are already true for the query, therefor no more explicit parsing is relevat here'
    INPUT:
    @query:     a string: the nlp string of the query
    OUTPUT:
    @return:    a list: the synsets of each non stop word from the query
    """

    qTokens = word_tokenize(line)
    qTokens = [token for token in qTokens if token not in STOPWORDS]

    # project1.getSynset()
    return qTokens

def findCommonReading(queryTerms,modelSynsets):
    """ for disambiguation of query terms: finds a common reading in the model (which has ground truth/gold label annotation)
        ASSUMPTION #1: the parser already found a common interpretation for the model, which makes an on theme interpretation likely
        ASSUMPTION #2: computation for f():innerTypicality might be to costly
        INPUT:
            @modelSynsets:      a list: gold label senses from the model
            @queryTerms:        a list: terms from the query that need to bee maped to synset meanings
        OUTPUT:
            @return:            a list: senses for which there were common readings - else None
    """
                i += 1

    querySenses = []
    i = 0
    for term in queryTerms:
        senses = wn.synset(term)
        oldSensesLength = len(querySenses)
        for sense in senses:
            if sense in modelSynsets:
                querySenses.append(sense)
                break # only takes first one. can be improved but would further increase computation time
        elif len(querySenses) <= oldSensesLength:
            querySenses.append(None)

    return querySenses

################################################################################

# TODO: """"""

def preproCooc(coocurenceMatrix, normalize = True):
    """ Preprocesses the coocurenceMatrix into a posting list representation. The entries are wordnet senses.
        # which will be the biggest problem (so far) as we can't validate them. approach so far: just add all senses to matrix
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





def cosine(vectorA,vectorB):
    """    F AST C OSINE S CORE ( q )
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
    """

##########
## MAIN ##
##########

if __name__ == "__main__":

    sys.stdin
    rankModels(model,query)
