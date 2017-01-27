import sys
import pickle
import nltk
from nltk.corpus import stopwords
from hypernym import reduceModel, loadModel
from nltk.corpus import wordnet as wn

DISPLAY = 10
DEBUG = True

def debug(msg):
    if DEBUG: print(msg,file=sys.stderr)



def scoringTypicality(query,modelPaths):
    coocurenceMatrix = pickle.load(open('coocMap.pickle','rb'))
    pquery = preproQuery(query)
    scores = {}
    for qTerm in pquery:
        for modelPath in modelPaths:
            model = preproModel(modelPath)
            debug(model)
            for mTerm in model.keys():
                if qTerm in coocurenceMatrix:
                    if mTerm in coocurenceMatrix[qTerm]:
                        if model not in scores:
                            scores[model] = coocurenceMatrix[qTerm][mTerm]
                            debug(coocurenceMatrix[qTerm][mTerm])
                        else:
                            scores[model] += coocurenceMatrix[qTerm][mTerm]
    return scores

def preproModel(model):
    """ preprocesses the model into its basic terms using only the synsets in the model and stripping all hypernyms
        'assumption: all models are already true for the query, therefor no more explicit parsing is relevat here'
        INPUT:
            @model:     a string: the model ID = filename without path and file type
        OUTPUT:
            @return:    a list: the most specific senses from the model
    """

    debug(models)
    rModel = reduceModel(loadModel(model)[1])[0]
    #reduceModel(loadModel('data/accordion-player-188286_640.mod')[1])[0].keys()

    #synsets = wn.synsets(list(x[0].keys())[1][0:-5])    # should we actually reduce the model? Yes, since we need the clearest

    senses = {}
    for k in rModel.keys():
        if k not in senses:
            senses[k[0:-5]] = len(rModel[k])

    debug(senses)
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
    #debug(query)
    qTokens = nltk.word_tokenize(query)
    #qTokens = [token for token in qTokens if token not in stopwords]
    #debug(qTokens)
    return qTokens


def order(scores):
    scores = [[key,scores[key]] for key in scores.keys()]
    # keys = [key for key in scores.keys()]
    # scores = [scores[key] for key in keys]
    # scoring = [keys,scores]
    oScoring = sorted(scores, key = lambda cols:cols[1])
    return oScoring

sentence_with_most_specific_hypernym = sys.argv[0]
models = sys.argv[2:]


scored = scoringTypicality(sentence_with_most_specific_hypernym,models)
orderedScores = order(scored)

sys.stdout.write(" ".join(orderScores[:DISPLAY]))
