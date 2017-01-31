from nltk import word_tokenize
from nltk.tag import StanfordPOSTagger
import os
from csv import reader

os.environ['JAVAHOME']="C:/Program Files/Java/jre1.8.0_111/bin/"
_path_to_model = './stanford-postagger-2014-08-27/models/english-bidirectional-distsim.tagger'
_path_to_jar ='./stanford-postagger-2014-08-27/stanford-postagger.jar'
tagger = StanfordPOSTagger(_path_to_model,_path_to_jar)

verbs = {}

file = reader(open('corpus.txt'),delimiter='\n')
for line in file:
    tokens = word_tokenize(line[0])
    tagged = tagger.tag(tokens)
    for token in tagged:
        if token[1].startswith('V'):
            #it's a verb
            verb = token[0]
            print(verb)
            if verb in verbs:
                verbs[verb] += 1
            else:
                verbs[verb] = 1
    
print(verbs)