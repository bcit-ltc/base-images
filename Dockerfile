FROM node:14.18.1-alpine3.12

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                git-core \
                ca-certificates \
        ; \
        npm install -g semantic-release @semantic-release/gitlab;
