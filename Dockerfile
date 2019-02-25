FROM alpine:3.1

# Update
RUN apk add --update
RUN apk add nodejs

# Install app dependencies
COPY package.json /src/package.json
COPY server.js /src/server.js
RUN cd /src; npm install

# Bundle app source
COPY . /src

EXPOSE  80
CMD ["sudo node", "/src/server.js"]
