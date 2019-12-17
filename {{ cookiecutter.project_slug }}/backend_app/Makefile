.ONESHELL:
.PHONY: test format lint safety_check
MAKEFILE_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
ACTIVATE_VENV = . venv/bin/activate

test:
	@cd $(MAKEFILE_DIR) && $(ACTIVATE_VENV)
	coverage run --rcfile=".coveragerc" manage.py test
	coverage html
	echo Coverage html report written to coverage_html_report/index.html
	coverage erase

format:
	cd $(MAKEFILE_DIR) && $(ACTIVATE_VENV)
	black --config pyproject.toml .

lint:
	cd $(MAKEFILE_DIR) && $(ACTIVATE_VENV)
	flake8 --config .flake8 .

safety_check:
	cd $(MAKEFILE_DIR) && $(ACTIVATE_VENV)
	safety check
