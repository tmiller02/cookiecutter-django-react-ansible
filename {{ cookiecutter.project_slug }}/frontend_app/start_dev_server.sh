#!/usr/bin/env bash

export REACT_APP_BACKEND_URL="https://{{ cookiecutter.backend_app_hostname }}"

# See https://create-react-app.dev/docs/advanced-configuration
# Adjust configuration as required when running the frontend app dev server from
# the controller VM.

CONTROLLER_HOSTNAME="{{ cookiecutter.controller_hostname }}"
if [ "$(uname -n)" = $CONTROLLER_HOSTNAME ]; then
  export HOST=$CONTROLLER_HOSTNAME
  export CHOKIDAR_USEPOLLING=true
fi

yarn run start
