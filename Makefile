.PHONY: build clean deploy

build:
	export GO111MODULE=on
	env GOOS=linux go build -ldflags="-s -w" -o bin/image image/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/image-upload image-upload/main.go

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose

