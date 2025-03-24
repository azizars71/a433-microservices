#!/bin/bash

# membuat docker image
echo "Menyusun image item-app:v1"
docker build -t item-app:v1 . # menyusun sesuai dockerfile
echo "Penyusunan image selesai!"
echo ""

# melihat daftar image
echo "Daftar image local"
docker images # melihat image yang berada di local
echo ""

# login ke github packages
echo "Melakukan login ke Github Packages"
echo $GITHUB_PAT | docker login ghcr.io -u azizars71 --password-stdin # proses login dengan token
if [ $? -ne 0 ]; then # cek gagal
  echo "Login gagal! Coba gunakan Terminal!"
  exit 1
fi
echo "Login BERHASIL!" # berhasil
echo ""


# mengubah nama image agar sesuai dengan format
echo "Mengubah tag item-app sesuai format"
docker tag item-app:v1 ghcr.io/azizars71/a433-microservices/item-app:v1 # mempersiapkan untuk dioper ke github packages
echo ""

# mengunggah image ke github packages
echo "Unggah image ke Github Packages"
docker push ghcr.io/azizars71/a433-microservices/item-app:v1 # mengunggah ke packages
echo "Unggah selesai!"