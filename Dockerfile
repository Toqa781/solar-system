# stage 1: Builder - Install dependinces

FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files only (for layer caching)
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production && \
    npm cache clean --force




#stage 2: Production

FROM node:18-alpine

# create system group and non-root user for security best practice
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

WORKDIR /app

#copy the dependincies file from the builder stage and change the owner to be the user and group we create
COPY --from=builder --chown=nodejs:nodejs /app/node_modules ./node_modules

COPY --chown=nodejs:nodejs . .

#switch to the non-root user
USER nodejs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

CMD [ "npm", "start" ]


