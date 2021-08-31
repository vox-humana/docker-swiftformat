#!/bin/bash

PROJECT_PATH=${1:-$pwd}
SWIFT_FORMAT_VERSION=$(cat swiftformat-version)
IMAGE_NAME=swift-format-$SWIFT_FORMAT_VERSION

docker run \
  --rm \
  -v "$PROJECT_PATH:/workdir" \
  --platform linux/amd64 \
  $IMAGE_NAME \
  swiftformat /workdir
