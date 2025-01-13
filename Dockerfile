FROM node:20-alpine3.21

RUN set -ex; \
        npm install -g semantic-release @semantic-release/github @semantic-release/exec; 