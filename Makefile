# Variables
BINARY_NAME := wallet
BUILD_DIR := build
SRC_DIR := cmd/app

# Build the Go binary
build: clean
	@mkdir -p $(BUILD_DIR)
	@go build -o $(BUILD_DIR)/$(BINARY_NAME) $(SRC_DIR)/main.go

# Clean build artifacts
clean:
	@rm -rf $(BUILD_DIR)

# Build and run the Docker container
docker-build:
	@docker build -t $(BINARY_NAME) .

docker-run:
	@docker run -it $(BINARY_NAME)

run: build
	@./${BUILD_DIR}/${BINARY_NAME}

test:
	@go test ./...

test_coverage:
	@go test ./... -coverprofile=coverage.out

dep:
	@go mod download

vet:
	@go vet

lint:
	@golangci-lint run --enable-all
