
from hypernym import loadModel, reduceModel
from nltk import word_tokenize
from nltk import stopwords
from nltk.corpus import wordnet as wn
from nltk.tag import StanfordPOSTagger
_path_to_model = './stanford-postagger-2014-08-27/models/english-bidirectional-distsim.tagger'
_path_to_jar ='./stanford-postagger-2014-08-27/stanford-postagger.jar'



#from math import log

DISPLAY = 10
DEBUG = True




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
    typical = typicality(proModels,proQuery,cooc)
    ranking = sort(typical)

    if len(ranking)>0:
        return ranking[0:min([DISPLAY,len(ranking)])]
    else:
        debug("No fitting models found.")

def typicality(models,query,coocurenceMatrix):
    """ cosine similarity of the model to all query terms in their 'normal' context as vector space model
        !!! renaming required
        INPUT:
            @query:         a string: the nlp query reresulting in the model output
            @model:         a list:
            @weight:        positive float - default = 1 : if hypernyms are used those words don't count as much

        OUTPUT:
            @return:        a list: ordered model IDs
    """
    proQuery = findCommonReading(qTokens,proModels)

    vsmModel = vectorSpacing(model)
    vsmQuery = vectorSpacing(query)
###########################################################################
    tf-idf_sums = []
    for wq, qSense in getWeights(proQuery, cooc):
        tf-idf = 0
        for model in models:
            tf-idf += tf_idf(wq * idf(coocurenceMatrix[sense]),tf(model))



def getWeights(term,coocurenceMatrix, weight = 1):
    """ looks for the closed senese of @term in @coocurenceMatrix, weights the tf and idf dependend on the closeness
    INPUT:
    @term:                  a string: a wordnet sense
    @coocurenceMatrix:      a dictionary: vector space model representation
    @weight:                a float: impact of the found term, indicating it's closeness to the original concept
    OUTPUT:
    @weight:                a float: impact of the found term, indicating it's closeness to the original concept
    @term:                  a wordnet sense: closest sense found in the @coocurenceMatrix
    # reconsider if @coocurenceMatrix should be the orientation. probably needs to be. we definded it to be orientation
    """

    if weight <= 0.05 or term == "entity.n.1": # or if entity
    return 0
elif mTerm in coocurenceMatrix:
    return coocurenceMatrix[term1,term2]
else:
    return termTypicality(project1.hypernym(term),coocurenceMatrix,1/2 * weight)




############################################################################


    tf-idf_sums = []
    for wq, qSense in getWeights(proQuery, cooc):
        tf-idf = 0
        for model in models:
            for wm, mTerm in getWeights(model, cooc):
            tf-idf += tf_idf(wq * idf(coocurenceMatrix[qSense]), wm * tf(model))


def getWeights(term,vectorSpaceModel, scoring, weight = 1):
    """ looks for the closed senese of @term in @vectorSpaceModel, weights the tf and idf dependend on the closeness
    INPUT:
    @term:                  a string: a wordnet sense
    @vectorSpaceModel:      a dictionary: vector space model representation
    @weight:                a float: impact of the found term, indicating it's closeness to the original concept
    OUTPUT:
    @weight:                a float: impact of the found term, indicating it's closeness to the original concept
    @term:                  a string: wordnet sense, closest sense found in the @coocurenceMatrix
    @frequency:             a float: weighted (???) frequency of term in @vectorSpaceModel
    # reconsider if @coocurenceMatrix should be the orientation. probably needs to be. we definded it to be orientation
    """
    if scoring == "idf":
        idf_t = log N/df_t

    if weight <= 0.05 or term == "entity.n.1": # or if entity
        return 0
    elif mTerm in coocurenceMatrix:
        return coocurenceMatrix[term]
    else:
        return termTypicality(project1.hypernym(term),coocurenceMatrix,1/2 * weight)







    return score

def vectorSpacing(contextList):
    """
        INPUT:
            @list:          a list: a list with each single entity in context

        OUTPUT:
            @return:        a dictionary: vector space model, unweighted, non-normalized
    """

    vsm = vectorSpaceModel = {}
    for entry in contextList:
        if entry not in vsm:
            vsm[entry] = 1
        else:
            vsm[entry] += 1

    return vsm

def tf(model):
    """
        INPUT:
            @model:          a dictionary: vector space model

        OUTPUT:
            @return:        a dictionary: vector space model, unweighted, non-normalized
    """
    for wm, mTerm in getWeights(model, cooc):


def idf(absVector):






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
    """ preprocesses the model into its basic terms using only the synsets in the model and stripping all hypernyms
        'assumption: all models are already true for the query, therefor no more explicit parsing is relevat here'
        INPUT:
            @model:     a string: the model ID = filename without path and file type
        OUTPUT:
            @return:    a list: the most specific senses from the model
    """

    x = hypernym.reduceModel(hypernym.loadModel("data/" +  model + ".mod")[1])
    synsets = wn.synsets(list(x[0].keys())[i][0:-5])    # should we actually reduce the model? Yes, since we need the clearest

    senses = []
    for a in modelDic.keys():
        for b in range(0,len(modelDic[a])):
            senses.append(str(a))

    return senses


def preproQuery(query):
    """ Preprocesses the query into its basic tokens, removing stopwords
        ASSUMPTION: all models are already true for the query, therefor no more explicit parsing is relevat here'
        # could also get senses here for less function calls in :~main(), but would imply an unintuitive handling (passing )
        !!! requires to call :findCommonReading() for each model seperately! NOT what we want to map!!!
        !!! we want ONE reading (= synset set) of the query, not many and TOTALLY not dependend on the model
        !!! though the models are the only gold data we have
        INPUT:
            @query:     a string: the nlp string of the query
        OUTPUT:
            @return:    a list: the synsets of each non stop word from the query
    """

    qTokens = word_tokenize(line)
    qTokens = [token for token in qTokens if token not in STOPWORDS]


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

    querySenses = []
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

def debug(msg):
    if DEBUG: print(msg,file=sys.stderr)

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





def cosineSimilarity(vectorA,vectorB):
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

    score = []
    leng = [len(model) for model in models]
    for term in query:
        w_tq = weighting(term,query, score = "idf")
        t_postingList = ?
        for model in models:
            for tf in tfs:
                score.append(w_td)


##########
## MAIN ##
##########

if __name__ == "__main__":

    sys.stdin
    rankModels(model,query)
