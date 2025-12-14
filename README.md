# semantic-release-image

Extended [`semantic-release-action` image](https://github.com/codfish/semantic-release-action) with `@semantic-release/github` plugin.

## Features

- Opinionated configuration:

  - Regular releases on `main` (and `master` for backwards compatability)
  - Releases on `next` if that distribution channel exists
  - Pre-releases on `beta`

## Included Plugins

- `@semantic-release/commit-analyzer`
- `@semantic-release/release-notes-generator`
- `@semantic-release/github`
