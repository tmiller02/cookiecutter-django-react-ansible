FROM ubuntu:22.04
USER root
RUN apt-get update \
    && apt-get install -y \
    systemd \
    systemd-sysv \
    openssh-server \
    sudo \
    whois \
    iputils-ping
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
COPY provisioning/podman_dev_key.pub /root/.ssh/authorized_keys
COPY provisioning/dev_ssh_config /root/.ssh/config
EXPOSE 22
CMD [ "systemd" ]