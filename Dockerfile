FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .


RUN npm run build

RUN npx prisma generate

EXPOSE 3000

CMD ["node", "dist/main.js"]
