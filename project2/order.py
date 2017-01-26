#Using a windows terminal? Run "CHCP 65001" before this script to enable Unicode Character being printed to the terminal.

from nltk.corpus import webtext
from nltk.stem.porter import PorterStemmer

corpus = webtext
stemmer = PorterStemmer()

sentences = [[stemmer.stem(token.lower()) for token in s if token.isalpha()] for s in webtext.sents()]
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
    
def get(coocMap,w1,w2):
    if w1 in coocMap and w2 in coocMap[w1]:
        return coocMap[w1][w2]
    else:
        return None
        

for sen in sentences:
    for idx1 in range(len(sen)):
        w1 = sen[idx1]
        for idx2 in range(idx1+1,len(sen)):
            w2 = sen[idx2]
            coocMap = addToMap(coocMap,w1,w2,1)
            coocMap = addToMap(coocMap,w2,w1,1)

print(coocMap)
        