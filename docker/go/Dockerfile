FROM golang:1.19.3-alpine
ENV GOPATH=

RUN apk update && apk add git

WORKDIR /go

RUN apk update && apk add git
# RUN go get github.com/gin-gonic/gin

# CMD ["go", "mod", "init", "go-test", "&&", "go", "get", "github.com/gin-gonic/gin", "&&" ,"go", "run", "main.go"]