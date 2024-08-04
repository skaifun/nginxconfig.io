FROM node:20.9.0-alpine as builder
WORKDIR /build
COPY package*.json .
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:stable-alpine-slim as runner
COPY --from=builder build/dist /usr/share/nginx/html
