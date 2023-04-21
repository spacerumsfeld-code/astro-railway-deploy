# Build stage
FROM node:lts-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

# Serve stage
FROM nginx:stable-alpine

COPY --from=build /app/dist /usr/share/nginx/html