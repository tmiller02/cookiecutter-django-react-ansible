# {{ cookiecutter.project_name }}

## Overview

{{ cookiecutter.project_overview }}

## Required Dependencies

* [Podman](https://podman.io/)

## Quickstart

First, navigate to the project's directory:

```
$ cd {{ cookiecutter.project_slug }}
```

Provision the Vagrant dev environment:

```
$ ./provision_dev_environment.sh
```

Once provisioning has finished, you can access the django app at https://localhost:4000
and the frontend app at https://localhost:5000

## Next Steps

Read the following documentation for more information:

* [Backend App](docs/backend_app.md)
* [Frontend App](docs/frontend_app.md)
* [Provisioning](docs/provisioning.md)
* [Limitations and Warnings](docs/limitations_and_warnings.md)
* [Other Tools](docs/other_tools.md)
