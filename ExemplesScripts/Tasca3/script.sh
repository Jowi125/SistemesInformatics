#!/bin/bash

function obtenerArray {
    local numeros="$1"
    local cadenaNumeros="$numeros"
    local arrayNumeros=()
    for (( i=0; i<${#cadenaNumeros}; i++ )); do
        arrayNumeros[$i]=${cadenaNumeros:$i:1}
    done
    echo "${arrayNumeros[@]}"
}

adivinado="no"
intents=1
arrayRespuesta=""
for (( i=0; i<4; i++ )); do
    arrayRespuesta+=$((RANDOM%10))
done
echo "Código generado aleatoriamente: $arrayRespuesta"

echo "A ver cuánto tardas en adivinar el código que he generado."

while [[ $adivinado != "si" ]]; do
    contadorNumerosIguales=0
    contadorNumerosAcertados=0
    read -n 4 numero 
    echo ""
    if [[ $numero =~ ^[0-9]{4}$ ]]; then
        arrayNumeros=($(obtenerArray "$numero"))
        for (( i=0; i<${#arrayNumeros[@]}; i++ )); do
            for (( j=0; j<${#arrayRespuesta}; j++ )); do
                if (( ${arrayNumeros[$i]} == ${arrayRespuesta:$j:1} )); then
                    contadorNumerosIguales=$((contadorNumerosIguales+1))
                    if (( $i == $j )); then
                        contadorNumerosAcertados=$((contadorNumerosAcertados+1))
                    fi
                fi
            done
        done
        if (( contadorNumerosAcertados == 4 )); then
            adivinado="si"
        else
            if (( contadorNumerosAcertados > 0 )); then
                echo "Has acertado $contadorNumerosIguales números, $contadorNumerosAcertados de ellos en la posición correcta."
            else
                echo "Has acertado $contadorNumerosIguales números, pero ninguno en la posición correcta."
            fi
            intents=$((intents+1))
        fi
    else
        echo "Número inválido. Debe ser un número de 4 dígitos."
    fi
done

echo "¡Muy bien! ¡Has adivinado el código! Has tardado $intents intentos."

