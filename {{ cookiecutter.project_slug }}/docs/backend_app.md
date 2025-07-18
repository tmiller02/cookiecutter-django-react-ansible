# Backend App

## Overview

The backend app uses the [Django web framework](https://www.djangoproject.com)
and follows the [twelve factor app](https://12factor.net) approach.

## Running the Django Dev Server

First let's make sure that the dev containers are up and provisioned:

```
$ cd {{ cookiecutter.project_slug }}
$ ./provision_dev_environment.sh
```

Next, we'll exec onto the backend container with our django project and activate the
virtualenv:

```
$ podman compose exec {{ cookiecutter.project_slug }}_backend bash
```

Then we'll start the uvicorn dev server, binding to all IP addresses on port 4001:

```
(venv) [{{ cookiecutter.project_slug }}]$ make runserver
```

You can view pages being served by this dev server by going to
http://localhost:4001.

Note that the dev server url is **http** (not **https**) and is on port
**4001**. Make sure not to confuse this url with the https url, which is served
instead by NGINX and gunicorn. Unlike the django dev server, the NGINX url will
**not** automatically reload after any code changes.

## Running Tests

Tests are set up to use the `unittest` framework (Django's default). The
backend app includes a `Makefile` with a command for running the tests with
coverage analysis:

```
$ podman compose exec {{ cookiecutter.project_slug }}_backend bash
(venv) [{{ cookiecutter.project_slug }}]$ make test
```

## Formatting and Linting

This project is set up with the [black](https://github.com/psf/black) code
formatter and [ruff](https://docs.astral.sh/ruff/) for linting.

To run the black formatter:

```
$ podman compose exec {{ cookiecutter.project_slug }}_backend bash
(venv) [{{ cookiecutter.project_slug }}]$ make format
```

And to run `ruff`: 

```
(venv) [{{ cookiecutter.project_slug }}]$ make lint
```

## Type Checking

To run type checking with [mypy](https://mypy.readthedocs.io/en/stable/introduction.html):

```
(venv) [{{ cookiecutter.project_slug }}]$ make type_check
```

## Updating Dependencies

This project uses [pip-tools](https://github.com/jazzband/pip-tools) to
manage dependencies. This allows us to compile a complete `requirements.txt`
manifest of all python dependencies from a simple list of top-level dependencies
defined in a `requirements.in` file.

To upgrade a top-level dependency, edit `requirements.in` and then run:

```
pip-compile --generate-hashes --output-file=requirements.txt requirements.in
```

To upgrade all packages whilst fulfilling the constraints in the `requirements.in`
file: 

```
pip-compile --generate-hashes --upgrade --output-file=requirements.txt requirements.in
```

## Django Settings

The Ansible provisioning adds a `settings.env` file which is then loaded via
[django-environ](https://github.com/joke2k/django-environ) in `settings.py`.

## Serving in Production

The django app is run as a systemd service
(`{{ cookiecutter.project_slug }}.service`) with gunicorn which exposes the 
application on localhost:8080. NGINX is configured as a reverse proxy for this
location. You can access the django app being served via NGINX by going to
https://localhost:4000 (note that you may need to
restart the systemd service to pick up any code changes.)
