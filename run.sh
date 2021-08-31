#!/bin/bash

PROJECT_PATH=${1:-$pwd}
SWIFT_FORMAT_VERSION=$(cat swiftformat-version)
IMAGE_NAME=semenyutin/swiftformat:$SWIFT_FORMAT_VERSION

docker run \
  --rm \
  --platform linux/amd64 \
  -v "$PROJECT_PATH":"$(pwd)" \
  -w "$(pwd)" \
  "$IMAGE_NAME" \
#  swiftformat .
