FROM node:20-alpine AS base
RUN corepack enable
COPY . /src

FROM base AS unit-test
RUN echo "Running unit tests"

FROM base
WORKDIR /src