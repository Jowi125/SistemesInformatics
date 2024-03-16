#!/bin/bash

if [ $# -eq 3 ]; then
	echo hay 3 parametros
	if [ $3 == $USER ]; then
        	echo correcto
		if [ -d $2 ]; then
			echo el directori si que existeix
			touch $2/$1
		else
			mkdir $2
		fi
	else
	
        	echo incorrecto
	fi
else
	echo no hi han 3 parametres
	exit 1

fi
