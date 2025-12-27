FROM node:18

WORKDIR /backend

COPY package*.json ./

RUN npm install

COPY . .

RUN useradd --create-home appuser

USER appuser

EXPOSE 3000

CMD ["node", "src/index.js"]
