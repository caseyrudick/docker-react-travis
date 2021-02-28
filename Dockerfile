FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
#copy from, to
COPY --from=0 /app/build /usr/share/nginx/html