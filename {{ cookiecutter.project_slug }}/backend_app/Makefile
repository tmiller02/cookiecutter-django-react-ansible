
ACTIVATE_VENV=. venv/bin/activate

test:
	$(ACTIVATE_VENV) && coverage run --source='.' manage.py test
	$(ACTIVATE_VENV) && coverage html
	@echo Coverage html report written to coverage_html_report/index.html
	$(ACTIVATE_VENV) && coverage erase

format:
	$(ACTIVATE_VENV) && black --config pyproject.toml .

lint:
	$(ACTIVATE_VENV) && flake8 --config .flake8 .

safety_check:
	$(ACTIVATE_VENV) && safety check