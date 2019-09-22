# Backend App

## Overview

The 'Backend App' uses the [Django web framework](https://www.djangoproject.com)
and follows the [twelve factor app](https://12factor.net) approach.

## Running the Django Dev Server

First let's make sure that the dev VMs are up and provisioned:

```
$ cd {{ cookiecutter.project_slug }}
$ vagrant up --provision
```

Next, we'll ssh onto the dev VM with our django project and activate the
virtualenv. We can use the `ssh_backend.sh` helper script to do this:

```
$ ./ssh_backend.sh 
```

Then we'll start the django dev server, binding to all IP addresses on port 8000:

```
(venv) [{{ cookiecutter.project_slug }}]$ python manage.py runserver 0:8000
```

Or alternatively, we can pass these arguments directly into the `ssh_backend.sh`
script to do this in a single step:

```
./ssh_backend.sh python manage.py runserver 0:8000
```

You can view pages being served by this dev server by going to
http://{{ cookiecutter.backend_app_dev_hostname }}:8000.

Note that the dev server url is **http** (not **https**) and is on port
**8000**. Make sure not to confuse this url with the https url, which is served
instead by NGINX and gunicorn. Unlike the django dev server, these will
**not** automatically reload after any code changes.

## Running Tests

Tests are set up to use the `unittest` framework (Django's default). The
backend app includes a `Makefile` with a command for running the tests with
coverage analysis:

```
$ ./ssh_backend.sh
(venv) [{{ cookiecutter.project_slug }}]$ make test
```

or to just run the tests:

```
$ ./ssh_backend.sh
(venv) [{{ cookiecutter.project_slug }}]$ python manage.py test
```

### Selenium X11 forwarding (Optional)

The tests have been set up so Selenium and Firefox may be used for any
browser-reliant tests.

The browser is set up to run in headless mode by default. However, if you
have an X11 server running on your host machine, you can change this to display
the browser window during the tests.

This requires an X11 server on your host machine, such as
[XQuartz](https://www.xquartz.org) for Mac or [Cygwin/X](https://x.cygwin.com)
for Windows.

To verify that X11 forwarding is working:

```
$ ./ssh_backend.sh
(venv) [{{ cookiecutter.project_slug }}]$ xeyes
```

If all is working as expected, you should see a new window with eyes appear.

To display Firefox, set the `SELENIUM_TESTS_RUN_HEADLESS` to `False` in
`settings.py`and re-run the tests:

```
(venv) [{{ cookiecutter.project_slug }}]$ make test
```

## Formatting and Linting
This project is set up with the [black](https://github.com/psf/black) code
formatter and [flake8](http://flake8.pycqa.org/en/latest/) for linting.

To run the `black` formatter:

```
$ ./ssh_backend.sh
(venv) [{{ cookiecutter.project_slug }}]$ make format
```

And to run `flake8`: 

```
(venv) [{{ cookiecutter.project_slug }}]$ make format
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

The django app is run as a systemd service (`{{ cookiecutter.project_slug }}.service`) with gunicorn which exposes the
application on localhost:8080. NGINX is configured as a reverse proxy for this
location. You can access the django app being served via NGINX by going to
http://{{ cookiecutter.backend_app_dev_hostname }} (note that you may need to
restart the systemd service to pick up any code changes.)

