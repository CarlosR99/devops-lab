#!/bin/bash

PROCESO="systemd-journald"

if pgrep -f -x "$PROCESO" > /dev/null; then
    echo "OK: el proceso $PROCESO está activo"
else
    echo "ALERTA: no se encontró el proceso $PROCESO"
fi
