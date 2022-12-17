#!/bin/sh
PRINTS_FOLDER=$HOME/Imagens/Prints
DATE=$(date +%F_%H-%M:%S)
FILE= $PRINTS_FOLDER/$DATE.png
REGION=$(slurp)
echo $REGION | grim -g - $PRINTS_FOLDER/$DATE.png 
echo $REGION | grim -g - - | wl-copy