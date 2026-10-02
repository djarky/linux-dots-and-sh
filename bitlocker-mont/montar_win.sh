#!/bin/bash

PARTICION="/dev/nvme0n1p3"
CLAVE="PUT-YOUR-BITLOCKER-PASS-CODE-HERE"


# Directorios de montaje
BITLOCKER_DIR="/media/bitlocker"
MOUNT_DIR="/media/bitlockermount"

# Crear los directorios si no existen
sudo mkdir -p "$BITLOCKER_DIR" "$MOUNT_DIR"

echo "Desbloqueando partición BitLocker..."

if sudo dislocker "$PARTICION" -p"$CLAVE" -- "$BITLOCKER_DIR"; then
    echo "Montando el sistema de archivos..."

    if sudo ntfs-3g "$BITLOCKER_DIR/dislocker-file" "$MOUNT_DIR"; then
        echo "¡Listo! Abriendo la carpeta..."
        xdg-open "$MOUNT_DIR"
    else
        echo "Error al montar el sistema de archivos NTFS."
        exit 1
    fi
else
    echo "Error al desbloquear BitLocker."
    echo "Verifica la clave de recuperación y la partición."
    exit 1
fi
