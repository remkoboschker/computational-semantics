#!/bin/bash
source ../venv/bin/activate

find() {
  sentence=$1
  #echo ${sentence}
  sentence_with_most_specific_hypernym=`python3 grimSearch0.py "${sentence}"`
  #echo ${sentence_with_most_specific_hypernym}
  first_order_semantic_representation=`swipl -g "[prolog/semdcg],parse_and_write('${sentence_with_most_specific_hypernym}'),halt."`
  #echo ${first_order_semantic_representation}
  models_that_satisfy_first_order_semantic_representation=$(
  for model in `ls ../data/*.mod`; do
      echo `swipl -g "[prolog/model_checker],main_satisfying(${first_order_semantic_representation},'${model}'),halt."`
  done)
  #echo ${models_that_satisfy_first_order_semantic_representation}
  five_most_relevant_models=`python3 rank.py '${sentence_with_most_specific_hypernym}' ${models_that_satisfy_first_order_semantic_representation}`
  #echo ${five_most_relevant_models}
  images=${five_most_relevant_models//mod/jpg}
  document=`
  echo "\\documentclass{article}"
  echo "\\usepackage{graphicx}"
  echo "\\begin{document}"
  echo "\\begin{quote}"
  echo "${sentence}"
  echo "\\end{quote}"
  echo "\\begin{quote}"
  echo "${sentence_with_most_specific_hypernym}"
  echo "\\end{quote}"
  echo "\\begin{quote}"
  echo "\\verb+${first_order_semantic_representation}+"
  echo "\\end{quote}"
  for image in ${images}; do
    echo "\\includegraphics[width=120pt,height=90pt]{${image}}"
  done
  echo "\\end{document}"
  `
  pdflatex -jobname=${sentence// /-} -output-directory=./results ${document}
}

if [ -f "$1" ]
then
  while read -r line
  do
    find "${line}"
  done < $1
else
  find "$1"
fi

exit 0