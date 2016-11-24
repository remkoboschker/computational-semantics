# Computational semantics

Remko, Joost, Gunnar, Leonardo

## Project 1, Group 1: Hypernym Generation

Task: Extend first-order models automatically by adding (automatically) more general concepts based on WordNet's hypernym relations.

Members: Remko Boschker, Leonardo Velozo, Joost Doornkamp, Gunnar Gerstenkorn

If the domain list is in the entity hypernym, then we are done.

Chose to use nltk / python instead of prolog, because of ease of use.

Leonardo wrote a basic script to extract hypernyms. Joost will write a wrapper loading the models and writing out the modified ones.

We wonder if this is all there is to the assignemnt.

### issues

1. multiple inheritance problem
1. for instance living entity, if it does not have children, it does not subdivide, should it be removed? Is it used in natural language? You need the top 'entitiy'. Get the lowest common ancestor.
1. maybe see if you can get more specific; hyponames? Use pictures? maybe show images and facilitate annotation. Use imagenet. Count if there are hyponyms available.
1. handle the tree place grounded model
1. remove hypernyms first, only keep the hyponyms
1. 

