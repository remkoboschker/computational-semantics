import re
import sys
from os import listdir
from os.path import isdir, abspath
from os import sep as PATHSEP
from nltk.corpus import wordnet as wn
from collections import OrderedDict
from nltk.corpus.reader.wordnet import WordNetError

###########
##  I/O  ##
###########

DEBUG = False
def debug(msg): 
    if DEBUG: print(msg)

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
                substrings.append(string[start+1:idx])
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
    num = parts[len(parts)-1]
    num = ('0' * (2-len(num))) + num #add leading zero's
    return '.'.join([sense,pos,num])
    
def wordnetToModel(sense):
    #turn sense names from the wordnet syntax (name.pos.num) into the model syntax (pos_name_num)
    parts = sense.split('.')
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
    hypernyms = synset.hypernyms()
    for h in hypernyms:
        debug(h)
        hypernyms.extend(h.hypernyms())#Fascinating: Python can do editing of the list during iteration over the list!
    return(hypernyms)
    
def addToRelations(relations,objects,sense):
    #adds objects to a relation. If the relations do not yet have a sense related to any objects, adds it.
    if sense in relations:
        objects = objects.union(relations[sense])#merge new and old objects
        relations.pop(sense)
        relations[sense] = objects#putting the elements in the dict again lowers them, putting the largely shared properties as low as possible
    else:
        relations[sense] = objects.copy()

def expandModel(relations):
    #add all hypernyms to all relations
    newRelations = OrderedDict()
    for sense in relations.keys():
        debug("----PROCESSING " + sense + "----")
        objects = relations[sense]
        addToRelations(newRelations,objects,sense)
        hypernyms = findAllHypernyms(wn.synset(sense))#returns all hypernyms, as synsets
        for h in hypernyms:
            addToRelations(newRelations,objects,h.name())
    return(newRelations)
        

##########
## Main ##
##########

print('File- or directory name: ')
for path in sys.stdin:
    failed_files = []
    failed_errors = []
    if path == '\n': break
    path = path.rstrip('\n \t')
    printnames = False
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
            rel = expandModel(rel)
            saveModel(filename.rstrip('.mod') + '-EXPANDED.mod',os,rel,ign,grs)
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