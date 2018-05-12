# BUILD STATIC SITES (spa & web)

FROM node:8.11.1-alpine as builder

# Use node user from this ^ image
# We don't want bad things executing as Groot, I mean, root
USER node

# Need this because WORKDIR creates directories as root
RUN mkdir -p /tmp/app && mkdir -p /tmp/web

# Create app directory and step into it
# This doesn't honor the node user
WORKDIR /tmp/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY ./single-page-app/package*.json ./

RUN npm install

# Bundle app source
# COPY doesn't honor user either, but RUN does, which fails to build
# if user != node
COPY --chown=node ./single-page-app/ .

RUN npm run build

# ---- No web yet ----
# WORKDIR /tmp/web
# COPY ./web/package*.json ./

# RUN npm install

# # --chown=node because COPY uses root user by default and npm run build fails
# COPY --chown=node ./web/ .

# RUN npm run build

FROM nginx:1.13.12-alpine

WORKDIR /var/www/app

COPY --from=builder /tmp/app/dist/ /var/www/app/

# WORKDIR /var/www/app

# COPY --from=builder /tmp/web/dist/ /usr/share/nginx/html/

EXPOSE 80