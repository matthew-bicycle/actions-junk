ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-alpine AS base
RUN corepack enable
COPY . /src
WORKDIR /src
RUN pnpm install --frozen-lockfile \
    && pnpm build