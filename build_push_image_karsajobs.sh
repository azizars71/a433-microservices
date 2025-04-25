#!/bin/bash

# Peringatan
echo "PASTIKAN SUDAH EXPORT PASSWORD"

# exit saat error
set -e

# loading env
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

# variabel IMAGENAME
IMAGE_NAME="azizars/karsajobs:latest"

# build image
echo "Membangun image Docker: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

# login ke docker hub, password telah disimpan ke env
echo "Login ke Docker Hub"
echo "$PASSWORD_DOCKER_HUB" | docker login -u azizars --password-stdin

# push ke Docker Hub
echo "Push ke Docker Hub dengan nama $IMAGE_NAME"
docker push $IMAGE_NAME

# SELESAI
echo "SELESAI"