#!/usr/bin/env bash

# See https://create-react-app.dev/docs/advanced-configuration
# Adjust configuration as required when running on the controller VM.
#
# Note that other variables are set using .env files, see
# https://create-react-app.dev/docs/adding-custom-environment-variables/#what-other-env-files-can-be-used
# as well as via regular environment variables in some PyCharm run configurations.

CONTROLLER_HOSTNAME="{{ cookiecutter.controller_hostname }}"
if [ "$(uname -n)" = $CONTROLLER_HOSTNAME ]; then
  export HOST=$CONTROLLER_HOSTNAME
  export CHOKIDAR_USEPOLLING=true
fi
