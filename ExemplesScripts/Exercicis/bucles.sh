#!/bin/bash

archivo_usuarios="/etc/passwd"

echo "Información para usuarios con UID <= 25:"
echo

while IFS=':' read usuario x uid gid x ruta_carpeta
do
    if [ "$uid" -le 25 ]; then
        echo "L'usuari $usuario amb UID=$uid i GID=$gid té la carpeta personal en $ruta_carpeta"
    fi
done < "$archivo_usuarios"
