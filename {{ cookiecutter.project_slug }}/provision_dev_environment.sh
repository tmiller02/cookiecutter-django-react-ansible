#!/usr/bin/env bash

set -eu

podman compose --file compose.yaml build
podman compose --file compose.yaml up --detach
podman compose --file compose.yaml exec --workdir /workdir/provisioning/ provisioner bash -c \
  "ANSIBLE_CONFIG=ansible_podman.cfg ~/provision_venv/bin/ansible-playbook --inventory=environments/dev/inventory playbook.yml"