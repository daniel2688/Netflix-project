#!/bin/bash

CONTAINER_NAME=netflix
IMAGE_NAME=daniel2688/netflix-react-app:latest

# Detener y eliminar el contenedor si existe
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  echo "Deteniendo contenedor $CONTAINER_NAME..."
  docker stop $CONTAINER_NAME || true
  docker rm $CONTAINER_NAME || true
else
  echo "No hay contenedor llamado $CONTAINER_NAME."
fi

# Eliminar la imagen si existe
if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
  echo "Eliminando imagen $IMAGE_NAME..."
  docker rmi $IMAGE_NAME || true
else
  echo "La imagen $IMAGE_NAME no existe localmente."
fi
