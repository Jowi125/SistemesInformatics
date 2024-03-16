#!/bin/bash

#Mostrar contingit per linea de un fitxer

while read linea
do

	echo "linea: $linea"

done < usuaris.txt

#Mosrtar nom de l'usuari

while read linea
do
	nom=$(echo $linea | cut -d';' -f1)
	echo "nom: $nom"

done < usuaris.txt

#Mostrar nom y departament

while read linea
do
	nom=$(echo $linea | cut -d';' -f1)
	departament=$(echo $linea | cut -d';' -f4)
	echo "L'usuari $nom perteneix al departament $departament"

done < usuaris.txt

# Forma per posar delimitador a l'inici y definir les variables de cada espai.

while IFS=";" read nom cognom login departament
do
	echo "L'usuari $nom $cognom perteneix al departament $departament"

done < usuaris.txt
