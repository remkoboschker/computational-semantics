# grimSearch.py
# Preprocessing to parse query phrases to the _nlmodels.pl
#	Replaces nouns that are nout in the lexicon (noun.pl) into
#	the first hypernym that is in the lexicon.

import os
import sys
from nltk import word_tokenize
from nltk.corpus import wordnet as wn
from nltk.tag import StanfordPOSTagger
_path_to_model = './stanford-postagger-2014-08-27/models/english-bidirectional-distsim.tagger'
_path_to_jar ='./stanford-postagger-2014-08-27/stanford-postagger.jar'

#manual java path assignment
#os.environ['JAVAHOME']="C:/Program Files/Java/jre1.8.0_121/bin/"

def getHypernyms(POSLst):
	''' Gets hypernym of noun in query if noun is not in the lexicon '''
	queryNN = [(i, w[0]) for i, w in enumerate(POSLst) if 'NN' in w[1]]
	# Checks if hypernym is in lexicon if word is not in lexicon
	hypernymLst = []
	nMWords = []
	for i, nn in queryNN:
		if (nn in nnLexLst) == False:
			try:
				ss = wn.synsets(nn)[0]
				while True:
					hypLst = ss.hypernyms()
					hypernym = ' '.join([h.lemma_names()[0] for h in hypLst][0].split('_'))
					if hypernym in nnLexLst:
						POSLst[i] = (hypernym, 'NN')
						hypernymLst.append((nn,hypernym))
						break
					else:
						ss = hypLst[0]
			except IndexError:
				POSLst[i] = ('entity', 'NN')
				hypernymLst.append((nn,'entity'))
				print("Error input: " + nn + " doesn't exists in WordNet. Replaced by: entity.", file=sys.stderr)
				break


	if len(hypernymLst) == 0:
		return POSLst, True, hypernymLst
	else:
		return POSLst, False, hypernymLst


def replaceNouns(nnLst, POSLst):
	''' Replaces nouns in POS list by nouns in nnLst '''
	delLst = []
	addLst = []
	for i, tup in nnLst:
		if len(tup[0].split()) == 3:
			delLst.extend([i+1, i+2])
			addLst.append(i)
		elif len(tup[0].split()) == 2:
			delLst.append(i+1)
			addLst.append(i)
	for i, tup in nnLst: POSLst[i] = tup
	for i in reversed(sorted(delLst)): del POSLst[i]
	return POSLst

def disambiguate(ngramLists, nnLst, POSLst):
	''' Checks ambiguation of words '''
	# First check: asks to dismbiguate, if query (noun) ngram is not in POS ngram noun list (nnLst)
	ambiguLst = []
	delLst = []
	addLst = []
	for ngramLst in ngramLists:
		if len(ngramLst) != 0:
			for nnTuple in ngramLst:
				if nnTuple not in nnLst:
					print('Did you mean:', file=sys.stderr)
					print('\t1) ' + ' = '.join(nnTuple[1]), file=sys.stderr)
					singleNN = []
					n = len(nnTuple[1][0].split())
					for i in range(n):
						singleNN.append((nnTuple[0]+i, POSLst[nnTuple[0]+i]))
					print('\t2) ' + ', '.join([' = '.join(nn[1]) for nn in singleNN]), file=sys.stderr)
					print('Choose a number and type <enter>: ', file=sys.stderr)
					while True:
						choice = input("")
						if choice.strip() == '1':
							tempLst = [(i, (tup[0], 'NN')) for i, tup in singleNN]
							for i, tup in enumerate(nnLst):
								if tup in tempLst:
									delLst.append(i)

							addLst.append(nnTuple)
							break
						elif choice.strip() == '2':
							break
						print('Choose option "1" or "2"', file=sys.stderr)

	for i in reversed(sorted(delLst)):
		del nnLst[i]
	iLst = []
	for nn in addLst:
		nnLst.append(nn)
		n = len(nn[1][0].split())
		for i in range(n-1):
			iLst.append(nn[0]+1)
	delLst = [i for i, tup in enumerate(nnLst) if tup[0] in iLst]
	for i in reversed(sorted(delLst)):
		del nnLst[i]

	# Second check: asks to disambiguate, if more than 1 noun has the same position index
	ambiguLst = [(i,j) for i, tup1 in enumerate(nnLst) for j, tup2 in enumerate(nnLst) if tup1 != tup2 and tup1[0] == tup2[0] and i <= j]
	if len(ambiguLst) != 0:
		print('Did you mean:', file=sys.stderr)
		for ambCase in ambiguLst:
			for i, choice in enumerate(ambCase):
				print(str(i+1) + ') ' +  ' = '.join(nnLst[choice][1]))
			while True:
				choice = input("")
				if choice.strip() == '1':
					del nnLst[ambCase[1]]
					break
				elif choice.strip() == '2':
					relevantTup = nnLst[ambCase[1]]
					del nnLst[ambCase[0]]
					nRel = len(relevantTup[1][0].split())
					if nRel > 1:
						iLst = []
						for i in range(n-1):
							iLst.append(relevantTup[0]+1)
						delLst = [i for i, tup in enumerate(nnLst) if tup[0] in iLst]
						for i in reversed(sorted(delLst)):
							del nnLst[i]
					break
				print('Choose option "1" or "2"', file=sys.stderr)

	# Disambiguates nouns in POS list
	POSLst = replaceNouns(nnLst, POSLst)

	return POSLst

def nnPOSNgrams(POS):
	''' Generates a noun ngram list if successive nouns in a POS list '''
	nnLst = []
	ngramNNLst = []
	ngram = False
	for i, posTuple in enumerate(POSLst):
		if 'NN' in posTuple[1]:
			nnLst.append((i, (posTuple[0], 'NN')))
			if i != 0 and 'NN' in POSLst[i-1][1] and ngram == True:
				ngramNNLst[-1] = (ngramNNLst[-1][0], (ngramNNLst[-1][1] + ' ' + POSLst[i][0], 'NN'))
			elif i != 0 and 'NN' in POSLst[i-1][1]:
				ngramNNLst.append((i-1, (POSLst[i-1][0] + ' ' + POSLst[i][0], 'NN')))
				ngram = True
			elif ngram == True:
				nnLst.append(ngramNNLst[0])
				ngramNNLst = []
				ngram = False

	if len(ngramNNLst) != 0:
		nnLst.append(ngramNNLst[0])
		ngramNNLst = []
		ngram = False
	return nnLst

def getTrigram(tokens):
	''' Generates an trigram list of a token list '''
	trigramLst = []
	end = len(tokens)
	for i, t in enumerate(tokens):
		if i+2 < end:
			trigramLst.append((i, (tokens[i] + ' ' + tokens[i+1] + ' ' + tokens[i+2], 'NN')))
	return trigramLst

def getBigram(tokens):
	''' Generates an bigram list of a token list '''
	bigramLst = []
	end = len(tokens)
	for i, t in enumerate(tokens):
		if i+1 < end:
			bigramLst.append((i, (tokens[i] + ' ' + tokens[i+1], 'NN')))
	return bigramLst

def getUnigram(tokens):
	''' Generates an unigram list of a token list '''
	unigramLst = []
	for i, t in enumerate(tokens):
		unigramLst.append((i, (tokens[i], 'NN')))
	return unigramLst

def getLexNN():
	''' Generates a list of all nouns in the lexicon '''
	# Generates dictionary of all synset nouns in the models (key = wordnet synset; value = synonym list)
	with open('prolog/nouns.pl', encoding='utf-8') as f:
			nnDict = {}
			for line in f:
				synset = line.partition('X,')[2].partition('(X)')[0]

				nnLex = []
				partTuple = line.partition('[')[2].partition(']')
				nnLex.append(' '.join([w.strip() for w in partTuple[0].split(',')]))
				while '[' in partTuple[2]:
					partTuple = partTuple[2].partition('[')[2].partition(']')
					nnLex.append(' '.join([w.strip() for w in partTuple[0].split(',')]))
				if synset in nnDict:
					nnDict[synset].extend(nnLex)
				else:
					nnDict[synset] = nnLex
			nnLexLst = list(set([word for lst in list(nnDict.values()) for word in lst if len(word) != 0]))

			# Deletes special chars from words in lexicon (nnLexLst)
			indexSC = [i for i, w in enumerate(nnLexLst) if ('\\' in w) or (w[0] == '\'')]
			wordLstSC = [(i, nnLexLst[i]) for i in indexSC]
			wordLst = []
			for i, ww in wordLstSC:
				if len(ww.split()) == 1:
					nnLexLst[i] = ww[1:-1]
				else:
					wwLst = []
					for w in ww.split():
						if '\\' in w:
							wwLst.append(w.replace("\\", "")[1:-1])
						else:
							wwLst.append(w)
					nnLexLst[i] = ' '.join(wwLst)
	return nnLexLst


### MAIN ###

nnLexLst = getLexNN()
# print('Enter a query phrase (empty line to quit):', file=sys.stderr)
# for line in sys.stdin:
# 	if line == '\n': break
line = sys.argv[1]
tokenized = word_tokenize(line)

# Stanford POSTagger
postagger = StanfordPOSTagger(_path_to_model, _path_to_jar)
POSLst = postagger.tag(tokenized)

# Generates ngram tuple lists (Tuples = (index, (ngram, POS))
unigramTup = getUnigram(tokenized)
bigramTup = getBigram(tokenized)
trigramTup = getTrigram(tokenized)

# Bigrams and Trigrams in Lexicon
unigramLex = [u for u in nnLexLst if len(u.split()) == 1]
bigramLex = [b for b in nnLexLst if len(b.split()) == 2]
trigramLex = [t for t in nnLexLst if len(t.split()) == 3]
# Checks if ngram in query is in Lexicon
unigramMatch = [u for u in unigramTup if u[1][0].lower() in unigramLex]
bigramMatch = [b for b in bigramTup if b[1][0].lower() in bigramLex]
trigramMatch = [t for t in trigramTup if t[1][0].lower() in trigramLex]

# Checks if there are noun ngrams in POS list
nnLst = nnPOSNgrams(POSLst)

# Disambiguates nouns
ngramLists = [trigramMatch, bigramMatch, unigramMatch]
# POSLst = disambiguate(ngramLists, nnLst, POSLst)

# Gets hypernym if noun is not in the lexicon
POSLst, noChange, hypernymLst = getHypernyms(POSLst)

lineToParse = ' '.join([w[0] for w in POSLst])
sys.stdout.write(lineToParse)

# print(POSLst)
# if noChange == True:
# 	pass
# else:
# 	oldNNStr = '\nNo results found for: ' + ', '.join([s[0] for s in hypernymLst]) + ". "
# 	newNNStr = "Results found for hypernym(s): " + ', '.join([s[1] for s in hypernymLst])
# 	print(oldNNStr, newNNStr, file=sys.stderr)
# print('Query to parse: ' + lineToParse, file = sys.stderr)
#
# command = "bash scripts/_nlmodels '" + lineToParse + "' > output.tex; pdflatex output"
# os.system(command)
# print('Image search completed.', file=sys.stderr)
# print('\nEnter a new query phrase (empty line to quit):', file=sys.stderr)
