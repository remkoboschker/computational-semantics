# testWordNet.py
from nltk.corpus import wordnet
from nltk.stem.wordnet import WordNetLemmatizer
from nltk import word_tokenize, pos_tag

sentence = 'The cat is walking on the street'
tokenize = word_tokenize(sentence)
print(pos_tag(tokenize))
print(WordNetLemmatizer().lemmatize('loving', 'v'))
for sinset in wordnet.synsets('Cat',pos="n"):
	print(sinset, sinset.definition())
	print('')
	
dog = wordnet.synset('dog.n.01')
cat = wordnet.synset('cat.n.01')
print(dog.hypernyms())
print(dog.lowest_common_hypernyms(cat))
print('')
print('')

# Get all hypernyms
word = [dog]
while len(word) != 0:
	print(word)
	hypernym = word[0].hypernyms()
	word = hypernym
