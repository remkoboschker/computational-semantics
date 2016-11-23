import re
from nltk.corpus import wordnet as wn
from collections import OrderedDict

###########
##  I/O  ##
###########

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

def strToList(string):
    #convert a string representation of a list to an actual list, making the elements strings
    assert string.startswith('[') and string.endswith(']')
    els = string[1:len(string)-1].split(',')
    return els
    
def modelToWordnet(sense):
    #turn sense names from the model syntax (pos_name_num) into the wordnet syntax (name.pos.num)
    parts = sense.split('_')
    parts[0], parts[1] = parts[1], parts[0]
    return '.'.join(parts)
    
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
    basemodel = open(path, 'r').read().translate(dict.fromkeys(map(ord,' \n\t'), None))#load the file and cut out all spaces, newlines and tabs.
    print(basemodel)
    basemodel = basemodel.lstrip('model(')
    basemodel = basemodel.rstrip(').')
    stripped = splitAsList(basemodel,'[',']')#we now have the list of objects and the relations
    objects = stripped[0].split(',')
    print(objects)
    relations = re.findall('f\(.+?\)',stripped[1])
    reldict = OrderedDict()
    ignoredRels = []
    for r in relations:
        r = splitAsList(r,'(',')')[0]
        r = r.split(',')
        r[2] = ','.join(r[2:])#bit of a hardcoded fix to prevent splitting on internal comma's, maybe add more syntax checks?
        r = r[:3]
        if r[0] == '1':#filter out relations with other arities
            reldict[modelToWordnet(r[1])] = set(strToList(r[2]))#also converts _ (mod) to . (wordnet)
        else:
            ignoredRels.append(r)
    print(reldict)
    print(ignoredRels)
    return(objects,reldict,ignoredRels)

def listToStr(list):
    #variation on the normal str(list) function
    return '[' + ','.join(list) + ']'
    
def saveModel(path,objects,reldict,ignoredRels):
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
    s.append("]).")
    file = open(path,'w')
    file.write(''.join(s))

########################
## Model Manipulation ##
########################

def findAllHypernyms(synset):
    hypernyms = synset.hypernyms()
    for h in hypernyms:
        print(h)
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
        print("----PROCESSING " + sense + "----")
        objects = relations[sense]
        addToRelations(newRelations,objects,sense)
        hypernyms = findAllHypernyms(wn.synset(sense))#returns all hypernyms, as synsets
        for h in hypernyms:
            addToRelations(newRelations,objects,h.name())
    print(newRelations)
    return(newRelations)
        

##########
## Main ##
##########

(os,rel,ign) = loadModel('week1/automobile-176989_640.mod')
rel = expandModel(rel)
saveModel('week1/automobile-176989_640-EDIT.mod',os,rel,ign)