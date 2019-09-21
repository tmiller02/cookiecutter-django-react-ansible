#!/usr/bin/env bash

# A helper script to quickly ssh onto the controller VM in the 'provisioning' folder.
#
# This can be handy when you want to run the ansible manually, such as when doing a
# deploy to the production environment.

vagrant ssh controller -c "bash --init-file <(echo \". \"\$HOME/.bashrc\"; cd /vagrant/provisioning\")"
