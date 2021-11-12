FROM node:16 AS build

WORKDIR /app

COPY package.json ./
# COPY package-lock.json ./
RUN yarn
COPY . ./
RUN yarn build

FROM nginx:1.21.4-alpine
LABEL org.opencontainers.image.source https://github.com/BaeKY/svelte-hello-world

COPY --from=build /app/public /usr/share/nginx/html