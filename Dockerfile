# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .

RUN mkdir -p build

RUN dart compile exe bin/server/server.dart -o build/server
RUN dart compile exe bin/scraper/scraper.dart -o build/scraper

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
# FROM scratch
FROM alpine:latest

COPY --from=build /runtime/ /
COPY --from=build /app/build/server /app/build/
# TODO will also need to copy from
COPY --from=build /app/build/scraper /app/build/

# Install necessary utilities
RUN apk add --no-cache bash

# it would be good to write this to some logs
# RUN mkdir -p /var/log
# RUN echo "* * * * * /app/build/scraper >> /var/log/scraper.log 2>&1" > /etc/crontabs/root

RUN echo '*  *  *  *  *   /app/build/scraper' >/etc/crontabs/root

# Start server.
EXPOSE 8080
CMD ["sh", "-c", "crond && /app/build/server"]
