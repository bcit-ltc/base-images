# Extend the official codfish semantic-release action image
FROM ghcr.io/codfish/semantic-release-action:latest

# Ensure all packages are up-to-date to reduce vulnerabilities
RUN set -e; \
    apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
        git-lfs && \
    rm -rf /var/lib/apt/lists/*

COPY .releaserc.json .releaserc.json
