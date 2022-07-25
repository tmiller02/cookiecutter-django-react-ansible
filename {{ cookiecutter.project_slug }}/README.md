# {{ cookiecutter.project_name }}

## Overview

{{ cookiecutter.project_overview }}

## Required Dependencies

* [Vagrant](https://www.vagrantup.com/)
* One of the following:  
  * [Docker](https://www.docker.com/)
  * [VirtualBox](https://www.virtualbox.org/)

## Optional Dependencies

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
