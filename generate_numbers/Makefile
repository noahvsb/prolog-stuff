TEST_FILES := $(wildcard test/*.test.pl)

.PHONY all: build test

build: build_primes

build_primes:
	swipl -o generate_numbers -c src/main.pl

test:
	@echo "Running tests"
	@for f in $(TEST_FILES); do \
		swipl -g true $$f; \
	done