FROM node:24.6.0-bullseye

# Ensure all packages are up-to-date to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y


RUN set -ex; \
        apt-get install -y --no-install-recommends \
                git-core \
                git-lfs \
                ca-certificates \
                curl \
                jq \
        ; \
        rm -rf /var/lib/apt/lists/*; \
        npm install -g semantic-release @semantic-release/commit-analyzer @semantic-release/release-notes-generator @semantic-release/github;

# Add semantic-release wrapper script
COPY semantic-release-wrapper.sh /usr/local/bin/semantic-release-wrapper.sh
RUN chmod +x /usr/local/bin/semantic-release-wrapper.sh
