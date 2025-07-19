# Other Tools

## Load Testing

### Overview

The [load_testing](../other_tools/load_testing) directory contains a sample locustfile for [Locust](https://locust.io/), a popular event-based load testing tool. Locust helps determine how many concurrent users your system can handle and identify performance bottlenecks.

### Getting Started

Create a virtual environment and install Locust dependencies:

```
mkdir ~/Virtualenvs
python3 -m venv ~/Virtualenvs/load_testing
source ~/Virtualenvs/load_testing/bin/activate
cd other_tools/load_testing/
pip install -r requirements.txt
```

For accurate results, set `DEBUG=False` in `backend_app/settings.env` and restart Gunicorn:

```
sudo systemctl restart {{ cookiecutter.project_slug }}
```

Start Locust targeting your dev environment:

```
LOCUST_HOST=https://localhost:4000 locust -f locustfile.py
```

Access the Locust web UI at http://localhost:8089.

### Next Steps

The sample locustfile only makes GET requests to the Django admin URL. As your app evolves, update the locustfile with more realistic task sets. See the [Locust documentation](https://docs.locust.io/en/stable/) for details.

## Testssl

### Overview

The [testssl_dev.sh](../other_tools/testssl_dev.sh) script tests TLS/SSL configuration in the 'dev' environment using [testssl.sh](https://github.com/drwetter/testssl.sh/).
