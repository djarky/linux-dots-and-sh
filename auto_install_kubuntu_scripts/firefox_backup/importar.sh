#!/bin/bash
set -e

# Directorio de Firefox (Snap)
FIREFOX_DIR="$HOME/snap/firefox/common/.mozilla/firefox"

# Carpeta donde se encuentra la copia de seguridad
BACKUP_DIR="/media/kubuntu/SD_UnU/firefox_backup"

# Nombre del archivo comprimido
ARCHIVE_NAME="firefox_backup.tar.gz"

# Ruta completa del archivo de backup
DESTINO="$BACKUP_DIR/$ARCHIVE_NAME"

echo "== Restaurando copia de seguridad de Firefox =="

# Comprobar que el archivo de backup existe
if [ ! -f "$DESTINO" ]; then
    echo "❌ Error: No se encontró el archivo de backup:"
    echo "   $DESTINO"
    exit 1
fi

# Comprobar que el directorio de destino existe
if [ ! -d "$FIREFOX_DIR" ]; then
    echo "❌ Error: No se encontró el directorio de Firefox:"
    echo "   $FIREFOX_DIR"
    echo "¿Está instalado Firefox mediante Snap?"
    exit 2
fi

# Restaurar los archivos del backup
echo "🔄 Restaurando el archivo TAR..."
tar -xzf "$DESTINO" -C "$FIREFOX_DIR/.."

echo "✅ ¡Restauración completada!"
echo "📁 Los datos de Firefox han sido restaurados desde:"
echo "   $DESTINO"
