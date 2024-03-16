#!/bin/bash

mes_users=0
mes_users_array=()
menys_users=100000
menys_users_array=()

while IFS=":" read cicle users
do
    users_espais=`echo $users | tr "," " "`
    array_users=($users_espais)
    
    num_users=${#array_users[@]}

    echo "- $cicle: $num_users usuaris"

    if [ $num_users -gt $mes_users ]
    then
        mes_cicle=$cicle
        mes_users=$num_users
        mes_users_array=($cicle)
    elif [ $num_users -eq $mes_users ]
    then
        mes_users_array+=("$cicle")
    fi

    if [ $num_users -lt $menys_users ]
    then
        menys_cicle=$cicle
        menys_users=$num_users
        menys_users_array=($cicle)
        
    elif [ $num_users -eq $menys_users ]
    then
        menys_users_array+=("$cicle")
    fi

done < grupos.txt

echo "El cicle amb més usuaris és ${mes_users_array[@]} amb $mes_users usuaris"

echo "El cicle amb menys usuaris és ${menys_users_array[@]} amb $menys_users usuaris"
