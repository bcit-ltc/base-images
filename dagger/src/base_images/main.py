import dagger
from typing import Annotated

from dagger import DefaultPath, dag, function, object_type


@object_type
class BaseImages:
    @function
    async def publish_semantic_release(self, source: Annotated[dagger.Directory, DefaultPath("./")]) -> str:
        """Publish the application container"""
        
        # Publish the image for each tag
        return await self.build(source).publish(
            f"ghcr.io/bcit-ltc/base-images-semantic-release:latest"
        )

    @function
    def build(
        self,
        source: Annotated[dagger.Directory, DefaultPath("/")],
    ) -> dagger.Container:
        """Build the application container"""
        build = (
            dag.container()
            .from_("node:20-alpine3.21")
            .with_exec(["apk", "add", "git"])
            .with_exec(["npm", "install", "-g", "semantic-release", "@semantic-release/github", "@semantic-release/exec"])
        )
        return build
    