.ONESHELL:
.PHONY:
	help, install-deps

help: ## Display help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install-deps: $(eval SHELL:=/bin/bash) ## Install project depdendencies
	brew bundle --file=Brewfile

copy-envs: ## Copy envs from .env.example
	cp .env.example .env
	cp .envrc.example .envrc
	