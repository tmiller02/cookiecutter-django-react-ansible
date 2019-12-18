# Provisioning

## Overview

This project uses [Ansible](https://docs.ansible.com/ansible/latest/index.html)
to provision code and [Vagrant](https://www.vagrantup.com) to manage VMs for
the dev environment.

All hosts are [CentOS 8](https://www.centos.org).

## Dev Environment

The 'dev' environment is a multi-VM configuration using Vagrant and the
[Ansible Local](https://www.vagrantup.com/docs/provisioning/ansible_local.html)
provisioner. These VMs are defined as follows:

* The `dev` VM has both the 'frontend' and 'backend' apps provisioned
* The `db` VM has the postgresql database
* The `controller` VM is used to run the ansible provisioning for the other
  two VMs. It is also where the 'frontend' app is built during provisioning.
  
The Vagrantfile has also been configured with some plugins to minimise manual
steps when setting up a dev environment. These are:
  
  * `vagrant-vbguest` for installing VirtualBox guest additions.
  * `vagrant-hostmanager` for updating the `/etc/hosts` files on the host
    and guest machines.
  * `vagrant-proxyconf` for managing proxy settings.
  
### Provisioning the Dev Environment

To provision the development environment, run:
```
$ cd my_project
$ vagrant up --provision
```

You may need to re-run this command if Vagrant needed to install plugins.

You may also be prompted for a password if the `vagrant-hostmanager` plugin is
making changes to the `/etc/hosts` file on your host machine.

> **WARNING**: Never edit a sudoers file with a regular text editor!  Always use the visudo command instead!

You can avoid being prompted for a password by 
[configuring passwordless sudo](https://github.com/devopsgroup-io/vagrant-hostmanager#passwordless-sudo)
for the command used by this plugin. Make sure you use `visudo` to edit this 
sudoers file to ensure you don't leave the sudoers configuration in a broken state.

## Production Environment

This project includes a sample production environment. All hosts that are added
to the inventory should be running CentOS 8. See the README at
`provisioning/prod/README.txt` for more.

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
`controller` VM:

```
$ ./ssh_provisioning.sh
[vagrant@controller provisioning]$ ansible-playbook playbook.yml --inventory environments/prod/inventory --user <myuser> --private-key <my-private-key>
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

If you run the ansible directly from your host machine, you'll need to also install yarn.

## Limitations and Warnings

### Security

This project comes with some basic security configuration such as `selinux` and
a firewall with `firewalld`, but remember that the security of your servers
is YOUR responsibility.

This project intentionally does NOT configure some security enhancements so as
to minimise the risk of users inadvertently locking themselves out of their own
servers.

You may want to also consider disabling root login, mandating SSH key based
authentication, adding SSH monitoring tools such as `fail2ban` and adding a
centralised logging server.

### Backups

This project does not set up backups. You should ensure that you have a robust
backup strategy in place that you check regularly.

### Load balancing

This project will work out of the box on small scale production environments
when using certbot, such as when the 'frontend app' and 'backend app' are
co-located (like the 'dev' environment), or when the 'frontend app' and
'backend app' are each provisioned to a separate host.

However, you will need to modify this project if you want to horizontally scale
to more hosts behind a load balancer. Production certificates are set to be
generated by running [certbot](https://certbot.eff.org) in `standalone` mode.
This approach won't work if we have several servers behind a load balancer, since
a different server may respond to the LetsEncrypt challenge.

### Certificate Update Process

The certificates in the sample Ansible production environment are regenerated
with certbot in `standalone` mode. This approach means the NGINX webserver gets
automatically stopped briefly around every 60 days. If this doesn't suit your
needs, consider using a different approach for generating production certificates.

### Automatic dnf updates

The `base` role is set to configure `dnf-automatic` to automatically install updates.
This should help ensure that servers are up to date, but unmanaged system updates
may introduce an element of risk and instability which may not be appropriate
for your use case.

If you'd like to disable automatic package updates, set
`base_install_updates_automatically` to `false` in `environments/prod/group_vars/all`. 
