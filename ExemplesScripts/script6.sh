#!/bin/bash

for (( i = 1; i <= $#; i++)) do
	echo "El paramerte $i és ${!i}"
done 
