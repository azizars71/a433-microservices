# menggunakan image node 14
FROM node:14-alpine

# menghubungkan container image dengan repo
LABEL org.opencontainers.image.source="https://github.com/azizars71/a433-microservices"

# menggunakan /app working dir
WORKDIR /app

# menyalin seluruh source code ke working directory container
COPY . .

# menentukan env production dan menggunakan container db dari item-db
ENV NODE_ENV=production DB_HOST=item-db

# install dependensi untuk production lalu build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# ekspos port 8080
EXPOSE 8080

# meluncurkan server dengan npm start
CMD ["npm", "start"]