# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm ci --only=production

# Copier le code source
COPY . .

# Build de l'application
RUN npm run build

# Stage 2: Production avec Nginx
FROM nginx:alpine

# Créer un utilisateur non-root
RUN addgroup -g 1001 -S nginx-user && adduser -S nginx-user -u 1001

# Copier la config Nginx personnalisée
COPY nginx.conf /etc/nginx/nginx.conf

# Copier les fichiers build depuis le stage précédent
COPY --from=builder /app/build /usr/share/nginx/html

# Exposer le port
EXPOSE 80

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80 || exit 1

# Utiliser l'utilisateur non-root
USER nginx-user

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
