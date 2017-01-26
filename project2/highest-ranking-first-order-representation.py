import sys

models = []
for line in sys.stdin: models.append(line)
sys.stdout.write(models[0])