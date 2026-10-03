#!/bin/bash
# ==============================================
# Script de configuración inicial para Kubuntu
# Autor: Tu Nombre
# Fecha: $(date)
# ==============================================

# Detener si ocurre algún error
set -e

echo "🔄 Actualizando lista de paquetes..."
sudo apt update -y

echo "⬆️ Actualizando el sistema..."
sudo apt upgrade -y

echo "🌍 Configurando idioma (Español - Bolivia)..."
sudo apt install -y language-pack-es language-pack-kde-es
sudo update-locale LANG=es_BO.UTF-8
echo "✅ Idioma configurado a Español (Bolivia)"

echo "⌨️ Configurando distribución de teclado (Latinoamérica)..."
# Puedes cambiar 'latam' por 'es' si prefieres teclado español de España
kwriteconfig5 --file kcminputrc --group Keyboard --key LayoutList "latam"
kwriteconfig5 --file kcminputrc --group Keyboard --key Model "pc105"
kwriteconfig5 --file kcminputrc --group Keyboard --key Use "true"

echo "✅ Teclado configurado a Español Latinoamericano"

echo "🕓 Configurando zona horaria (America/La_Paz)..."
sudo timedatectl set-timezone America/La_Paz
echo "✅ Zona horaria configurada correctamente"

echo "🧩 Instalando programas esenciales..."
sudo apt install -y simulide  gimp

echo "🧹 Limpiando paquetes innecesarios..."
sudo apt autoremove -y
sudo apt clean

echo "✅ Configuración inicial completada con éxito!"
echo "------------------------------------------------"
echo "Idioma: Español (Bolivia)"
echo "Teclado: Español (Latinoamérica)"
echo "Zona horaria: America/La_Paz"
echo "Programas instalados:"
echo "  - SimulIDE"
#echo "  - KiCad"
#echo "  - Blender"
echo "  - GIMP"
echo "------------------------------------------------"
echo "🚀 El sistema Kubuntu está listo para usar."
