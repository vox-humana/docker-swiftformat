[![Build and Publish](https://github.com/vox-humana/docker-swiftformat/actions/workflows/build.yml/badge.svg)](https://github.com/vox-humana/docker-swiftformat/actions/workflows/build.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/semenyutin/swiftformat)](https://hub.docker.com/r/semenyutin/swiftformat/tags)


# ⚠️ Deprecated, please switch to [the offical SwiftFormat image](https://github.com/nicklockwood/SwiftFormat#docker)


Wraps [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) into a Docker image.

# Usage

By default, the container runs `swiftformat .` Therefore, you need to provide right path either by changing the working dir or as an argument.

Examples:

`docker run --rm -v local_source_dir:/work semenyutin/swiftformat:latest /work`

`docker run --rm -v local_source_dir:/work -w /work semenyutin/swiftformat:latest`

To check installed SwiftFormat version:

`docker run --rm semenyutin/swiftformat:latest --version`

Linting:

`docker run --rm -v local_source_dir:/work semenyutin/swiftformat:latest /work --lint`


# Building
`docker buildx build --build-arg swift_format_version=0.48.17 .`

## Multiplatform

Need to create build instance first (only once):

`docker buildx create --use`

```
docker buildx build \
--build-arg swift_format_version=0.48.17 \
--platform linux/amd64,linux/arm64 \
-t semenyutin/swiftformat:0.48.17 .
```
