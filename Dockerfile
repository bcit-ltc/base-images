FROM node:20-alpine3.21

# Set the working directory
WORKDIR /usr/src/app

COPY .releaserc ./

RUN set -ex; \
        apk add git; \
        npm install -g semantic-release \
        @semantic-release/github \
        @semantic-release/exec; 