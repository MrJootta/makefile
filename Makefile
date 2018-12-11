TARGET=file

build:
	env GOOS=linux go build -ldflags="-s -w" -o bin/$(TARGET) $(TARGET)/main.go
	upx --brute bin/$(TARGET)

dep:
	dep ensure -v

run:
	env GOOS=linux go build -ldflags="-s -w" -o bin/$(TARGET) $(TARGET)/main.go
	sls deploy function -f $(TARGET) && SLS_DEBUG=* serverless invoke -p data/$(DATA) -f $(TARGET)

clean:
	rm -rf ./bin ./vendor Gopkg.lock

.PHONY: deploy
deploy: clean dep build
	sls deploy --verbose