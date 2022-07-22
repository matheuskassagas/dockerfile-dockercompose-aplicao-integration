FROM ubuntu:20.04

WORKDIR /logs

WORKDIR /integrador

COPY . .

# # ENV FILE_LOG="../logs/integration-$(date +'%d%m%Y%H%M').log"

RUN apt-get update && apt-get install curl lsb-release gnupg -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y nodejs 
RUN apt-get -y install python3-pip
RUN npm install -g node-gyp@5.1.0
RUN npm install --global yarn -y
RUN yarn install
RUN mv integrador.sh /usr/local/sbin
RUN chmod +x /usr/local/sbin/integrador.sh
RUN integrador.sh


EXPOSE 3000

