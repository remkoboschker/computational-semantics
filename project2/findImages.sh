#!/bin/bash
source ../venv/bin/activate

# find() {
#   sentence=$1
#   echo ${sentence}
#   sentence_with_most_specific_hypernym=`python3 grimSearch0.py "${sentence}"`
#   #echo ${sentence_with_most_specific_hypernym}
#   first_order_semantic_representation=`swipl -g "[prolog/semdcg],parse_and_write('${sentence_with_most_specific_hypernym}'),halt."`
#   #echo ${first_order_semantic_representation}
#   models_that_satisfy_first_order_semantic_representation=$(
#   for model in `ls ../data/*.mod`; do
#       echo `swipl -g "[prolog/model_checker],main_satisfying(${first_order_semantic_representation},'${model}'),halt."`
#   done)
#   #echo ${models_that_satisfy_first_order_semantic_representation}
#   five_most_relevant_models=`python3 rank.py '${sentence_with_most_specific_hypernym}' ${models_that_satisfy_first_order_semantic_representation}`
#   #echo ${five_most_relevant_models}
#   images=${five_most_relevant_models//mod/jpg}
#   echo ${images}
#   document=`
#   # echo "\\documentclass{article}"
#   # echo "\\usepackage{graphicx}"
#   # echo "\\begin{document}"
#   # echo "\\begin{quote}"
#   # echo "${sentence}"
#   # echo "\\end{quote}"
#   # echo "\\begin{quote}"
#   # echo "${sentence_with_most_specific_hypernym}"
#   # echo "\\end{quote}"
#   # echo "\\begin{quote}"
#   # echo "\\verb+${first_order_semantic_representation}+"
#   # echo "\\end{quote}"
#   # for image in ${images}; do
#   #   echo "\\includegraphics[width=120pt,height=90pt]{${image}}"
#   # done
#   # echo "\\end{document}"
#   echo "<html><body><h1>${sentence}<h2>${sentence_with_most_specific_hypernym}<ul>"
#   for image in ${images}; do
#     echo "<li><img src=\"../${image}\"></li>"
#   done
#   `
#   echo "${document}" > "./results/${sentence// /-}.html"
#   #pdflatex -jobname=${sentence// /-} -output-directory=./results -interaction=batchmode ${document}
# }

if [ -f "$1" ]
then
  while read -r line
  do
    sentence=${line//[$'\r'$'\n']/}
    # ` echo "${line}" | tr -d '\n\r'`
    echo ${sentence}

    sentence_with_most_specific_hypernym=`python3 grimSearch0.py "${sentence}"`
    echo ${sentence_with_most_specific_hypernym}

    first_order_semantic_representations=`swipl -g "[prolog/semdcg],parse_and_write('${sentence_with_most_specific_hypernym}'),halt."`
    echo ${first_order_semantic_representations}

    highest_ranking_first_order_representation=`echo ${first_order_semantic_representations} | python3 highest-ranking-first-order-representation.py`
    echo ${highest_ranking_first_order_representation}

    models_that_satisfy_first_order_semantic_representation=$(
    for model in `ls ../data/*.mod`; do
        echo `swipl -g "[prolog/model_checker],main_satisfying(${highest_ranking_first_order_representation},'${model}'),halt."`
    done)
    echo ${models_that_satisfy_first_order_semantic_representation}

    number_of_models_that_satisfy=`echo ${models_that_satisfy_first_order_semantic_representation} | wc -w`
    echo ${number_of_models_that_satisfy}

    five_most_relevant_models=`echo ${models_that_satisfy_first_order_semantic_representation} | python3 rank-images.py '${sentence_with_most_specific_hypernym}'`
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