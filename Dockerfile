FROM ubuntu:latest
FROM node:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /app/src
WORKDIR /app/src

COPY package.json .

RUN npm install --silent

RUN apt install -y curl
RUN curl -s https://install.speedtest.net/app/cli/install.deb.sh | bash
RUN apt install speedtest

COPY . .

EXPOSE 1819

CMD [ "npm", "start" ]