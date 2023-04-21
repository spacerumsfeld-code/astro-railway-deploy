# Build stage
FROM node:lts-alpine AS build
WORKDIR /app
COPY . .
RUN npm i
RUN npm run build

# Serve stage
FROM nginx:stable-alpine
COPY --from=build /usr/src/app/dist /usr/share/nginx/html