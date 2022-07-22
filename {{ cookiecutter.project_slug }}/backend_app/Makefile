.ONESHELL:
.PHONY: test format lint safety_check type_check

test:
	. ~/.venvrc
	# Ubuntu 22.04 has firefox as a snap package, we need to run with a tmpdir
	# that both geckodriver and firefox have access to, see
	# https://github.com/mozilla/geckodriver/releases/tag/v0.31.0
	mkdir -p ~/tmp
	TMPDIR=${HOME}/tmp coverage run manage.py test
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

type_check:
	. ~/.venvrc
	mypy --config-file=pyproject.toml
