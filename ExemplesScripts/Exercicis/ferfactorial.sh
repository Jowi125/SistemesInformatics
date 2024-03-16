#!/bin/bash
factorial=1
echo dime un numero
read numero
for ((i = 1; 1 <= numero; i++)); do
	factorial=$((factorial * i))
done
echo "$factorial"
