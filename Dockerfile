FROM swift:latest as builder

RUN apt-get update && apt-get install -y curl

ARG swift_format_version
ENV SWIFTFORMAT_ARCHIVE="https://github.com/nicklockwood/SwiftFormat/archive/${swift_format_version}.tar.gz"

# git clone crashes quemu on M1
RUN curl -LSs --fail -o swiftformat.tgz -- "${SWIFTFORMAT_ARCHIVE}" \
  && tar -xzf swiftformat.tgz \
  && mv "./SwiftFormat-${swift_format_version}" ./SwiftFormat \
  && cd SwiftFormat \
  && swift build -c release \
  && mv `swift build -c release --show-bin-path`/swiftformat /usr/bin \
  && cd .. \
  && rm -rf SwiftFormat

FROM swift:slim

COPY --from=builder /usr/bin/swiftformat /usr/bin

RUN swiftformat --version
CMD ["swiftformat", "."]
