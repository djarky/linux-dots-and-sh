#!/bin/bash

IMAGEN="/media/kubuntu/SD_UnU/wallpaper/001.jpg"
DESTINO="$HOME/wallpaper/001.jpg"

# Verificar si el archivo de imagen existe
if [ ! -f "$IMAGEN" ]; then
    echo "❌ El archivo de imagen no existe: $IMAGEN"
    exit 1
fi

# Verificar si el directorio $HOME/wallpaper existe, si no, crearlo
if [ ! -d "$HOME/wallpaper" ]; then
    echo "📂 El directorio $HOME/wallpaper no existe. Creándolo..."
    mkdir -p "$HOME/wallpaper"
fi

# Copiar la imagen al directorio $HOME/wallpaper
echo "📤 Copiando la imagen a $DESTINO..."
cp "$IMAGEN" "$DESTINO"

# Verificar si la copia fue exitosa
if [ $? -eq 0 ]; then
    echo "✔ Imagen copiada correctamente a $DESTINO"
else
    echo "❌ Error al copiar la imagen"
    exit 1
fi

echo "🖼 Cambiando fondo de pantalla a: $DESTINO"

# Verificar si plasmashell ya está en ejecución
if ! pgrep -x "plasmashell" > /dev/null; then
    echo "plasmashell no está en ejecución. Iniciándolo..."
    plasmashell &
    sleep 2  # Esperar 2 segundos para que plasmashell se inicie correctamente
else
    echo "plasmashell ya está en ejecución."
fi

# Establecer el fondo de pantalla usando kwriteconfig5
plasma-apply-wallpaperimage $DESTINO

# Verificar si kwriteconfig5 fue exitoso
if [ $? -eq 0 ]; then
    echo "✔ Fondo de pantalla actualizado correctamente"
else
    echo "❌ Error al actualizar el fondo de pantalla"
    exit 1
fi

# Configurar zona horaria
echo "🕓 Configurando zona horaria (America/La_Paz)..."
sudo timedatectl set-timezone America/La_Paz
if [ $? -eq 0 ]; then
    echo "✔ Zona horaria configurada correctamente"
else
    echo "❌ Error al configurar la zona horaria"
    exit 1
fi

sh /media/kubuntu/SD_UnU/firefox_backup/install.sh

nmcli dev wifi connect "WIFI" password "12345678"

