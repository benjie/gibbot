
# Group targets
all: deps lint

# Install dependencies
deps:
	@echo "Installing dependencies..."
	@npm install

# Lint CoffeeScript
lint:
	@echo "Linting CoffeeScript..."
	@npm run lint
