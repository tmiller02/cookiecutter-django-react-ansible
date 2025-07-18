# Cookiecutter Django React Ansible

cookiecutter-django-react-ansible is a 
[cookiecutter](https://github.com/pydanny/cookiecutter) template for setting up
a Django 4.2 & React project with Ansible provisioning and some opinionated defaults.

## Key Features and Technologies
* Django 4.2
* Python 3.12
* React 18 using the [create-react-app](https://github.com/facebook/create-react-app) script
* TypeScript
* Ansible 11 for provisioning  
* Follows the [12-Factor methodology](https://12factor.net/)
* Sets up functional tests with [Selenium](https://selenium-python.readthedocs.io/) and Firefox
* Better python dependency management with [pip-tools](https://github.com/jazzband/pip-tools)
* Works on Linux, macOS and Windows host environments
* PostgreSQL 14
* NGINX web server set up with HTTP/2 support
* Ubuntu 24.04 (Jammy Jellyfish)
* [Certbot](https://certbot.eff.org/about/) / [Let's Encrypt](https://letsencrypt.org/)
  SSL certificates for production, auto-generated self-signed SSL certificates for development.
* Checks to python dependencies provided via [pip-audit](https://pypi.org/project/pip-audit/)
* Podman for the development environment

## Templating a Project

First, you'll need to make sure that you have cookiecutter installed:

```
$ pip install "cookiecutter>=1.6.0"
```

Next, run cookiecutter against this project:

```
$ git clone https://github.com/tmiller02/cookiecutter-django-react-ansible.git
$ cookiecutter cookiecutter-django-react-ansible
```

You'll be prompted for some values. Answer these prompts with your desired
options. Once you've provided these values, your project will be generated.

```
project_name [My Project]: My Project
project_slug [my_project]: my_project
```

Enter the project and take a look around:

```
$ cd my_project/
$ ls
```

Create a git repo and push it there:

```
$ git init
$ git add .
$ git commit -m "Initial commit"
$ git remote add origin git@github.com:<my-git-user>/<my-git-repo>.git
$ git push -u origin master
```
## Quickstart

To get up and running quickly, make sure you have the following requirements installed:
* [Podman](https://podman.io/)

First, navigate to the project's directory:
```
$ cd my_project/
```

Provision the Podman dev environment:

```
$ ./provision_dev_environment.sh
```

Once provisioning has finished, you can access the django app at https://localhost:4000.
You can access the react app at https://localhost:5000.

## Next Steps

Check out the documentation in `README.md` in your generated project for more
detailed instructions on getting started.