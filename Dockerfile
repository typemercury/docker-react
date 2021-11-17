FROM node:16-alpine as buildstage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .   
RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=buildstage /app/build usr/share/nginx/html


