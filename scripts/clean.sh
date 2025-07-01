#!/bin/bash

echo "Eliminando aplicación anterior..."

# Forzar eliminación con permisos de root y sin errores si hay problemas
rm -rf /home/ec2-user/app || {
  echo "Fallo al eliminar la carpeta, intentando con sudo chown..."
  sudo chown -R ec2-user:ec2-user /home/ec2-user/app
  sudo rm -rf /home/ec2-user/app
}

echo "Carpeta anterior eliminada."
