.ONESHELL:
.PHONY: runserver test format lint pip_audit type_check

runserver:
	. ~/.venvrc
	uvicorn \
		{{ cookiecutter.project_slug }}.asgi:application \
		--workers 1 \
		--host 0.0.0.0 \
		--port 4001 \
		--reload \
		--reload-exclude ".git, .idea, venv"

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
	ruff check .

pip_audit:
	. ~/.venvrc
	pip-audit

type_check:
	. ~/.venvrc
	mypy --config-file=pyproject.toml
