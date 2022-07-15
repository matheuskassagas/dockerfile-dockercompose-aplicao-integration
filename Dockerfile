FROM ubuntu:20.04
 
WORKDIR /integrador

COPY . .

RUN apt-get update && apt-get install curl lsb-release gnupg -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y nodejs 
RUN apt-get -y install python3-pip
RUN npm install -g node-gyp@5.1.0
RUN npm install --global yarn -y
RUN yarn install
# # RUN npm rebuild
RUN yarn start:dev 

EXPOSE 3000

# # CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"

ENTRYPOINT [ "yarn", "start:dev" ]
