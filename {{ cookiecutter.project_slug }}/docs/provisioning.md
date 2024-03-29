# Provisioning

## Overview

This project uses [Ansible](https://docs.ansible.com/ansible/latest/index.html)
to provision code and [Vagrant](https://www.vagrantup.com) to manage VMs for
the dev environment.

All hosts are [Ubuntu 22.04 (Jammy Jellyfish)](https://releases.ubuntu.com/22.04/).

## Development Environment

The local development environment is a multi-VM configuration using Vagrant and the
[Ansible Local](https://www.vagrantup.com/docs/provisioning/ansible_local.html)
provisioner. These VMs are defined as follows:

* The **backend** VM has the 'backend' django app
* The **frontend** VM has the 'frontend' react app
* The **db** VM has the postgresql database
* The **provisioner** VM is used to run the ansible provisioning for the other
  two VMs. It is also where the 'frontend' app minified build is generated by
  npm during provisioning, and where the dev server for the 'frontend' app can
  be started.
  
The Vagrantfile has also been configured with some plugins to minimise manual
steps when setting up a dev environment. These are:
  
  * [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) for installing VirtualBox guest additions.
  * [vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf) for managing proxy settings.
  
### Provisioning the Dev Environment

To provision the development environment, run:
```
$ cd my_project
$ vagrant up --provision
```

You may need to re-run this command if Vagrant needed to install plugins.

## Production Environment

This project includes a sample production environment. All hosts that are added
to the inventory should be running [Ubuntu 22.04 (Jammy Jellyfish)](https://releases.ubuntu.com/22.04/). 
See the README at `provisioning/environments/prod/README.txt` for more.

You are strongly advised to use [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html),
and remember to never add sensitive information such as production passwords or
keys into version control in plain text!
  
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
$ vagrant ssh provisioner
$ source ~/provisioning_venv/bin/activate
[vagrant@provisioner provisioning]$ ansible-playbook playbook.yml --inventory environments/prod/inventory --user <myuser> --private-key <my-private-key>
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
