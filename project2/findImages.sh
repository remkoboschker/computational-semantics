#!/bin/bash
source ../venv/bin/activate
p_mode="python"

if [ -f "$1" ]
then
  while read -r line
  do
    sentence=${line//[$'\r'$'\n']/}
    echo ""
    echo "sentence:"
    echo ${sentence}

    sentence_with_most_specific_hypernym=`$p_mode grimSearch0.py "${sentence}"`
    echo ""
    echo "sentence with the most specific hypernym:"
    echo ${sentence_with_most_specific_hypernym}

    first_order_semantic_representations=`swipl -g "[prolog/semdcg],parse_and_write('${sentence_with_most_specific_hypernym}'),halt."`
    echo ""
    echo "first order semantic representations:"
    echo -e "${first_order_semantic_representations// /\\n}"

    first_order_representations_sorted_by_number_of_terms=`echo ${first_order_semantic_representations} | ${p_mode} first-order-representations-sorted-by-number-of-terms.py`
    echo ""
    echo "first order semantic representations sorted by number of synsets:"
    echo -e "${first_order_representations_sorted_by_number_of_terms// /\\n}"

    for representation in ${first_order_representations_sorted_by_number_of_terms}; do
      models_that_satisfy=$(
        for model in `ls ../data/*.mod`; do
          satisfying_model=`swipl -g "[prolog/model_checker],main_satisfying(${representation},'${model}'),halt."`
          # otherwise empty elements will be emitted
          if [ ${#satisfying_model} -gt 0 ]; then
            echo $satisfying_model
          fi
        done)
      number_of_models_that_satisfy=`echo ${models_that_satisfy} | wc -w`
      if [ ${number_of_models_that_satisfy} -gt 0 ]; then
        break
      fi
    done

    echo ""
    echo "representation chosen:"
    echo ${representation}

    echo ""
    echo "models that satisfy the first sorted representation that is satisfied by at least one model:"
    echo ${models_that_satisfy}

    five_most_relevant_models=$(
      if [ ${#models_that_satisfy} -gt 0 ]; then
        echo "${models_that_satisfy// /\\n}" | ${p_mode} dummy-five-most-relevant-models.py "${sentence_with_most_specific_hypernym}"
      fi)

    echo ""
    echo "five most relevant models sorted by cooccurence of terms in model and sentence"
    echo "${five_most_relevant_models}"

    images=${five_most_relevant_models//mod/jpg}
    #echo ${images}

    document=`
    echo "<html><body><h1>${line}<h2>${sentence_with_most_specific_hypernym}<h2>${representation}<ul>"
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
