FROM node:22-alpine

ENV NODE_ENV=production PORT=8080
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev && npm cache clean --force

COPY server.cjs ./
COPY public ./public

USER node
EXPOSE 8080
CMD ["node", "server.cjs"]
