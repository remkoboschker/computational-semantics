import sys

models = []
sentence_with_most_specific_hypernym = sys.argv[0]
for line in sys.stdin: models.append(line)
sys.stdout.write(" ".join(models[:5]))