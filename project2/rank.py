import sys

sentence_with_most_specific_hypernym = sys.argv[0]
models = sys.argv[2:]
sys.stdout.write(" ".join(models[:5]))