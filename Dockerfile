FROM node:14-alpine
WORKDIR /app

RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3001
CMD ["wait-for-it.sh", "rabbitmq:5672", "--timeout=30", "--", "node", "index.js"]
