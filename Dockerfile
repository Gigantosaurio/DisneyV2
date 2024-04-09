FROM node:18.16.1
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm i -g @nestjs/cli
RUN npm ci --production --silent && mv node_modules ../
RUN chown -R node /usr/src/app
RUN npm run start:dev
EXPOSE 3000
USER node
CMD ["npm", "run", "start:dev"]