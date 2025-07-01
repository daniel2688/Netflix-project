#!/bin/bash

echo "Limpiando directorio antiguo de la app..."

# Ruta donde se despliega tu app (ajusta si tu ruta es diferente)
APP_DIR="/home/ec2-user/app"

# Si existe el directorio, lo limpia completamente
if [ -d "$APP_DIR" ]; then
  rm -rf ${APP_DIR:?}/*
  echo "Directorio $APP_DIR limpiado correctamente."
else
  echo "El directorio $APP_DIR no existe, creando..."
  mkdir -p "$APP_DIR"
fi
