# Unit tests with cache using docker

## Run unit tests without cache

```bash
docker run -it -v `pwd`:/go/src/github.com/josecordaz/unit_tests_go_cache unittest go test -v ./...
```

### Output:
```sh
docker build -t unittest .
Sending build context to Docker daemon  585.7kB
Step 1/3 : FROM golang:alpine
 ---> ccda0e5ccbfc
Step 2/3 : RUN apk add make dep git
 ---> Using cache
 ---> 21767b970e6a
Step 3/3 : WORKDIR $GOPATH/src/github.com/josecordaz/unit_tests_go_cache
 ---> Using cache
 ---> 821bb08c843a
Successfully built 821bb08c843a
Successfully tagged unittest:latest
docker run -it -v `pwd`:/go/src/github.com/josecordaz/unit_tests_go_cache unittest go test -v ./...
=== RUN   TestAdd
--- PASS: TestAdd (0.00s)
PASS
ok      github.com/josecordaz/unit_tests_go_cache       0.004s
```

**Test it with**
```bash
make test-no-cache
```

## Run unit tests persisting cache folder

```bash
docker run -it -v `pwd`:/go/src/github.com/josecordaz/unit_tests_go_cache -v `pwd`/.cache:/root/.cache unittest go test -v ./...
```

### Output:
```bash
docker build -t unittest .
Sending build context to Docker daemon  586.8kB
Step 1/3 : FROM golang:alpine
 ---> ccda0e5ccbfc
Step 2/3 : RUN apk add make dep git
 ---> Using cache
 ---> 21767b970e6a
Step 3/3 : WORKDIR $GOPATH/src/github.com/josecordaz/unit_tests_go_cache
 ---> Using cache
 ---> 821bb08c843a
Successfully built 821bb08c843a
Successfully tagged unittest:latest
docker run -it -v `pwd`:/go/src/github.com/josecordaz/unit_tests_go_cache -v `pwd`/.cache:/root/.cache unittest go test -v ./...
=== RUN   TestAdd
--- PASS: TestAdd (0.00s)
PASS
ok      github.com/josecordaz/unit_tests_go_cache       (cached)
```

### Result:
The message **(cached)** is shown in the output :D.

**Test it with**
```bash
make test-with-cache
```

Resources:

- https://medium.com/windmill-engineering/tips-tricks-for-making-your-golang-container-builds-10x-faster-4cc618a43827
