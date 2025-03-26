# LTC Base Images Repo

Checkout a branch to view the Dockerfiles

## Usage

1. Create a branch
1. Edit the `.cp-pipeline-ci.yml` file to build the specific base image
```
jobs:
  base-images-semantic-release:
    name: Base Image for Semantic Release
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GA_TOKEN }}
      - name: Run Dagger
        uses: dagger/dagger-for-github@8.0.0
        env:
          GITHUB_TOKEN: ${{ secrets.GA_TOKEN }}
        with:
          cloud-token: ${{ secrets.DAGGER_CLOUD_TOKEN }}
          args: publish --tag ${{ github.sha }}
```
3. Add a `Dockerfile` and other resources and commit
