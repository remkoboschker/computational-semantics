import sys
import pickle
import nltk
from nltk.corpus import stopwords
from hypernym import reduceModel, loadModel
from nltk.corpus import wordnet as wn

DISPLAY = 10
DEBUG = False

def scoringTypicality(query,modelPaths):
    coocurenceMatrix = pickle.load(open('coocMap.pickle','rb'))
    pquery = preproQuery(query)
    scores = {}
    for qTerm in pquery:
        for modelPath in modelPaths:
            model = preproModel(modelPath)
            scores[modelPath] = 0
            # debug(model)
            for mSense in model.keys():
                if qTerm in coocurenceMatrix:
                    if mSense in coocurenceMatrix[qTerm]:
                        scores[modelPath] += coocurenceMatrix[qTerm][mSense]
    return scores

def preproModel(model):
    """ preprocesses the model into its basic terms using only the synsets in the model and stripping all hypernyms
        'assumption: all models are already true for the query, therefor no more explicit parsing is relevat here'
        INPUT:
            @model:     a string: the model ID = filename without path and file type
        OUTPUT:
            @return:    a list: the most specific senses from the model
    """
    rModel = reduceModel(loadModel(model)[1])[0]
    #reduceModel(loadModel('data/accordion-player-188286_640.mod')[1])[0].keys()

    #synsets = wn.synsets(list(x[0].keys())[1][0:-5])    # should we actually reduce the model? Yes, since we need the clearest

    senses = {}
    for k in rModel.keys():
        if k not in senses:
            senses[k[0:-5]] = len(rModel[k])

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
    oScoring = sorted(scores, key = lambda cols:cols[1], reverse = True)
    return oScoring


def main():
    models = []
    sentence_with_most_specific_hypernym = sys.argv[1]
    debug("sentence input:")
    debug(sentence_with_most_specific_hypernym)
    for line in sys.stdin:
        line = line.rstrip('\n')
        if line == "quit" or line == "\n":
            break
        models.append(line)
        debug(line)
        debug("model considered for most relevant model")

    if len(models) > 0:
        scored = scoringTypicality(sentence_with_most_specific_hypernym,models)
        orderedScores = order(scored)
        # debug(orderedScores)
        debug("\n5 highest ranking models")
        orSc = [sc[0] for sc in orderedScores[:5]]
        debug(orSc)
        #sys.stdout.write(" ".join(orderedScores[:5]))
        sys.stdout.write("\n".join(orSc))
    else:
        # return five random?
        models = []

def debug(msg):
    if DEBUG:
        if type(msg) == type(""):
             print(msg,file=sys.stderr)
        else:
            # treat as iterable
            try:
                for it in msg:
                    print(it,file=sys.stderr)
            except:
                print(msg,file=sys.stderr)



if __name__ == "__main__":
    main()
