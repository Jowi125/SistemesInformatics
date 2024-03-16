#!/bin/bash
menor=999999999
if [ -z "$1" ]; then
        echo "No se ha introducido ninguna cadena."
        exit 0
fi
while IFS=" " read -r id nombre accesos; do
    if [[ "$nombre" == "$1"* ]]; then
        echo "$nombre" >> fitxer$1.txt
        total=$((total + accesos))
        if [ "$accesos" -lt "$menor" ]; then
            menor="$accesos"
            menorUsuario="$nombre"
        fi	
    fi
done < usuaris.txt
if [ -z "$total" ]; then
    echo "No hay ningún login que comience por la cadena introducida."
    exit 0
fi
echo "La quantitat d'accessos a la base de dades per usuaris que comencen per $1 és: $total" >> fitxer$1.txt
echo "El login que comença per $1 i que te menys accesos a la base de dadoes es $menorUsuario amb $menor" >> fitxer$1.txt
