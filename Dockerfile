FROM node:lts AS runtime
WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000
CMD node ./dist/server/entry.mjs

# Build stage
# FROM node:lts-alpine AS build

# WORKDIR /app

# COPY package.json package-lock.json ./
# RUN npm ci

# COPY . .
# RUN npm run build

# # Serve stage
# FROM httpd:2.4 AS runtime

# COPY --from=build /app/dist /usr/local/apache2/htdocs/

# EXPOSE 80