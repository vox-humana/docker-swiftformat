FROM swift:latest as builder

ARG swift_format_version

RUN git clone --branch $swift_format_version https://github.com/nicklockwood/SwiftFormat.git \
  && cd SwiftFormat \
  && swift build -c release \
  && mv `swift build -c release --show-bin-path`/swiftformat /usr/bin \
  && cd .. \
  && rm -rf SwiftFormat

FROM swift:slim

COPY --from=builder /usr/bin/swiftformat /usr/bin

RUN swiftformat --version
CMD ["swiftformat", "."]
