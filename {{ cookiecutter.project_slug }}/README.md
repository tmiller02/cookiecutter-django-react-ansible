# Cookiecutter Django Ansible Jumpstart

`cookiecutter-django-ansible-jumpstart` is a 
[cookiecutter](https://github.com/pydanny/cookiecutter) template for setting up
a Django 2.2 project with Ansible provisioning and some opinionated defaults.

## Key Features and Technologies
* Django 2.2
* Python 3.6
* Follows the [12-Factor methodology](https://12factor.net/)
* Sets up functional tests with [Selenium](https://selenium-python.readthedocs.io/),
  Firefox and optional X11 forwarding
* Better python dependency management with [pip-tools](https://github.com/jazzband/pip-tools)
* Works on Linux, macOS and Windows host environments
* Ansible 2.8 for provisioning
* PostgreSQL 11.5
* NGINX web server
* CentOS 7
* [Certbot](https://certbot.eff.org/about/) / [Let's Encrypt](https://letsencrypt.org/)
  SSL certificates for production, auto-generated self-signed SSL certificates for development.
* Checks to python dependencies provided via [pyup.io](https://pyup.io/)
* Vagrant for the development environment
* Comes with a Jenkinsfile for your CI / CD pipelines

## Templating a Project

First, you'll need to make sure that you have `cookiecutter` installed:

```
$ pip install "cookiecutter>=1.6.0"
```

Next, run cookiecutter against this project:

```
$ cookiecutter cookiecutter-django-ansible-jumpstart
```

You'll be prompted for some values. Answer these prompts with your desired
options. Once you've provided these values, your project will be generated.

```
project_name [My Project]: My Project
project_slug [my_project]: my_project
dev_vm_hostname [my-project.localhost]: my-project.localhost
db_vm_hostname [db.my-project.localhost]: db.my-project.localhost
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
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

To provision the development environment, run:
```
$ cd my_project
$ vagrant up --provision
```
    
Once provisioning has finished, you can access the dev VM at the hostname you
set for the `dev_vm_hostname` option, eg https://my-project.localhost.

## Next Steps

Check out the documentation in `README.md` in your generated project for more
detailed instructions on getting started.