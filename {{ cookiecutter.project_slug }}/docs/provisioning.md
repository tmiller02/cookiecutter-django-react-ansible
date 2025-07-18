# Provisioning

## Overview

This project uses [Ansible](https://docs.ansible.com/ansible/latest/index.html) for provisioning and [Podman](https://podman.io/) for container management in the development environment.

All hosts should run [Ubuntu 24.04 (Jammy Jellyfish)](https://releases.ubuntu.com/24.04/).

## Development Environment

The local development setup uses multiple containers managed by Podman and provisioned with Ansible:

- **backend**: Django backend app
- **frontend**: React frontend app
- **db**: PostgreSQL database
- **provisioner**: Runs Ansible provisioning, builds the frontend app, and can start the frontend dev server

### Provisioning the Dev Environment

To set up the development environment:

```
cd my_project
./provision_dev_environment.sh
```

## Production Environment

A sample production environment is included. All inventory hosts should run Ubuntu 24.04. See `provisioning/environments/prod/README.txt` for details.

Use [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html) for sensitive data, and never commit secrets to version control.

### Provisioning the Production Environment

The ansible includes a `deploy_check` role to encourage you to follow some best
practices when deploying this project. Before you run a deploy to the production
environment, you should ensure that:

* There are no uncommitted changes in your working directory
* You have added a git tag with the release version

If you haven't followed these steps, you will be prompted by the `deploy_check`
role when running the ansible playbook. This role will also prompt you to
confirm that the git tag it finds is what you expect.

The `ansible-playbook` command to deploy to production will vary depending on
how your production environment is configured. You may also need to update
`ansible.cfg` depending on the environment. For example, you may need to set
`host_key_checking = no` if using password authentication (although you're 
encouraged to use SSH keys instead).

An example for provisioning to the production environment using the
**provisioner** VM:

```
$ podman compose exec provisioner bash
$ source ~/provision_venv/bin/activate
$ ansible-playbook playbook.yml --inventory environments/prod/inventory --user <myuser> --private-key <my-private-key>
```

You can also run the ansible directly from your host machine if you desire:

```
# set up the virtualenv
$ python3 -m venv my_provisioning_venv
$ source my_provisioning_venv/bin/activate
(my_provisioning_venv) $ cd provisioning
(my_provisioning_venv) $ pip install -r requirements.txt
# install ansible galaxy roles:
(my_provisioning_venv) $ ansible-galaxy install -r requirements.yml
# run the deploy:
(my_provisioning_venv) $ ansible-playbook playbook.yml --inventory environments/prod/inventory --user <myuser> --private-key <my-private-key>
```

If you run the ansible directly from your host machine, you'll need to also install npm.
