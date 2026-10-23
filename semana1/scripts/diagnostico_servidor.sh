#!/bin/bash

set -u

echo "=================================="
echo " DIAGNOSTICO BASICO DEL SERVIDOR"
echo "=================================="

echo
echo "[1] Uso del disco raiz"

USO=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

if [[ "$USO" =~ ^[0-9]+$ ]]; then
    echo "Uso actual: ${USO}%"

    if [ "$USO" -ge 80 ]; then
        echo "ALERTA: uso de disco elevado"
    else
        echo "OK: uso de disco normal"
    fi
else
    echo "ERROR: no se pudo obtener el uso del disco"
fi

echo
echo "[2] Memoria RAM"

free -h

echo
echo "[3] Resolucion DNS"

if getent hosts example.com > /dev/null; then
    echo "OK: se pudo resolver example.com"
else
    echo "ALERTA: no se pudo resolver example.com"
fi

echo
echo "Diagnostico finalizado"
