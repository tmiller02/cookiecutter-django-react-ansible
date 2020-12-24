#!/usr/bin/env bash

# See https://create-react-app.dev/docs/advanced-configuration
# Adjust configuration as required when running on the provisioner VM.
#
# Note that other variables are set using .env files, see
# https://create-react-app.dev/docs/adding-custom-environment-variables/#what-other-env-files-can-be-used
# as well as via regular environment variables in some PyCharm run configurations.

PROVISIONER_HOSTNAME="{{ cookiecutter.provisioner_hostname }}"
if [ "$(uname -n)" = $PROVISIONER_HOSTNAME ]; then
  export HOST=$PROVISIONER_HOSTNAME
  export CHOKIDAR_USEPOLLING=true
fi
