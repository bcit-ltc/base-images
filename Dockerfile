# Extend the official codfish semantic-release action image
FROM ghcr.io/codfish/semantic-release-action:latest

# Ensure all packages are up-to-date to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

# Install git-lfs
RUN set -e; \
    apt-get install -y --no-install-recommends \
        git-lfs && \
    rm -rf /var/lib/apt/lists/* && git lfs install --system;
