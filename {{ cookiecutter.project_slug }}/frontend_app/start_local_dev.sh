#!/usr/bin/env bash

export REACT_APP_BACKEND_URL="https://{{ cookiecutter.backend_app_hostname }}"
yarn run start
