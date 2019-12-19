#!/usr/bin/env bash

# A helper script to quickly ssh onto the dev VM as the correct user, in the
# backend app directory, with the virtualenv activated.
#
# Example usage:
#
#  To just ssh onto the VM from your host machine into an interactive shell:
#
#    $ ./ssh_backend.sh
#
#  To run the backend unit tests:
#
#    $ ./ssh_backend.sh make test
#
#  To enter the django shell:
#
#    $ ./ssh_backend.sh python manage.py shell
#
#  To start firefox via X11 forwarding (assuming you have a running X11 server):
#
#    $ ./ssh_backend.sh firefox
#
if [ "$OSTYPE" = "cygwin" ]; then
  if [ ! -f '/usr/bin/ssh' ]; then
    echo "ERROR: You do not appear to have the openssh cygwin package installed"
    exit 1
  fi
  export VAGRANT_PREFER_SYSTEM_BIN=1
fi

if [ $# -eq 0 ]
  then
    vagrant ssh -c "bash --rcfile .venvrc";
  else
    vagrant ssh -c "bash -c '. ~/.venvrc && $*'";
fi

