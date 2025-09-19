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
jobs:
  get-version:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/bcit-ltc/semantic-release:latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Mark repo as safe for git
        run: |
          git config --global --add safe.directory "$GITHUB_WORKSPACE"
      - name: Run Semantic Release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: >
          semantic-release \
            --branches main \
            --tag-format "\${version}" \
            --plugins @semantic-release/commit-analyzer,@semantic-release/release-notes-generator,@semantic-release/github
```

This will run semantic-release with the included plugins and all configuration provided via CLI flags. No `.releaserc` file is required in your repository.


## License
Mozilla Public License 2.0 (MPL-2.0)


