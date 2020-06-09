.ONESHELL:
.PHONY: test format lint safety_check

test:
	. ~/.venvrc
	coverage run manage.py test
	TEST_EXIT_CODE=$$?;
	coverage html
	echo Coverage html report written to coverage_html_report/index.html
	coverage erase
	exit $$TEST_EXIT_CODE

format:
	. ~/.venvrc
	black --config pyproject.toml .

lint:
	. ~/.venvrc
	flake8 --config .flake8 .

safety_check:
	. ~/.venvrc
	safety check
