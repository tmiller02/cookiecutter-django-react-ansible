# Load Testing

## Overview

This project comes with a sample locustfile for running [Locust](https://locust.io/), a
popular event-based load testing tool. Locust can be used to figure out how many 
concurrent users a system can handle, and can help identify bottlenecks in your
application.

## Getting Started

First let's create a virtualenv to install the locust python packages:

```
$ mkdir ~/Virtualenvs
$ python3 -m venv ~/Virtualenvs/load_testing
$ source ~/Virtualenvs/load_testing/bin/activate
(load_testing)$ cd other_tools/load_testing/
(load_testing)$ pip install -r requirements.txt
```

Don't forget that running django with `DEBUG=True` incurs a substantial performance
impact. For this quick test we'll set `DEBUG=False` in the backend_app/settings.env
file and restart the gunicorn workers by running
`sudo systemctl restart {{ cookiecutter.project_slug }}` on the 'dev' VM.

Then we'll start locust pointing to our dev environment:

```
LOCUST_HOST=https://{{ cookiecutter.backend_app_dev_hostname }} locust -f locustfile.py
```

And you can start using locust at http://localhost:8089

## Next Steps

This sample locustfile is very simple, it just makes GET requests to the admin url of the
django application. As you develop your application you should update the locustfile
with more advanced tasksets that represent the real world usage patterns of your
application. See the [locust docs](https://docs.locust.io/en/stable/) for more.