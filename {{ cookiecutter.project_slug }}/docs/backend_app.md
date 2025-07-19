# Backend App

## Overview

The backend app is built with the [Django web framework](https://www.djangoproject.com) and follows the [Twelve-Factor App](https://12factor.net) methodology for modern, maintainable web applications.

## Running the Django Development Server

To start the development environment, first ensure the containers are up and provisioned:

```
cd {{ cookiecutter.project_slug }}
./provision_dev_environment.sh
```

Next, access the backend container and activate the virtual environment:

```
podman compose exec {{ cookiecutter.project_slug }}_backend bash
```

Start the Django development server using Uvicorn, binding to all IP addresses on port 4001:

```
(venv) [{{ cookiecutter.project_slug }}]$ make runserver
```

Visit http://localhost:4001 to view the app. Note: The dev server uses **http** on port **4001**. This is different from the production server, which uses **https** and is served by NGINX and Gunicorn. The dev server automatically reloads on code changes, while the production server does not.

## Running Tests

Tests use Django's default `unittest` framework. Run tests with coverage analysis using the provided Makefile:

```
podman compose exec {{ cookiecutter.project_slug }}_backend bash
(venv) [{{ cookiecutter.project_slug }}]$ make test
```

## Formatting and Linting

Code formatting is handled by [black](https://github.com/psf/black), and linting by [ruff](https://docs.astral.sh/ruff/):

To format code:

```
podman compose exec {{ cookiecutter.project_slug }}_backend bash
(venv) [{{ cookiecutter.project_slug }}]$ make format
```

To lint code:

```
(venv) [{{ cookiecutter.project_slug }}]$ make lint
```

## Type Checking

Type checking is performed with [mypy](https://mypy.readthedocs.io/en/stable/introduction.html):

```
(venv) [{{ cookiecutter.project_slug }}]$ make type_check
```

## Managing Dependencies

Dependencies are managed with [pip-tools](https://github.com/jazzband/pip-tools). This tool compiles a complete `requirements.txt` from a list of top-level dependencies in `requirements.in`.

To upgrade a specific dependency, edit `requirements.in` and run:

```
pip-compile --generate-hashes --output-file=requirements.txt requirements.in
```

To upgrade all packages according to `requirements.in` constraints:

```
pip-compile --generate-hashes --upgrade --output-file=requirements.txt requirements.in
```

## Django Settings

Ansible provisioning creates a `settings.env` file, which is loaded by [django-environ](https://github.com/joke2k/django-environ) in `settings.py`.

## Production Deployment

In production, the Django app runs as a systemd service (`{{ cookiecutter.project_slug }}.service`) using Gunicorn, exposing the app on localhost:8080. NGINX acts as a reverse proxy, serving the app at https://localhost:4000. Restart the systemd service to apply code changes in production.
