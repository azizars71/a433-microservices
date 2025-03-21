#!/bin/bash

# membuat docker image
echo "Menyusun image item-app:v1"
docker build -t item-app:v1 .
echo "Penyusunan image selesai!"
echo ""

# melihat daftar image
echo "Daftar image local"
docker images
echo ""

# mengubah nama image agar sesuai dengan format
echo "Mengubah tag item-app sesuai format"
docker tag item-app:v1 azizars71/item-app:v1
echo ""

# login ke docker hub
echo "Login Docker Hub"
echo $PASSWORD_DOCKER_HUB | docker login -u azizars71 --password-stdin #login
echo ""

# mengunggah image ke docker hub
echo "Unggah image ke docker hub"
docker push azizars71/item-app:v1
echo "Unggah selesai!"