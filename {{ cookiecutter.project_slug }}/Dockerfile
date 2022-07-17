FROM ubuntu:22.04
RUN apt-get update \
    && apt-get install -y \
    systemd \
    systemd-sysv \
    openssh-server \
    sudo \
    whois \
    iputils-ping
RUN useradd --create-home --password $(mkpasswd -m sha-512 vagrant) -s /bin/bash vagrant
RUN usermod -aG sudo vagrant
RUN mkdir /home/vagrant/.ssh
# Insert the default insecure Vagrant ssh key (Vagrant will detect and replace this when provisioning an environment)
RUN wget "https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub" -O /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN sed -i 's/[#]*PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
CMD ["/lib/systemd/systemd"]
