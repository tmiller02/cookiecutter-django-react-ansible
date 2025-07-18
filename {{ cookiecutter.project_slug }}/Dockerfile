# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04
USER root
WORKDIR /workdir/
# Install base packages for initial ansible provisioning
RUN apt update -y \
    && apt upgrade -y \
    && apt install -y \
    cron \
    gcc \
    libcurl4 \
    libssl-dev \
    openssh-client \
    openssh-server \
    python3-debian \
    python3-dev \
    python3-pip \
    python3-venv \
    rsync \
    sudo \
    systemd \
    systemd-sysv
# Create a shared ssh key for ansible provisioning.
# This image is used for each container, so the ansible 'provisioner' container is able to ssh onto the other containers.
RUN mkdir -p /root/.ssh && \
    ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -N "" && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
# Copy Python requirements for Ansible provisioning
COPY provisioning/requirements.txt provisioning/requirements.txt
# Create Ansible Python virtual environment and install required packages
RUN python3.12 -m venv ~/provision_venv --system-site-packages && \
    ~/provision_venv/bin/pip install pip==25.0 wheel==0.44.0 setuptools==80.9.0 && \
    ~/provision_venv/bin/pip install -r provisioning/requirements.txt
# Copy Ansible Galaxy requirements file
COPY provisioning/requirements.yml provisioning/requirements.yml
# Install Ansible roles and collections
RUN ~/provision_venv/bin/ansible-galaxy install -r provisioning/requirements.yml
# Start systemd when container launches
CMD [ "/sbin/init" ]