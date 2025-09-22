# Etapa de build
FROM node:18-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Inyectar la variable en tiempo de build
ARG NEXT_PUBLIC_API_URL
ENV NEXT_PUBLIC_API_URL=$NEXT_PUBLIC_API_URL

RUN npm run build

# Etapa final
FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app ./

CMD ["npm", "run", "start"]
