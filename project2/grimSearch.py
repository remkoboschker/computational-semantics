# grimSearch.py
import os
import sys
from nltk import word_tokenize
from nltk.corpus import wordnet as wn
from nltk.tag import StanfordPOSTagger
_path_to_model = './stanford-postagger-2014-08-27/models/english-bidirectional-distsim.tagger'
_path_to_jar ='./stanford-postagger-2014-08-27/stanford-postagger.jar'

def getTrigram(tokens):
	trigramLst = []
	end = len(tokens)
	for i, t in enumerate(tokens):
		if i+2 < end:
			trigramLst.append((i, tokens[i] + ' ' + tokens[i+1] + ' ' + tokens[i+2]))
	return trigramLst

def getBigram(tokens):
	bigramLst = []
	end = len(tokens)
	for i, t in enumerate(tokens):
		if i+1 < end:
			bigramLst.append((i, tokens[i] + ' ' + tokens[i+1]))
	return bigramLst

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
		nnLst = list(set([word for lst in list(nnDict.values()) for word in lst if len(word) != 0]))

		# Deletes special chars from words in lexicon (nnLst)
		indexSC = [i for i, w in enumerate(nnLst) if ('\\' in w) or (w[0] == '\'')]
		wordLstSC = [(i, nnLst[i]) for i in indexSC]
		wordLst = []
		for i, ww in wordLstSC:
			if len(ww.split()) == 1:
				nnLst[i] = ww[1:-1]
			else:
				wwLst = []
				for w in ww.split():
					if '\\' in w:
						wwLst.append(w.replace("\\", "")[1:-1])
					else:
						wwLst.append(w)
				nnLst[i] = ' '.join(wwLst)

print('Enter a query phrase (empty line to quit):')
for line in sys.stdin:
	parse = True
	if line == '\n': break
	tokenized = word_tokenize(line)
	# Stanford POSTagger
	postagger = StanfordPOSTagger(_path_to_model, _path_to_jar)
	POS = postagger.tag(tokenized)

	# Tuples = (index, ngram)
	bigramTup = getBigram(tokenized)
	trigramTup = getTrigram(tokenized)

	# Replaces words by ngram-noun in POS list
	delLst = []
	for ngramLst in [trigramTup, bigramTup]:
		for i, ngram in ngramLst:
			if ngram in nnLst and len(ngram.split()) == 3:
				delLst.extend([i+1, i+2])
				POS[i] = (ngram, 'NN')
			elif ngram in nnLst and len(ngram.split()) == 2:
				delLst.append(i+1)
				POS[i] = (ngram, 'NN')
	for i in reversed(sorted(delLst)): del POS[i]

	queryNN = [(i, w[0]) for i, w in enumerate(POS) if 'NN' in w[1]]
	# Checks if hypernym is in lexicon if word is not in lexicon
	noMatch = False
	queryExists = True
	hypernymLst = []
	existingNN = []
	nMWords = []
	for i, nn in queryNN:
		if (nn in nnLst) == False:
			queryExists = False
			ss = wn.synsets(nn)[0]
			hypLst = ss.hypernyms()
			hypernym = ' '.join([h.lemma_names()[0] for h in hypLst][0].split('_'))
			if hypernym in nnLst:
				POS[i] = (hypernym, 'NN')
				existingNN.append(hypernym)
				hypernymLst.append((nn,hypernym))
			else:
				noMatch = True
				nMWords.append(nn)
		else:
			existingNN.append(nn)

	lineToParse = ' '.join([w[0] for w in POS])

	if queryExists:
		pass
	elif noMatch == True:
		if len(existingNN) == 0:
			print('No results found for: ' + line.strip())
			parse = False
		else:
			lineToParse = ' and '.join(existingNN)
			print('No results found for: ' + ', '.join(nMWords) + '.\nNew query: "' + lineToParse + '".')
	else:
		query = "Results found for hypernym(s): "+ ', '.join([s[1] for s in hypernymLst]) + '.\nNew query: "' + lineToParse + '".'
		print('\nNo results found for: ' + ', '.join([s[0] for s in hypernymLst]) + ". " + query)

	if parse == True:
		command = "bash scripts/_nlmodels '" + lineToParse + "' > output.tex; pdflatex output"
		os.system(command)
	print('Image search completed.')
	print('\nEnter a new query phrase (empty line to quit):')
