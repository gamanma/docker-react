#This is for prod config
#Creating the temporory container here to create the build directory of reach js application
#Once build is created copy neccessary build file into web server to run your app

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#Creating nginx container to cerate the web server 
FROM nginx
#copying the react js(static files) to speicific web directory 
COPY --from=builder /app/build /usr/share/nginx/html