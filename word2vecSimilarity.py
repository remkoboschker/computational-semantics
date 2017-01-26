# import modules & set up logging
import gensim
from hypernym import loadModel, reduceModel
#import logging
#logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)


# class MySentences(object):
#     def __init__(self, dirname):
#         self.dirname = dirname
#  
#     def __iter__(self):
#         for fname in os.listdir(self.dirname):
#             for line in open(os.path.join(self.dirname, fname)):
#                 yield line.split()
#
# sentences = MySentences('/some/directory') # a memory-friendly iterator

sentences = [['first', 'sentence'], ['second', 'sentence']]
# train word2vec on the two sentences
model = gensim.models.Word2Vec(sentences, min_count=2)
# model.save('word2vec.gensim')

model.similarity('woman', 'man')
