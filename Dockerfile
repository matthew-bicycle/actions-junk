FROM node:20-alpine AS base
RUN corepack enable
COPY . /src
RUN pnpm install --frozen-lockfile \
    && pnpm build

FROM base
WORKDIR /src