#!/bin/bash

mkdir -p ~/.local/share/applications


# Variables
APPIMAGE_SRC="$PWD/arduino-ide_2.3.6_Linux_64bit.AppImage"
INSTALL_DIR="$HOME/Programas/arduino"
APPIMAGE_DEST="$INSTALL_DIR/arduino-ide_2.3.6_Linux_64bit.AppImage"
DESKTOP_FILE_NAME="arduino-ide.desktop"
DESKTOP_ENTRY="$HOME/.local/share/applications/$DESKTOP_FILE_NAME"
DESKTOP_SHORTCUT="$HOME/Desktop/$DESKTOP_FILE_NAME"
ICON_PATH="$INSTALL_DIR/arduino-icon.png"

# 1. Crear carpeta de instalación
mkdir -p "$INSTALL_DIR"

# 2. Copiar AppImage
cp "$APPIMAGE_SRC" "$APPIMAGE_DEST"

# 3. Dar permisos ejecución
chmod +x "$APPIMAGE_DEST"

# 4. Añadir usuario al grupo dialout para permisos de puerto serial
#    Según la documentación de Arduino, es necesario para usar puertos seriales. :contentReference[oaicite:1]{index=1}
sudo usermod -a -G dialout "$USER"

# 5. Crear un icono si no existe (opcional)
#    Aquí deberías poner un icono .png que te guste dentro de $INSTALL_DIR
#    Si no tienes icono, este paso lo puedes omitir o descargar uno
cp arduino-icon.png ~/Programas/arduino/arduino-icon.png


if [ ! -f "$ICON_PATH" ]; then
  echo "No se encontró un icono en $ICON_PATH. Puedes colocar un icono .png con ese nombre para que se vea en el lanzador."
fi

# 6. Crear archivo .desktop para que aparezca en el menú de aplicaciones
cat > "$DESKTOP_ENTRY" <<EOL
[Desktop Entry]
Name=Arduino IDE 2.3.6
Comment=Arduino IDE integrado
Exec=$APPIMAGE_DEST --no-sandbox
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Development;Electronics;
EOL

# Dar permiso al .desktop para que sea ejecutable
chmod +x "$DESKTOP_ENTRY"

# 7. Crear acceso directo en el escritorio
#    En KDE, puedes usar un .desktop también en ~/Desktop
mkdir -p "$HOME/Desktop"
cp "$DESKTOP_ENTRY" "$DESKTOP_SHORTCUT"
chmod +x "$DESKTOP_SHORTCUT"

sh importar.sh

echo "Instalación completada."
#echo "Por favor, cierra sesión y vuelve a entrar para que los cambios de grupo (dialout) hagan efecto."
#echo "Luego podrás lanzar Arduino IDE desde el menú de aplicaciones o desde el escritorio."
