#!/bin/bash
set -e

# Directorio de Firefox (Snap)
FIREFOX_DIR="$HOME/snap/firefox/common/.mozilla/firefox"

# Carpeta donde se guardará la copia
BACKUP_DIR="/media/kubuntu/SD_UnU/firefox_backup"

# Nombre del archivo comprimido
ARCHIVE_NAME="firefox_backup.tar.gz"

# Ruta completa del archivo final
DESTINO="$BACKUP_DIR/$ARCHIVE_NAME"

echo "== Copia de seguridad de Firefox =="

# Comprobar que el directorio de origen existe
if [ ! -d "$FIREFOX_DIR" ]; then
    echo "❌ Error: No se encontró el directorio de Firefox:"
    echo "   $FIREFOX_DIR"
    echo "¿Está instalado Firefox mediante Snap?"
    exit 1
fi

# Crear carpeta de backup si no existe
mkdir -p "$BACKUP_DIR"

# Comprobar permisos de escritura
if [ ! -w "$BACKUP_DIR" ]; then
    echo "❌ Error: No se puede escribir en la carpeta de backup:"
    echo "   $BACKUP_DIR"
    exit 2
fi

echo "📦 Creando archivo TAR..."
tar -czf "$DESTINO" -C "$FIREFOX_DIR/.." "$(basename "$FIREFOX_DIR")"

echo "✅ ¡Backup completado!"
echo "📁 Archivo guardado en:"
echo "   $DESTINO"
