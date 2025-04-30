# Menggunakan node 14 alpine
FROM node:14-alpine
# Menetapkan working dir di /app
WORKDIR /app

# Menambahkan wait-for-it.sh untuk dipakai nanti dan menambahkan izin execute
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Copy package-lock.json dan package.json
COPY package*.json ./
# Install modules yang diperlukan
RUN npm install
# Copy seluruh proyek
COPY . .
# Membuka port 3001
EXPOSE 3001
# Menjalankan wait-for-it untuk menunggu rabbitmq berjalan nanti, lalu baru menjalankan index.js
CMD ["wait-for-it.sh", "rabbitmq:5672", "--timeout=30", "--", "node", "index.js"]
