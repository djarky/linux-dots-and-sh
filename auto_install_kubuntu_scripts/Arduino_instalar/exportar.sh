#!/bin/bash

# Directorio de origen
SOURCE="$HOME/.arduino15"

# Verificar si el directorio existe
if [ -d "$SOURCE" ]; then
    # Nombre del archivo de backup
    BACKUP_NAME="arduino15.tar.gz"

    # Crear el archivo tar.gz
    tar -czf "$BACKUP_NAME" -C "$HOME" .arduino15

    echo "Backup realizado exitosamente: $BACKUP_NAME"
else
    echo "Error: El directorio $SOURCE no existe."
fi
