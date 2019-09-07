#!/usr/bin/env bash

# A helper script to quickly ssh onto the dev VM as the correct user, in the
# backend app directory, with the virtualenv activated.
#
# Example usage:
#
#  To just ssh onto the VM from your host machine into an interactive shell:
#
#    $ ./vagrant_ssh.sh
#
#  To run the backend unit tests:
#
#    $ ./vagrant_ssh.sh make test
#
#  To enter the django shell:
#
#    $ ./vagrant_ssh.sh python manage.py shell
#
#  To start firefox via X11 forwarding (assuming you have a running X11 server):
#
#    $ ./vagrant_ssh.sh firefox
#

if [ $# -eq 0 ]
  then
    vagrant ssh -c "
      if test -f '/home/vagrant/.Xauthority'; then
        XAUTH_COOKIE=\$(xauth list | tail -n 1) &&
        sudo -u {{ cookiecutter.project_slug }} xauth add \$XAUTH_COOKIE
      fi
      sudo -i -u {{ cookiecutter.project_slug }} bash --rcfile .venvrc";
  else
    vagrant ssh -c "
      if test -f '/home/vagrant/.Xauthority; then
        XAUTH_COOKIE=\$(xauth list | tail -n 1) &&
        sudo -u {{ cookiecutter.project_slug }} xauth add \$XAUTH_COOKIE
      fi
      sudo -i -u {{ cookiecutter.project_slug }} bash -c '. ~/.venvrc && $*'
    ";
fi
