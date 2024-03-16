#!/bin/bash
# Ejemplo de igualdad (-eq)
numero=10
if [ $numero -eq 10 ]; then
  echo "El número es igual a 10."
fi

# Ejemplo de no igualdad (-ne)
if [ $numero -ne 5 ]; then
  echo "El número no es igual a 5."
fi

# Ejemplo de menor que (-lt)
if [ $numero -lt 15 ]; then
  echo "El número es menor que 15."
fi

# Ejemplo de menor o igual que (-le)
if [ $numero -le 10 ]; then
  echo "El número es menor o igual a 10."
fi

# Ejemplo de mayor que (-gt)
if [ $numero -gt 5 ]; then
  echo "El número es mayor que 5."
fi

# Ejemplo de mayor o igual que (-ge)
if [ $numero -ge 10 ]; then
  echo "El número es mayor o igual a 10."
fi
