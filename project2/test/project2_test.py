# project2_test.py

from nltk.corpus import wordnet as wn
from nltk.stem.wordnet import WordNetLemmatizer
from nltk import word_tokenize, pos_tag
from nltk.corpus.reader import NOUN

from nltk.tag.stanford import POSTagger
_path_to_model = 'stanford-postagger-2014-08-27/models/english-bidirectional-distsim.tagger'
_path_to_jar ='stanford-postagger-2014-08-27/stanford-postagger.jar'

test_string = 'a black animal on a skateboard'
tokenized = word_tokenize(test_string)
# Stanford POSTagger
postagger = POSTagger(path_to_model=_path_to_model, path_to_jar=_path_to_jar)
POS = postagger.tag(tokenized)[0]
print(POS)

nnDict = {}
# synset list of all hypernyms of a word
hypSsLst = []
for word, pos in POS:
	if pos == 'NN':
		# Gets synset nouns
		synsetLst = wn.synsets(word, NOUN)
		for ss in synsetLst:
			print(ss.name())
			hypernyms = ss.hypernyms()
			for h in hypernyms:
				hypernyms.extend(h.hypernyms())
			hypSsLst.extend([ss.name() for ss in hypernyms])
		print(list(set(hypSsLst)))
		hypSsLst = []

