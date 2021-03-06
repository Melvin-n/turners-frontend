# node alpine baseimage
FROM node:alpine
# create app directory and work from there
WORKDIR /app
# copy dependencies list
COPY package.json ./
COPY package-lock.json ./
# copy everything 
COPY ./ ./
# port number to expose
EXPOSE 3000
# run npm install on a layer above the image, therefore dependencies will be installed befoe running command
RUN npm install
# run tests
RUN npm test
# run start command to start react app
CMD npm start