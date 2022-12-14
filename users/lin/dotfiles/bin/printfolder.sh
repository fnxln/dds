#!/bin/sh
PRINTS_FOLDER=$HOME/Imagens/Prints

DATE= ${date +%D}

slurp | grim -g - $PRINTS_FOLDER/$DATE.png 