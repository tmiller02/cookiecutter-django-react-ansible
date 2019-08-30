
ACTIVATE_VENV=. venv/bin/activate

test:
	$(ACTIVATE_VENV) && python manage.py test

format:
	$(ACTIVATE_VENV) && black --config pyproject.toml .

lint:
	$(ACTIVATE_VENV) && flake8 --config .flake8 .
