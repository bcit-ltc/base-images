FROM node:14-buster-slim

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                git-core \
                ca-certificates \
        ; \
        npm install -g semantic-release @semantic-release/gitlab;

COPY .releaserc .releaserc