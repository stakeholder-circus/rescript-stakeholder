FROM node:26-alpine AS build
WORKDIR /app
COPY package.json pnpm-lock.yaml rescript.json ./
COPY rescript_src ./rescript_src
RUN corepack enable && pnpm install --frozen-lockfile && pnpm exec rescript build

FROM node:26-alpine
WORKDIR /app
LABEL org.opencontainers.image.title="rescript-stakeholder"
LABEL org.opencontainers.image.description="Deterministic-first ReScript stakeholder CLI"
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/lib ./lib
ENTRYPOINT ["node", "lib/es6/rescript_src/Cli.mjs"]
CMD ["--list-values"]
