#!/bin/bash

SWIFT_FORMAT_VERSION=$(cat swiftformat-version)

# Seems that there are no official Swift images for linux/arm64 platform
# https://hub.docker.com/_/swift
docker build \
--platform linux/amd64 \
--build-arg swift_format_version=$SWIFT_FORMAT_VERSION \
-t swift-format-$SWIFT_FORMAT_VERSION \
.
