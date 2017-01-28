import sys
import re
from collections import OrderedDict

models = {}

for model in sys.stdin:
    model = model.rstrip('\n')
    score = len(re.findall("[nsa]_[a-z]+(?:_\d+)?\([\w,]+\)",model))#finds all terms
    models[model] = score

models = OrderedDict(sorted(models.items(),key=lambda m:m[1],reverse=True))
sys.stdout.write(' '.join(models.keys()))