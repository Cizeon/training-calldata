FORGE=forge
ANVIL=anvil
CAST=cast

.PHONY: coverage clean test deploy
include .env

all:
	- $(FORGE) build

chain:
	- $(ANVIL)

deploy:
	- $(FORGE) create src/Calldata.sol:Calldata --private-key $(PRIVATE_KEY) --rpc-url local

test:
	- $(FORGE) test

coverage:
	- rm -rf coverage && mkdir coverage
	- $(FORGE) coverage --report lcov && genhtml lcov.info --branch-coverage --output-dir coverage

clean:
	- rm -rf broadcast coverage lcov.info .git
	- $(FORGE) clean