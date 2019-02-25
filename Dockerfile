FROM alpine:3.1

# Update
RUN apk add --update
RUN apk add nodejs
RUN npm install -g npm@latest

# Install app dependencies
COPY package.json /src/package.json
COPY server.js /src/server.js
RUN cd /src; npm install

# Bundle app source
COPY . /src

EXPOSE  80
CMD ["node", "/src/server.js"]
