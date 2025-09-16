# semantic-release-image

Basic node image with `semantic-release` and `@semantic-release/github` plugin installed

## Features
- Built-in support for [Git LFS](https://git-lfs.github.com/) (Large File Storage)
- Pre-installed essential semantic-release plugins

## Included Plugins
- `@semantic-release/commit-analyzer`
- `@semantic-release/release-notes-generator`
- `@semantic-release/github`

## Usage

### GitHub Actions Example
```yaml
- name: Run Semantic Release
  uses: docker://ghcr.io/bcit-ltc/semantic-release:latest
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

This will run semantic-release with the included plugins. No additional configuration is required unless you need custom plugins or settings.

## Manual Building and Pushing to GHCR

1. Authenticate to GitHub Container Registry:
   ```
    export GITHUB_TOKEN=my_github_token
    echo $GITHUB_TOKEN | docker login ghcr.io -u your_username --password-stdin
   ```
   - Replace `your_username` with your GitHub username.
   - Replace `my_github_token` with a [Personal Access Token](https://github.com/settings/tokens) that has `write:packages` and `read:packages` scopes.

2. Build and push the Docker image:
    ```
    docker build -t ghcr.io/bcit-ltc/semantic-release:v1.x.x .
    docker push ghcr.io/bcit-ltc/semantic-release:v1.x.x
    ```

## License
Mozilla Public License 2.0 (MPL-2.0)
