FROM node:20-buster-slim

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                git-core \
                git-lfs \
                ca-certificates \
                curl \
                jq \
        ; \
        npm install -g semantic-release @semantic-release/gitlab @semantic-release/exec;
