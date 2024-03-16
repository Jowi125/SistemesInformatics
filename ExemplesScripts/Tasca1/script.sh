#!/bin/bash
if [ $# != 1 ]; then
	echo "Error! has de proporcionar un parametre"
	exit 1
fi

menor=999
while IFS=" " read -r id nom accesos; do 
	if [[ "$nom" == "$1"* ]]; then
		echo "$nom" >> fitxer$1.txt
		total=$((total+accesos))
		if [ "$accesos" -lt "$menor" ]; then
			menor=$accesos
			nombremenor=$nom
		fi
	fi
done < usuaris.txt
echo "El numero total de accesos es $total" >> fitxer$1.txt
echo "El login que comença per $1 i que té menys accesos a la base de dades és: $nombremenor amb $menor accesos" >> fitxer$1.txt
