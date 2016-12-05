import re
import sys
from os import listdir, mkdir
from os.path import isdir, abspath, basename
from os import sep as PATHSEP
from nltk.corpus import wordnet as wn
from collections import OrderedDict
from nltk.corpus.reader.wordnet import WordNetError

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

def strToList(string):
    #convert a string representation of a list to an actual list, making the elements strings
    assert string.startswith('[') and string.endswith(']')
    els = splitIgnoringSublists(string[1:len(string)-1],',','(',')')
    return els

def listToStr(list):
    #variation on the normal str(list) function
    return '[' + ','.join(list) + ']'

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

def wordnetToModel(sense):
    #turn sense names from the wordnet syntax (name.pos.num) into the model syntax (pos_name_num)
    parts = sense.split('.')
    if '\'' in parts[0]:
        parts[0] = parts[0].replace('\'','\\\'')
        parts[1] = '\'' + parts[1]
        parts[2] = parts[2] + '\''
    parts[0], parts[1] = parts[1], parts[0]
    parts[2] = parts[2].lstrip('0')
    return '_'.join(parts)

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

def saveModel(path,objects,reldict,ignoredRels,grounds):
    #save a (edited) model back to a file
    s = ["model("] #using lists as a stringBuilder substitute
    s.append(listToStr(objects))
    s.append(",\n\t[")
    keys = list(reldict.keys())
    if len(keys) != 0:
        r = keys[0]
        s.append("f(1," + wordnetToModel(r) + ',' + listToStr(sorted(reldict[r])) + ")")
    elif len(ignoredRels) != 0:
        s.append("f(" + ','.join(r) + ")")
        ignoredRels = ignoredRels[1:]
    for r in keys[1:]:
        s.append(",\n\t f(1," + wordnetToModel(r) + ',' + listToStr(sorted(reldict[r])) + ")")
    for r in ignoredRels:
        s.append(",\n\t f(" + ','.join(r) + ")")
    if grounds != None:
        s.append("],\n\t[g(" + '),\n\t g('.join(grounds) + ')')
    s.append("]).")
    file = open(path,'w')
    file.write(''.join(s))

########################
## Model Manipulation ##
########################

def findAllHypernyms(synset):
    multi = 0
    hypernyms = synset.hypernyms()
    if len(hypernyms) > 1:
        multi += 1
    for h in hypernyms:
        debug(h)
        hyp = h.hypernyms()
        if len(hyp) > 1:
            multi += 1
        hypernyms.extend(hyp)#Fascinating: Python can do editing of the list during iteration over the list!
    return(hypernyms, multi)

def addToRelations(relations,objects,sense):
    addCnt = 0
    #adds objects to a relation. If the relations do not yet have a sense related to any objects, adds it.
    if sense in relations:
        objects = objects.union(relations[sense])#merge new and old objects
        relations.pop(sense)
        relations[sense] = objects#putting the elements in the dict again lowers them, putting the largely shared properties as low as possible
        addCnt = 1
    else:
        relations[sense] = objects.copy()
    return addCnt

def removeFromRelation(relations,objects,sense):
    #remove objects from the relations list, removing the key if this was the last object
    if objects.issubset(relations[sense]):
        if len(relations[sense]) == len(objects):
            del relations[sense]
        else:
            relations[sense] = relations[sense].difference(objects)
        return 1
    return 0

def expandModel(relations):
    #add all hypernyms to all relations
    expandCnt = 0
    multiCnt = 0
    newRelations = OrderedDict()
    for sense in relations.keys():
        debug("----PROCESSING " + sense + "----")
        objects = relations[sense]
        addToRelations(newRelations,objects,sense)
        hypernyms, mCnt = findAllHypernyms(wn.synset(sense))#returns all hypernyms, as synsets
        multiCnt += mCnt
        for h in hypernyms:
            expandCnt += addToRelations(newRelations,objects,h.name())
    debug(newRelations)
    print("expand {}".format(expandCnt))
    print("multi {}".format(multiCnt))
    return(newRelations, expandCnt, multiCnt)

def reduceModel(relations):
    # remove all relations for which there is also a hypernym in the relations
    newRelations = relations.copy()
    reduceCount = 0

    # run time complexity wise better: get all objects and look at their relations
    objects = {}
    for sense, obj in relations.items():
        for o in obj:
            if o not in objects: # although the objects can have simple permutations those are not considered hyperonyms as they show different distibutions
                objects[o] = [sense] # might be problematic, if o is iterable, since python doesn't allow those to be keys
            else:
                objects[o].append(sense)

    # remove hypernyms
    for o in objects.keys():
        senses = objects[o]
        if len(senses) > 1:
            for sense in senses:
                alll, cnt = findAllHypernyms(wn.synset(sense))
                hypernyms = [synset.name() for synset in alll]
                for h in hypernyms:
                    if h in newRelations.keys():#senses:
                        reCnt = removeFromRelation(newRelations,set([o]),h)
                        reduceCount += reCnt
    debug(newRelations)
    print("reduce {}".format(reduceCount))
    return newRelations, reduceCount

##########
## Main ##
##########

print('File- or directory name: ')
if not isdir('output'):
    mkdir('output')
for path in sys.stdin:
    failed_files = []
    failed_errors = []
    if path == '\n': break
    path = path.rstrip('\n \t')
    printnames = False
    countRemoval = 0
    countExpansion = 0
    mulCnt = 0
    #construct list of files to process
    if isdir(path):
        if not path.endswith(PATHSEP): path = path + PATHSEP
        files = [path + f for f in listdir(path) if f.endswith(".mod") and not f.endswith("EXPANDED.mod")]
        printnames = True
    else:
        files = [path]
    for filename in files:
        try:
            if printnames or not sys.stdin.isatty(): print(filename)
            print('Working...')
            (os,rel,ign,grs) = loadModel(filename)
            reducedModel, reCnt = reduceModel(rel)
            countRemoval += reCnt
            rel, exCnt, mCnt = expandModel(reducedModel)
            countExpansion += exCnt
            mulCnt += mCnt
            saveModel('output' + PATHSEP + basename(filename),os,rel,ign,grs)
            print('Done!')
        except WordNetError as e:
            print('ERROR OPENING MODEL!')
            print(e)
            failed_files.append(filename)
            failed_errors.append(str(e))
        print('\nFile- or directory name: ')
    if failed_files != []:
        max_len = max(map(len,failed_files))
        print('\n-----\n\nFAILED TO PROCESS THE FOLLOWING FILES (likely due to an error in the model):\n' + '\n'.join([failed_files[i].ljust(max_len+1) + ': ' + failed_errors[i] for i in range(len(failed_files))]))
        print('\n\nFile- or directory name: ')
    print("expansions {}".format(countExpansion))
    print("removals {}".format(countRemoval))
    print("multi {}".format(mulCnt))
