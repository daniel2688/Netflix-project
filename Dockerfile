# Etapa de build
FROM node:16.17.0-alpine as builder

WORKDIR /app

COPY ./package.json . 
COPY ./yarn.lock .
RUN yarn install

COPY . .

ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"

RUN yarn build

# Etapa de producción con nginx
FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html

# Limpia archivos por defecto de nginx
RUN rm -rf ./*

# Copia los archivos generados del build
COPY --from=builder /app/dist .

# ❗️ Copia el nginx.conf después de haber definido nginx como imagen base
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
