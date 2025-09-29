FROM node:alpine3.21

WORKDIR /app

COPY package*json /app/

RUN npm install

COPY . .

# ENV MONGO_URI=value
# ENV MONGO_USERNAME=value
# ENV MONGO_PASSWORD=value           will be passed at build

EXPOSE 3000

CMD [ "npm", "start" ]