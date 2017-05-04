FROM node:alpine

COPY ./package.json /app/package.json
WORKDIR /app
RUN npm install

COPY ./ /app
