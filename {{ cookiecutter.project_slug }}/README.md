# {{ cookiecutter.project_name }}

## Overview

{{ cookiecutter.project_overview }}

## Required Dependencies

* [Vagrant](https://www.vagrantup.com/)
* One of the following:  
  * [Docker](https://www.docker.com/)
  * [VirtualBox](https://www.virtualbox.org/)

## Optional Dependencies

* [Yarn](https://yarnpkg.com/en/)
* [Cygwin](https://www.cygwin.com) if you're using Windows. This will allow you
  to use the helper scripts such as `ssh_frontend.sh`.
* An X11 server such as [XQuartz](https://www.xquartz.org) for Mac or
  [Cygwin/X](https://x.cygwin.com) for Windows.

## Quickstart

First, navigate to the project's directory:

```
$ cd {{ cookiecutter.project_slug }}
```

This project has been configured to work with either VirtualBox or Docker
as part of the Vagrant provisioning process via 
[vagrant providers](https://www.vagrantup.com/docs/providers).

If you are using Docker, you'll need to build the base Docker image:

```
$ docker build -t {{ cookiecutter.project_slug}}_base_image .
```

Provision the Vagrant dev environment:

```
$ vagrant up --provision
```

You may need to re-run this command if Vagrant needed to install plugins.

Once provisioning has finished, you can access the django app at https://localhost:4000
and the frontend app at https://localhost:5000

## Next Steps

Read the following documentation for more information:

* [Backend App](docs/backend_app.md)
* [Frontend App](docs/frontend_app.md)
* [Provisioning](docs/provisioning.md)
* [Limitations and Warnings](docs/limitations_and_warnings.md)
* [Other Tools](docs/other_tools.md)
* [Configuring PyCharm](docs/configuring_pycharm.md)
