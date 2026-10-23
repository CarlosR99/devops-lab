#!/bin/bash

USO=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

echo "Uso actual del disco raíz: ${USO}%"

if [ "$USO" -ge 80 ]; then
    echo "ALERTA: el disco está bastante ocupado"
else
    echo "OK: el uso del disco está por debajo del 80%"
fi
