FROM node:20-alpine AS base
RUN corepack enable
COPY . /src

FROM base
WORKDIR /src