#!/usr/bin/env bash

# A helper script to quickly ssh onto the controller VM in the 'frontend_app' folder.
#
# This can be handy if you want to run the frontend app dev server from within the
# controller VM.

vagrant ssh controller -c "bash --init-file <(echo \". \"\$HOME/.bashrc\"; cd /vagrant/frontend_app\")"
