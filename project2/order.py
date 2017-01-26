#Using a windows terminal? Run "CHCP 65001" before this script to enable Unicode Character being printed to the terminal.

from nltk.corpus import webtext, stopwords
#from nltk.stem.porter import PorterStemmer
import pickle

stopWords = set(stopwords.words('english'))
corpus = webtext
#stemmer = PorterStemmer()

sentences = [[token.lower() for token in s if token.isalpha() and token not in stopWords] for s in webtext.sents()]
#sentences = [[stemmer.stem(token.lower()) for token in s if token.isalpha()] for s in webtext.sents()]

words = set([word for sen in sentences for word in sen])

coocMap = {}

def addToMap(coocMap,w1,w2,val):
    if w1 in coocMap:
        if w2 in coocMap[w1]:
            coocMap[w1][w2] += val
        else:
            coocMap[w1][w2] = val
    else:
        coocMap[w1] = {w2:val}
    return coocMap


for sen in sentences:
    for idx1 in range(len(sen)):
        w1 = sen[idx1]
        for idx2 in range(idx1+1,len(sen)):
            w2 = sen[idx2]
            coocMap = addToMap(coocMap,w1,w2,1)
            coocMap = addToMap(coocMap,w2,w1,1)

with open('coocMap.pickle','wb') as f:
    pickle.dump(coocMap,f)

print(coocMap)
