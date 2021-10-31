# syntax=docker/dockerfile:1

FROM swift:latest AS builder-amd64
FROM swiftarm/swift:latest AS builder-arm64

FROM builder-${TARGETARCH} AS builder
ARG swift_format_version
RUN git clone --depth 1 --branch $swift_format_version https://github.com/nicklockwood/SwiftFormat.git \
  && cd SwiftFormat \
  && swift build -c release \
  && mv `swift build -c release --show-bin-path`/swiftformat /usr/bin \
  && cd .. \
  && rm -rf SwiftFormat

FROM swift:slim AS runner-amd64
COPY --from=builder /usr/bin/swiftformat /usr/bin

FROM builder-arm64 as runner-arm64

FROM runner-${TARGETARCH}
ENTRYPOINT [ "swiftformat" ]
CMD ["."]
