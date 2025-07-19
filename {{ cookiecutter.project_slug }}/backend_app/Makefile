.ONESHELL:
.PHONY: runserver test format lint pip_audit type_check

runserver:
	.venv/bin/uvicorn \
		{{ cookiecutter.project_slug }}.asgi:application \
		--workers 1 \
		--host 0.0.0.0 \
		--port 4001 \
		--reload \
		--reload-exclude ".git, .idea, venv"

test:
	.venv/bin/coverage run manage.py test
	TEST_EXIT_CODE=$$?;
	coverage html
	echo Coverage html report written to coverage_html_report/index.html
	coverage erase
	exit $$TEST_EXIT_CODE

format:
	.venv/bin/ruff format --config pyproject.toml .

lint:
	.venv/bin/ruff check --config pyproject.toml .

pip_audit:
	.venv/bin/pip-audit

type_check:
	.venv/bin/mypy --config-file=pyproject.toml
