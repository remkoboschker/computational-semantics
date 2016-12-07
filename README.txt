###############################################################
## Automatic Expander of GRIM models using WordNet hypernyms ##
##                      HOW TO USE                           ##
###############################################################

All the code is included in the file "hypernym.py". It can be run from terminal using Python 3:
    python3 hypernym.py
The program will ask for a file or directory, if provided with a valid path it will process that file.
If provided with a directory, it will process all files with the .mod extension in that directory.
All expanded models are outputted to files with the same name in the 'output' folder in the current
working directory. If this folder does not exist yet it will be created by the program.

