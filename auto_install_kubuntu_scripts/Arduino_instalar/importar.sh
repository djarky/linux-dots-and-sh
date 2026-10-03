#!/bin/bash

# Nombre del archivo de backup
BACKUP_FILE="arduino15.tar.gz"

# Directorio de destino
DESTINATION="$HOME/.arduino15"

# Verificar si el archivo de backup existe
if [ -f "$BACKUP_FILE" ]; then
    # Verificar si el directorio de destino existe
    if [ -d "$DESTINATION" ]; then
        echo "Restaurando backup en $DESTINATION..."
    else
        # Si el directorio no existe, lo creamos
        echo "El directorio $DESTINATION no existe. Creando..."
        mkdir -p "$DESTINATION"
    fi

    # Descomprimir el archivo tar.gz en el directorio de destino
    tar -xzf "$BACKUP_FILE" -C "$HOME"

    echo "Restauración completada exitosamente en $DESTINATION."
else
    echo "Error: El archivo $BACKUP_FILE no existe."
fi
