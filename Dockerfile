FROM alpine:3.1

# Update
RUN apk add --update nodejs
RUN npm cache clean -f
RUN npm install -g n

# Install app dependencies
COPY package.json /src/package.json
COPY server.js /src/server.js
RUN cd /src; npm install

# Bundle app source
COPY . /src

EXPOSE  80
CMD ["node", "/src/server.js"]