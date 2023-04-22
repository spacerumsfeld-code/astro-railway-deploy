# Build stage
FROM node:lts-alpine AS build

ARG $PORT

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

# Serve stage
FROM httpd:2.4 AS runtime

COPY --from=build /app/dist /usr/local/apache2/htdocs/

EXPOSE $PORT