FROM centos:centos7

# Update
RUN yum -y update
RUN yum install -y epel-release
RUN yum install -y nodejs

# Install app dependencies
COPY package.json /src/package.json
COPY server.js /src/server.js
RUN cd /src; npm install

# Bundle app source
COPY . /src

EXPOSE  80
CMD ["node", "/src/server.js"]
