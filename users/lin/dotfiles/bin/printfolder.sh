#!/bin/sh
PRINTS_FOLDER=$HOME/Imagens/Prints

DATE=$(date +%F_%H-%M:%S)

FILE= $PRINTS_FOLDER/$DATE.png
slurp | grim -g - $PRINTS_FOLDER/$DATE.png