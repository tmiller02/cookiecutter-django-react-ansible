#!/usr/bin/env bash

# See https://create-react-app.dev/docs/advanced-configuration
# Adjust configuration as required when running on the controller VM.
CONTROLLER_HOSTNAME="{{ cookiecutter.controller_hostname }}"
if [ "$(uname -n)" = $CONTROLLER_HOSTNAME ]; then
  export HOST=$CONTROLLER_HOSTNAME
  export CHOKIDAR_USEPOLLING=true
fi
