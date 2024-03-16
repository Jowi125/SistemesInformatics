#!/bin/bash


function suma() {
    resultado=$(($1 + $2))
    echo "La suma es: $resultado"
}


function resta() {
    resultado=$(($1 - $2))
    echo "La resta es: $resultado"
}


function multiplicacion() {
    resultado=$(($1 * $2))
    echo "La multiplicación es: $resultado"
}


function division() {
        resultado=$(($1 / $2))
        echo "La división es: $resultado"

}


function potencia() {
    resultado=$(($1 ** $2))
    echo "La potencia es: $resultado"
}


function factorial() {
        resultado=1
        for ((i = 1; i <= $1; i++)); do
            resultado=$((resultado * i))
        done
        echo "El factorial es $resultado"
    
}



    echo "Operaciones disponibles:"
    echo "1. Suma"
    echo "2. Resta"
    echo "3. Multiplicación"
    echo "4. División"
    echo "5. Potencia"
    echo "6. Factorial"

    read -p "Seleccione una operación (0-6): " opcion


    if [ $opcion -eq 1 ]; then
        read -p "Ingrese el primer número: " num1
        read -p "Ingrese el segundo número: " num2
        suma $num1 $num2
    elif [ $opcion -eq 2 ]; then
        read -p "Ingrese el primer número: " num1
        read -p "Ingrese el segundo número: " num2
        resta $num1 $num2
    elif [ $opcion -eq 3 ]; then
        read -p "Ingrese el primer número: " num1
        read -p "Ingrese el segundo número: " num2
        multiplicacion $num1 $num2
    elif [ $opcion -eq 4 ]; then
        read -p "Ingrese el numerador: " num1
        read -p "Ingrese el denominador: " num2
        division $num1 $num2
    elif [ $opcion -eq 5 ]; then
        read -p "Ingrese la base: " num1
        read -p "Ingrese el exponente: " num2
        potencia $num1 $num2
    elif [ $opcion -eq 6 ]; then
        read -p "Ingrese el número para calcular el factorial: " num1
        factorial $num1
    else
        echo "Opción no válida. Inténtelo de nuevo."
    fi
