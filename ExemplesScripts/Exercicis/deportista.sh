#!/bin/bash

while IFS=":" read nom pais naiximent dni telefono actiu
do
	if [ $actiu == "Sí" ]; then 
		if [ $naiximent -gt 1985 ]; then
			echo "Hola $nom. Has nascut despres de 1958"
	
		else
			echo "Hola $nom. Has nascut abans de 1958"
		fi

	fi
	

done < deportista2.txt
