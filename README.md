# Cookiecutter Django React Ansible

cookiecutter-django-react-ansible is a 
[cookiecutter](https://github.com/pydanny/cookiecutter) template for quickly setting up a Django 5.2 & React project with Ansible provisioning and sensible defaults.

## Key Features and Technologies
* Django 5.2 with Python 3.12
* React 19 powered by [Vite](https://vite.dev/) and TypeScript
* Ansible 11 for automated provisioning
* Adheres to the [12-Factor methodology](https://12factor.net/)
* Functional testing with [Selenium](https://selenium-python.readthedocs.io/) and Firefox
* Robust Python dependency management via [pip-tools](https://github.com/jazzband/pip-tools)
* Compatible with Linux, macOS, and Windows hosts
* PostgreSQL 16 database
* NGINX web server with HTTP/2 support
* Ubuntu 24.04 (Jammy Jellyfish) base
* [Certbot](https://certbot.eff.org/about/) / [Let's Encrypt](https://letsencrypt.org/) SSL certificates for production, and auto-generated self-signed SSL certificates for development
* Python dependency security checks with [pip-audit](https://pypi.org/project/pip-audit/)
* Podman for containerized development environments

## Getting Started

First, ensure you have cookiecutter installed:

```
$ pip install "cookiecutter>=1.6.0"
```

Next, clone this repository and generate your project:

```
$ git clone https://github.com/tmiller02/cookiecutter-django-react-ansible.git
$ cookiecutter cookiecutter-django-react-ansible
```

You'll be prompted for project details. Enter your desired values:

```
project_name [My Project]: My Project
project_slug [my_project]: my_project
```

Navigate into your new project directory:

```
$ cd my_project/
$ ls
```

Initialize a git repository and push to your remote:

```
$ git init
$ git add .
$ git commit -m "Initial commit"
$ git remote add origin git@github.com:<your-github-username>/<your-repo>.git
$ git push -u origin master
```

## Quickstart

To get started quickly, install the following requirement:
* [Podman](https://podman.io/)

Navigate to your project directory:
```
$ cd my_project/
```

Provision the Podman development environment:

```
$ ./provision_dev_environment.sh
```

After provisioning, access the Django app at https://localhost:4000 and the React app at https://localhost:5000.

## Next Steps

Refer to the `README.md` in your generated project for more detailed setup and usage instructions.