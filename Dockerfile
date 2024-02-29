FROM node:20-alpine
RUN corepack enable
COPY . /src
WORKDIR /src