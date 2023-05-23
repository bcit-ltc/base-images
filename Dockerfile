FROM node:20-buster-slim

COPY release.json .

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
                git-core \
                ca-certificates \
                curl \
                jq \
        ; \
        npm install -g semantic-release @semantic-release/commit-analyzer @semantic-release/gitlab @semantic-release/exec;
