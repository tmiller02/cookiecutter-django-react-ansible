#!/usr/bin/env bash

# See https://create-react-app.dev/docs/advanced-configuration
# Adjust configuration as required when running on the provisioner VM.
#
# Note that other variables are set using .env files, see
# https://create-react-app.dev/docs/adding-custom-environment-variables/#what-other-env-files-can-be-used
# as well as via regular environment variables in some PyCharm run configurations.

if [ "$(whoami)" = "vagrant" ]; then
  export HOST=0.0.0.0
  export PORT=5001
  export CHOKIDAR_USEPOLLING=true
fi
