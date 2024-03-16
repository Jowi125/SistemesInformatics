#!/bin/bash

echo introdueix un numero
read numero
for ((i = 1; i <= 10; i++)); do
        resultado=$((numero * i))
        echo "$numero x $i = $resultado"
    done
