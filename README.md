# LTC Images Repo

Checkout a branch to view the Dockerfiles

## Usage

1. Create a branch
1. Copy this code into a `.gitab-ci.yaml` file
```
variables:
  KANIKO_CACHE_ARGS: "--cache=true --cache-copy-layers=true --cache-ttl=24h"

build:
  stage: build
  image:
    name: gcr.io/kaniko-project/executor:debug
    entrypoint: [""]
  script:
    - mkdir -p /kaniko/.docker
    - echo "{\"auths\":{\"$CI_REGISTRY\":{\"auth\":\"$(echo -n ${CI_REGISTRY_USER}:${CI_REGISTRY_PASSWORD} | base64)\"}}}" > /kaniko/.docker/config.json
    - |
      /kaniko/executor \
        --context $CI_PROJECT_DIR $KANIKO_CACHE_ARGS \
        --dockerfile $CI_PROJECT_DIR/Dockerfile \
        --destination $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_SLUG:latest
tags:
    - production
```
3. Add a `Dockerfile` and other resources and commit
