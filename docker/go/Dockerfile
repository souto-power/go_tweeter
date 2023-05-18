FROM golang:1.19.3-alpine
ENV GOPATH=

WORKDIR /go

ENV GO111MODULE=on

RUN apk update && apk add git
RUN go install github.com/cosmtrek/air@latest
# RUN go mod init \
# && go mod tidy \
# && go build


CMD ["air", "-c", ".air.toml"]