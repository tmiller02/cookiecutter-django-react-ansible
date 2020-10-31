#!/usr/bin/env bash

# A helper script to quickly ssh onto the provisioner VM in the 'frontend_app' folder.
#
# This can be handy if you want to run the frontend app dev server from within the
# provisioner VM.

if [ "$OSTYPE" = "cygwin" ]; then
  if [ ! -f '/usr/bin/ssh' ]; then
    echo "ERROR: You do not appear to have the openssh cygwin package installed"
    exit 1
  fi
  export VAGRANT_PREFER_SYSTEM_BIN=1
fi

vagrant ssh provisioner -c "bash --init-file <(echo \". \"\$HOME/.bashrc\"; cd /vagrant/frontend_app\")"
