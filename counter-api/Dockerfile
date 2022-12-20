FROM golang:alpine as builder
WORKDIR /build

COPY go.mod /build
COPY main.go /build

RUN go version && \
    go env && \
    go generate && \
    GO111MODULE=on go run github.com/GeertJohan/go.rice/rice embed-go && \
    GO111MODULE=on CGO_ENABLED=0 GOOS=linux go build

FROM alpine:latest

WORKDIR /opt
COPY --from=builder /build/counter-api /opt

EXPOSE 9002
ENV PORT 9002

ENTRYPOINT ["/opt/counter-api"]