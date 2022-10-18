SHELL := /bin/bash

.PHONY: help install
.DEFAULT_GOAL := help
CCF_DIR=CCF

help: ## 💬 This help message :)
	@echo -e "\e[34m$@\e[0m" || true
	@grep -E '[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## 🔨 Install the CCF framework
	@echo -e "\e[34m$@\e[0m" || true
	@scripts/install.sh

test: ## 🔨 Test the JS
	@echo -e "\e[34m$@\e[0m" || true
	@scripts/test.sh