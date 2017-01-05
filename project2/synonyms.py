# synonyms.py

import re
import sys
from os import listdir, mkdir
from os.path import isdir, abspath, basename
from os import sep as PATHSEP
from nltk.corpus import wordnet as wn
from collections import OrderedDict
from nltk.corpus.reader.wordnet import WordNetError

from nltk.corpus import wordnet as wn

###########
##  I/O  ##
###########

DEBUG = False

def debug(msg):
    if DEBUG: print(msg,file=sys.stderr)

def splitAsList(string,openingbracket,closingbracket):
    #return the list of substringings surrounded by one of the brackets, respecting nested lists.
    substrings = []
    level = 0
    for idx in range(len(string)):
        c = string[idx]
        if c == openingbracket:
            level += 1
            if level == 1:
                start = idx
        elif level > 0 and c == closingbracket:
            level -= 1
            if level == 0:
                substrings.append(string[start+1:idx]) # problem with "coffee_cup" in model and "coffee cup" in wordnet here solvable
    return(substrings)

def strToList(string):
    #convert a string representation of a list to an actual list, making the elements strings
    assert string.startswith('[') and string.endswith(']')
    els = splitIgnoringSublists(string[1:len(string)-1],',','(',')')
    return els

def splitIgnoringSublists(string,sep,openingbracket,closingbracket):
    #splits string on sep, but not if sep occurs in a sublist (enclosed in brackets)
    substrings = []
    level = 0
    start = 0
    for idx in range(len(string)):
        c = string[idx]
        if level == 0:
            if c == openingbracket:
                level += 1
            elif c == sep:
                substrings.append(string[start:idx])
                start = idx+1
        else:
            if c == closingbracket:
                level -= 1
    substrings.append(string[start:idx+1])
    return(substrings)

def modelToWordnet(sense):
    #turn sense names from the model syntax (pos_name_num) into the wordnet syntax (name.pos.num)
    #TODO add num normalizer (1 to 01)
    sense = sense.strip('\'')
    parts = sense.split('_')
    pos = parts[0]
    sense = '_'.join([w.replace(' ','_') for w in parts[1:len(parts)-1]])
    sense = sense.replace('\\\'','\'')
    num = parts[len(parts)-1]
    num = ('0' * (2-len(num))) + num #add leading zero's
    return '.'.join([sense,pos,num])

def loadModel(path):
    #load a model from file
    #RETURNS:
    #  objects; the list of all objects in the model (names are strings)
    #  reldict; a dictionary that maps word senses to the objects they relate to. Keys (word senses) are strings and values are set of object names (strings)
    #  ignoredRels; the relations with an arity above 2 are ignored but returned for when the model file is reconstructed. It's a list of [arity, sense, object], all strings.
    basemodel = open(path, 'r').read()#load the file
    basemodel = re.sub('\n|\t|  +','',basemodel)#cut out all newlines, tabs and spaces if more than one (single spaces may occur with senses).
    debug(basemodel)
    basemodel = basemodel.lstrip('model(')
    basemodel = basemodel.rstrip(').')
    stripped = splitAsList(basemodel,'[',']')#we now have the list of objects and the relations (and optionally the grounded relations)
    objects = stripped[0].split(',')
    debug(objects)
    relations = splitAsList(stripped[1],'(',')')
    reldict = OrderedDict()
    ignoredRels = []
    for r in relations:
        r = r.split(',',2)
        debug(r)
        if r[0] == '1':
            reldict[modelToWordnet(r[1])] = set(strToList(r[2]))
        else:
            ignoredRels.append(r)
    debug(reldict)
    debug(ignoredRels)
    grounds = None
    if len(stripped) > 2:
        grounds = splitAsList(stripped[2],'(',')')
    debug(grounds)
    return(objects,reldict,ignoredRels,grounds)

print('File- or directory name: ')
if not isdir('output'):
    mkdir('output')
for path in sys.stdin:
    failed_files = []
    failed_errors = []
    if path == '\n': break
    path = path.rstrip('\n \t')
    printnames = False
    multiDict = {}
    #construct list of files to process
    if isdir(path):
        if not path.endswith(PATHSEP): path = path + PATHSEP
        files = [path + f for f in listdir(path) if f.endswith(".mod") and not f.endswith("EXPANDED.mod")]
        printnames = True
    else:
        files = [path]
    
    # Object list to prevent repetition of objects in lexicon
    checkObj = []
    nnLst = []
    adjLst = []
    for filename in files:
        try:
            if printnames or not sys.stdin.isatty(): print(filename)
            print('Working...')
            (os,rel,ign,grs) = loadModel(filename)
            
            # Adds nouns and synonyms to lexicon
            objects = [obj for obj in rel.keys()]
            for obj in objects:
                if obj in checkObj:
                    pass
                else:
                    # arm.n.01 --> n_arm_1
                    objTk = obj.split('.')
                    objLex = ('_').join([objTk[1],objTk[0].lower(),str(int(objTk[2]))])
                    checkObj.append(obj)
                    
                    ss = wn.synset(obj)
                    synonyms = ss.lemma_names()
                    vowels = ['a', 'e', 'i', 'o', 'u']
                    aLst = ('; ').join(['['+a+']' for a in synonyms if a[0].lower() not in vowels])+'.'
                    anLst = ('; ').join(['['+an+']' for an in synonyms if an[0].lower() in vowels])+'.'
                    
                    if objTk[1] == 'n':
                        lexSgAString = 'n0(sg,a,  lam(X,'+ objLex + '(X)))   --> ' + aLst +'\n'
                        lexSgAnString = 'n0(sg,an,  lam(X,'+ objLex + '(X)))   --> ' + anLst +'\n'
                        if len(aLst) > 1:
                            nnLst.append(lexSgAString)
                        if len(anLst) > 1:
                            print(len(anLst))
                            nnLst.append(lexSgAnString)
                    elif objTk[1] == 'a':
                        lexSgAString = 'a0(a,  lam(P,lam(X,and(' + objLex + '(X),app(P,X))))) --> ' + aLst +'\n'
                        lexSgAnString = 'a0(an,  lam(P,lam(X,and(' + objLex + '(X),app(P,X))))) --> ' + anLst +'\n'
                        if len(aLst) > 1:
                            adjLst.append(lexSgAString)
                        if len(anLst) > 1:
                            adjLst.append(lexSgAnString)
                    #print(lexSgString) 
        except WordNetError as e:
            print('ERROR OPENING MODEL!')
            print(e)
            failed_files.append(filename)
            failed_errors.append(str(e))

    f = open('output/nouns.txt', 'w')
    f.write('% nouns \n%\n')
    for n in sorted(nnLst):
        f.write(n)
    f.write('\n% adjectives \n%\n')
    for a in sorted(adjLst):
        f.write(a)
    f.close() 
