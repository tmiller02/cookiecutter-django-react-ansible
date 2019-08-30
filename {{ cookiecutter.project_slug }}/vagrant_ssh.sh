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

if [ $# -eq 0 ]
  then
    vagrant ssh -c "sudo -iu {{ cookiecutter.project_slug }} bash --rcfile .venvrc -i";
  else
    vagrant ssh -c "sudo -iu {{ cookiecutter.project_slug }} bash -c '. ~/.venvrc && $*'";
fi
