![Build](https://github.com/vox-humana/docker-swiftformat/workflows/Docker%20Hub%20Publishing/badge.svg)

Wraps [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) into [Docker image](https://hub.docker.com/r/semenyutin/swiftformat).

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
