#!/bin/bash

CONTAINER_NAME=netflix
IMAGE_NAME=daniel2688/netflix-react-app:latest

# Detener y eliminar el contenedor si existe
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  echo "Eliminando contenedor existente $CONTAINER_NAME..."
  docker rm -f $CONTAINER_NAME || true
fi

# Eliminar imagen anterior para garantizar pull fresco
if [ "$(docker images -q $IMAGE_NAME)" ]; then
  echo "Eliminando imagen local existente $IMAGE_NAME..."
  docker image rm $IMAGE_NAME || true
fi

# Hacer pull de la imagen actualizada
echo "Descargando última versión de $IMAGE_NAME..."
docker pull $IMAGE_NAME

# Ejecutar el contenedor actualizado
echo "Iniciando contenedor $CONTAINER_NAME..."
docker run -d --name=$CONTAINER_NAME -p 8080:80 $IMAGE_NAME
