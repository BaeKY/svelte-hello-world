FROM node:16 AS build

WORKDIR /app

COPY package.json ./
# COPY package-lock.json ./
RUN yarn
COPY . ./
RUN yarn build

FROM nginx:1.21.4-alpine
COPY --from=build /app/public /usr/share/nginx/html