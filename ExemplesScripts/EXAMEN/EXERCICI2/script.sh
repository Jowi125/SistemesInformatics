#!/bin/bash

if [ $# != 1 ]; then
	echo "Has d'introduir un nom"
	exit 1
fi
if [ ! -d "$1" ]; then
        echo "¡Error! El directorio '$1' no existe."
else
	echo "Si existeix"
fi




