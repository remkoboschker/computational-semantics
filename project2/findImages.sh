#!/bin/bash
source ../venv/bin/activate
sentence=$1
echo ${sentence}
sentence_with_most_specific_hypernym=`python3 grimSearch0.py "${sentence}"`
echo ${sentence_with_most_specific_hypernym}
first_order_semantic_representation=`swipl -g "[prolog/semdcg],parse_and_write('${sentence_with_most_specific_hypernym}'),halt."`
echo ${first_order_semantic_representation}
models_that_satisfy_first_order_semantic_representation=`
for model in `ls ../data/*.mod`; do
    echo swipl -g "[prolog/model_checker],main_satisfying(${FORMULA},'${MODEL}'),halt."
done`

#sed "s/mod'/jpg'/"

exit 0