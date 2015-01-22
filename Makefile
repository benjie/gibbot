
# Group targets
all: deps lint

# Install dependencies
deps:
	@echo "Installing dependencies..."
	@npm install

# Lint CoffeeScript
lint:
	@echo "Linting CoffeeScript..."
	@./node_modules/.bin/coffeelint \
		-f ./test/coffeelint.json \
    ./scripts/helpers/* \
		./scripts/*
