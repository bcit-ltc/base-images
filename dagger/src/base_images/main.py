import dagger
from typing import Annotated

from dagger import DefaultPath, dag, function, object_type


@object_type
class BaseImages:
    #publish Image
    @function
    async def publish(self, source: Annotated[dagger.Directory, DefaultPath("./")]) -> str:
        """Publish the application container"""
    
        return await self.build(source).publish(
            f"ghcr.io/bcit-ltc/base-images-semantic-release:latest"
        )

    # using a Dockerfile to build and return a container
    @function
    def build(
        self,
        src: Annotated[
            dagger.Directory,
            DefaultPath("./")
        ],
    ) -> dagger.Container:
        """Build and image from existing Dockerfile"""
        return src.docker_build()