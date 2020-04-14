docker:
	docker build -t unittest .

test-no-cache: docker
	docker run -it -v `pwd`:/go/src/github.com/josecordaz/unit_tests_go_cache unittest go test -v ./...

test-with-cache: docker
	docker run -it -v `pwd`:/go/src/github.com/josecordaz/unit_tests_go_cache -v `pwd`/.cache:/root/.cache unittest go test -v ./...
