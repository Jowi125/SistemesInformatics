#!/bin/bash

while true; do
	echo Escriu un numero:
	read numero
	if [ $numero -gt $1 ]; then
		echo El numero secret es menor.
	elif [ $numero -lt $1 ]; then
		echo El numero secret es major.
	fi
	if [ $numero -eq $1 ]; then
		echo Enhorabona, has encertat el numero.
		exit 1
	fi
done
