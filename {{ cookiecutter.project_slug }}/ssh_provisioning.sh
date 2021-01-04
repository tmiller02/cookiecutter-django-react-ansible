#!/usr/bin/env bash

# A helper script to quickly ssh onto the provisioner VM in the 'provisioning' folder.
#
# This can be handy when you want to run the ansible manually, such as when doing a
# deploy to the production environment.

if [ "$OSTYPE" = "cygwin" ]; then
  if [ ! -f '/usr/bin/ssh' ]; then
    echo "ERROR: You do not appear to have the openssh cygwin package installed"
    exit 1
  fi
  export VAGRANT_PREFER_SYSTEM_BIN=1
fi

vagrant ssh provisioner -c "bash --init-file <(echo \". \"\$HOME/.bashrc\"; . \"\$HOME/provision_venv/bin/activate\"; cd /vagrant/provisioning\")"
