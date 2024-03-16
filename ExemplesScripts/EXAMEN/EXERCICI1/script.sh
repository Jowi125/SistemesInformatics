#!/bin/bash

opcioCorrecta="no"
echo "Introdueix un numero per fer una operacio:"
while [[ $opcioCorrecta != "Si" ]]; do

echo "1-Mostrar els usuaris que han fet log in en la data introduida."
echo "2-Mostrar el nombre de vegades que l'usuari introduit ha fet log in."
echo "3-Mostrar cuan ha sigut l'ultima vegada que ha fet log in l'usuari introdiut."
read opcio
if [[ $opcio < 4 && $opcio > 0 ]]; then
	opcioCorrecta="Si"
else
	echo "Opcio incorrecta, has d'introduir un numero entre l'1 y el 3."
fi
done
if [[ $opcio == 1 ]]; then
	echo "Dime una data"
	contador=0
	read -n 2 fechaDia
	read fechaMes
	while IFS=" " read -r nom dia mes; do
		if [[ $fechaDia == $dia && $fechaMes == $mes ]]; then 
			echo "- $nom"
			contador=$((contador+1))
		fi
	done < usuaris.txt
	if [[ $contador == 0 ]]; then 
		echo "No s'ha trobat cap usuari que haja fet log in eixe dia"
	fi
elif [[ $opcio == 2 ]]; then 
	echo "Dime el nom d'usuari que vols buscar"
	read nomPosat
	contarInicis=0
	while IFS=" " read -r nom dia mes; do
		if [[ $nomPosat == $nom ]]; then
			contarInicis=$((contarInicis+1))
		fi
	done < usuaris.txt
	if [[ $contarInicis == 0 ]]; then
		echo "Has introduit un nom d'usuari inexistent."
	else
		echo "L'usuari $nomPosat ha accedit al sistema $contarInicis vegades."
	fi
elif [[ $opcio == 3 ]]; then 
	diaMes=1
	mesMajor=1
	contador=0
	echo "Dime un nom"
	read nomIntroduit
	while IFS=" " read -r nom dia mes; do
		if [[ $nomIntroduit == $nom ]]; then
		contador=$((contador+1))
			mesUsuari="$mes"
			if [[ $mesUsuari == "gener" ]]; then
    				numeroMes=1
    			elif [[ $mesUsuari == "febrer" ]]; then
    				numeroMes=2
    			elif [[ $mesUsuari == "març" ]]; then
    				numeroMes= 3
    			elif [[ $mesUsuari == "abril" ]]; then
    				numeroMes= 4
    			elif [[ $mesUsuari == "maig" ]]; then
    				numeroMes=5
    			elif [[ $mesUsuari == "juny" ]]; then
    				numeroMes=6
    			elif [[ $mesUsuari == "juliol" ]]; then
    				numeroMes= 7
    			elif [[ $mesUsuari == "agost" ]]; then
    				numeroMes= 8
    			elif [[ $mesUsuari == "septembre" ]]; then
    				numeroMes= 9
    			elif [[ $mesUsuari == "octubre" ]]; then
    				numeroMes= 10
    			elif [[ $mesUsuari == "novembre" ]]; then
    				numeroMes= 11
    			elif [[ $mesUsuari == "decembre" ]]; then
    				numeroMes= 12
    			fi
    			if [[ $numeroMes > $mesMajor ]]; then
    				mesMajor=$numeroMes
    				diaMes=$dia
    				nomMes=$mes
    			fi
    				
		fi
	done < usuaris.txt
	if [[ $contador == 0 ]]; then 
		echo "Has introduit un nom d'usuari inexistent."
	else
		echo "L'usuari $nomIntroduit ha accedit per ultima vegada el $diaMes de $nomMes."
	fi
	
fi
