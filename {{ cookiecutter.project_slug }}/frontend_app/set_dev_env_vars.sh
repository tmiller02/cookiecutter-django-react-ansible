#!/usr/bin/env bash

# Set the default value for the backend url environment variable to point to
# the backend app in the 'dev' environment being served by Nginx. You can
# override this by setting the REACT_APP_BACKEND_URL environment variable.
REACT_APP_BACKEND_URL=${REACT_APP_BACKEND_URL:-"https://{{ cookiecutter.backend_app_dev_hostname }}"}
export REACT_APP_BACKEND_URL

# See https://create-react-app.dev/docs/advanced-configuration
# Adjust configuration as required when running on the controller VM.
CONTROLLER_HOSTNAME="{{ cookiecutter.controller_hostname }}"
if [ "$(uname -n)" = $CONTROLLER_HOSTNAME ]; then
  export HOST=$CONTROLLER_HOSTNAME
  export CHOKIDAR_USEPOLLING=true
fi
