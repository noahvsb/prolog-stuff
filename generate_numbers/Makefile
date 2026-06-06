TEST_FILES := $(wildcard test/*.test.pl)

.PHONY all: build test

build:
	swipl -o primes -c src/main.pl

test:
	@echo "Running tests"
	@for f in $(TEST_FILES); do \
		swipl -g true $$f; \
	done