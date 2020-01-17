.ONESHELL:
.PHONY: test format lint safety_check

test:
	. ~/.venvrc
	coverage run manage.py test
	coverage html
	echo Coverage html report written to coverage_html_report/index.html
	coverage erase

format:
	. ~/.venvrc
	black --config pyproject.toml .

lint:
	. ~/.venvrc
	flake8 --config .flake8 .

safety_check:
	. ~/.venvrc
	safety check
