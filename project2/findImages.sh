#!/bin/bash
source ../venv/bin/activate

if [ -f "$1" ]
then
  while read -r line
  do
    sentence=${line//[$'\r'$'\n']/}
    echo ${sentence}

    sentence_with_most_specific_hypernym=`python3 grimSearch0.py "${sentence}"`
    echo ${sentence_with_most_specific_hypernym}

    first_order_semantic_representations=`swipl -g "[prolog/semdcg],parse_and_write('${sentence_with_most_specific_hypernym}'),halt."`
    #echo "${first_order_semantic_representations// /\\n}"

    first_order_representations_sorted_by_number_of_terms=`echo ${first_order_semantic_representations} | python3 first-order-representations-sorted-by-number-of-terms.py`
    #echo ${first_order_representations_sorted_by_number_of_terms// /\\n}

    for representation in ${first_order_representations_sorted_by_number_of_terms}; do
      models_that_satisfy_first_order_semantic_representation=$(
        for model in `ls ../data/*.mod`; do
          satisfying_model=`swipl -g "[prolog/model_checker],main_satisfying(${representation},'${model}'),halt."`
          # otherwise empty elements will be emitted
          if [ ${#satisfying_model} -gt 0 ]; then
            echo $satisfying_model
          fi
        done)
      number_of_models_that_satisfy=`echo ${models_that_satisfy_first_order_semantic_representation} | wc -w`
      echo ${number_of_models_that_satisfy}
      if [ ${number_of_models_that_satisfy} -gt 0 ]; then
        break
      fi
    done

    echo ${models_that_satisfy_first_order_semantic_representation}

    five_most_relevant_models=`echo "${models_that_satisfy_first_order_semantic_representation// /\\n}" | python3 five-most-relevant-models.py '${sentence_with_most_specific_hypernym}'`
    echo ${five_most_relevant_models}

    images=${five_most_relevant_models//mod/jpg}
    #echo ${images}

    document=`
    echo "<html><body><h1>${line}<h2>${sentence_with_most_specific_hypernym}<h2>${first_order_semantic_representation}<ul>"
    for image in ${images}; do
      echo "<li><img src=\"../${image}\"></li>"
    done
    `
    echo "${document}" > "./results/${number_of_models_that_satisfy}-${sentence// /-}html"

  done < $1
else
  find "$1"
fi

exit 0
