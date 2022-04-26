FROM golang:1.18-alpine AS builder
RUN apk add --no-cache git gcc musl-dev
ADD . /src
WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux go install -installsuffix cgo main.go

FROM alpine:3.14
COPY --from=builder /go/bin/main /app
RUN mkdir /web
COPY web/* /web
ENTRYPOINT ["/app"]
