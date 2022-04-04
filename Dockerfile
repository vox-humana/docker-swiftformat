# syntax=docker/dockerfile:1

# latest(bionic) doesn't contain arm64
FROM swift:focal AS builder
ARG swift_format_version
RUN git clone --depth 1 --branch $swift_format_version https://github.com/nicklockwood/SwiftFormat.git \
  && cd SwiftFormat \
  && swift build -c release \
  && mv `swift build -c release --show-bin-path`/swiftformat /usr/bin \
  && cd .. \
  && rm -rf SwiftFormat

FROM swift:focal-slim AS runner
COPY --from=builder /usr/bin/swiftformat /usr/bin
ENTRYPOINT [ "swiftformat" ]
CMD ["."]
