#!/usr/bin/env bash

podman compose exec --workdir=/opt/my_project_backend/current {{ cookiecutter.project_slug }}_backend bash