FROM node:18-alpine as build

WORKDIR /app

COPY hello-world-react/package*.json ./
RUN npm install

COPY ./hello-world-react/ .
RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80