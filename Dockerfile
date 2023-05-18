FROM node:alpine

WORKDIR /app

COPY release.json .

RUN set -ex; \
        apk add git; \
        npm install -g semantic-release; \
        npm init --force --yes; \
        npm install     @semantic-release/commit-analyzer \
                        @semantic-release/exec            \
                        @semantic-release/gitlab;
