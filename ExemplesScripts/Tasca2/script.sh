#!/bin/bash

obtenerNombre() {
    read -p "Introduce el nombre del archivo: " nombre

    if [ ! -f "$nombre" ]; then
        echo "¡Error! El archivo '$nombre' no existe."
        obtenerNombre
    fi
    echo "$nombre"
}

nombre=$(obtenerNombre)
lineas=$(wc -l < "$nombre")
echo "En el fichero proporcionado hay $lineas grupos"
while IFS=":" read -r clase alumnos; do 
    IFS="," read -a arrayAlumnos <<< "$alumnos"
    cuantitatAlumnos=${#arrayAlumnos[@]}
    echo "Clase $clase, $cuantitatAlumnos usuarios."
done < "$nombre"

max_usuario=0
min_usuario=999999
max_grupo=()
min_grupo=()

while IFS=":" read -r clase alumnos; do 
    IFS=',' read -r -a alumnos_array <<< "$alumnos"
    num_alumnos=${#alumnos_array[@]}
    
    if (( num_alumnos > max_usuario )); then
        max_usuario=$num_alumnos
        max_grupo=("$clase")
    elif (( num_alumnos == max_usuario )); then
        max_grupo+=("$clase") 
    fi

    if (( num_alumnos < min_usuario )); then
        min_usuario=$num_alumnos
        min_grupo=("$clase")
    elif (( num_alumnos == min_usuario )); then
        min_grupo+=("$clase")
    fi
    
done < "$nombre"

# Imprimir los resultados

echo "El grupo con el máximo número de usuarios es: $max_usuario en las clases ${max_grupo[@]}"
echo "El grupo con el mínimo número de usuarios es: $min_usuario en las clases ${min_grupo[@]}"

