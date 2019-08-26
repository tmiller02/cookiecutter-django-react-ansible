#!/usr/bin/env bash

activateCommand='/bin/bash --init-file <(echo ". \"$HOME/.bashrc\"; cd /opt/{{ cookiecutter.project_slug }}_backend/current; source venv/bin/activate")'
vagrant ssh -c "sudo -iu {{ cookiecutter.project_slug }} /bin/bash -c '$activateCommand'"
