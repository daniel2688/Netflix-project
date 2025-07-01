#!/bin/bash

CONTAINER_NAME=netflix
IMAGE_NAME=daniel2688/netflix-react-app

# Si ya existe un contenedor con ese nombre (en cualquier estado), elimínalo
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  echo "Eliminando contenedor existente $CONTAINER_NAME..."
  docker rm -f $CONTAINER_NAME || true
fi

# Ejecutar el contenedor
echo "Iniciando contenedor $CONTAINER_NAME..."
docker run -d --name=$CONTAINER_NAME -p 8080:80 $IMAGE_NAME
