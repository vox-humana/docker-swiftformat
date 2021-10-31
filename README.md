Wraps [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) into [Docker image](https://hub.docker.com/r/semenyutin/swiftformat).

# Usage

By default, container runs `swiftformat .` so you need to provide the right path either by changing the working dir or as an argument.
Examples:
`docker run --rm -v local_source_dir:/work  semenyutin/swiftformat:latest /work`
`docker run --rm -v local_source_dir:/work -w /work semenyutin/swiftformat:latest`

To check installed SwiftFormat version:
`docker run --rm semenyutin/swiftformat:latest --version`

Linting:
`docker run --rm -v local_source_dir:/work semenyutin/swiftformat:latest /work --lint`


# ARM64 support
There are no official Swift images for arm64, therefore for linux/arm64 Dockerfile uses `swiftarm/swift` as base image.
[Nightly builds](swiftlang/swift:nightly-focal) already have arm64 support, so release stream might get this support as well soon. However, far nightly stream doesn't contain any slim image.
More links:
* https://forums.swift.org/t/arm64-swift-docker-images/43864/22
* https://github.com/apple/swift-docker/issues/225
* https://hub.docker.com/_/swift

# Building
`docker buildx build --build-arg swift_format_version=0.48.17 .`

## Multiplatform

Need to create build instance first (only once):
`docker buildx create --use`
`docker buildx build --build-arg swift_format_version=0.48.17 --platform linux/amd64,linux/arm64 -t semenyutin/swiftformat:0.48.17 .`
