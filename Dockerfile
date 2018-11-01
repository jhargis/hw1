# build stage
FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o goapp

# final stage
FROM alpine
RUN apk add --no-cache bash
WORKDIR /app
COPY --from=build-env /src/goapp /app/
CMD ./goapp
