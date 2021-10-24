#!/bin/bash

SWIFT_FORMAT_VERSION=$1

if [ -z "$SWIFT_FORMAT_VERSION" ]; then
    SWIFT_FORMAT_VERSION=$(
        curl --silent \
            -H "Accept: application/vnd.github.v3+json" \
            https://api.github.com/repos/nicklockwood/SwiftFormat/releases/latest |
            jq -r .tag_name
    )
fi

echo "Building with SwiftFormat:$SWIFT_FORMAT_VERSION..."

# There are no official Swift images for linux/arm64 platform
# https://hub.docker.com/_/swift
docker build \
    --platform linux/amd64 \
    --build-arg swift_format_version=$SWIFT_FORMAT_VERSION \
    -t semenyutin/swiftformat:$SWIFT_FORMAT_VERSION \
    .
