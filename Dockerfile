FROM golang:alpine
RUN apk add make dep git
WORKDIR $GOPATH/src/github.com/josecordaz/unit_tests_go_cache